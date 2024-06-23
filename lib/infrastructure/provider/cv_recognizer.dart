import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:job_match_app/domain/models/user_model.dart';

final userProvider = StateProvider<User?>((ref) => null);

class CVRecognizer {
  final Dio _dio = Dio();

  Future<String> recognizeCV(String filePath, WidgetRef ref) async {
    try {
      FormData formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(filePath),
      });

      Response response = await _dio.post(
        'https://jobmatch-service-production.up.railway.app/ai/pdfExtractor',
        data: formData,
      );

      if (response.statusCode == 201) {
        Map<String, dynamic> data =
            jsonDecode(response.data) as Map<String, dynamic>;

        User user = User.fromJson(data);
        setUser(ref, user);
        return "Información cargada exitosamente";
      } else {
        throw Exception('Error en la solicitud');
      }
    } catch (e) {
      throw Exception('Error en la solicitud: $e');
    }
  }
}

Future<void> setUser(WidgetRef ref, User user) async {
  ref.read(userProvider.notifier).state = user;
}
