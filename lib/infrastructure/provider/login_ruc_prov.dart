import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginWithRucProvider = Provider<LoginRucProvider>((ref) {
  return LoginRucProvider();
});

class LoginRucProvider {
  final Dio _dio = Dio();

  Future<bool> verifyRuc(String ruc) async {
    Timer.periodic(
        const Duration(days: 1), (Timer t) => print('Timer is working'));
    try {
      final response = await _dio.get(
          'https://api.sunat.dev/ruc-premium/20100047218?apikey=B6IWa9QHQs7jOrrmLfBsj4xQ1K2f4gpFFMT82av4pjf4ExXP9CfYOyLcGfzEwGOR');
      if (response.statusCode == 200) {
        return true;
      } else {
        throw false;
      }
    } catch (e) {
      throw Exception('Error : $e');
    }
  }
}
