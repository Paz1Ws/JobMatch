import 'package:flutter_dotenv/flutter_dotenv.dart';

void loadEnv() {
  dotenv.load();
}

const String apikey = String.fromEnvironment('GEMINI_API_KEY');
