import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AIRecognizer {
  final Dio _dio = Dio();

  Future<String> AIRecognization(String request, WidgetRef ref) async {
    try {
      final data = {'[{"user": "Hello", "system": "Hello"}]'};

      final response = await _dio.get(
        'https://jobmatch-service-production.up.railway.app/ai/chatOpen/Parsea esta descripcion en un Json : Compassionate veterinarian with 5+ years of experience in small animal medicine and surgery. Proficient in all aspects of veterinary care, including examinations, vaccinations, laboratory testing, and radiography. Excellent communication and interpersonal skills with both animals and their owners.',
        data: jsonEncode(data),
      );

      return "Información cargada exitosamente";
    } catch (e) {
      throw Exception('Error en la solicitud: $e');
    }
  }
}
