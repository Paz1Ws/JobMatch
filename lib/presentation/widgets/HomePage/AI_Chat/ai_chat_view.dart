import 'package:flutter/material.dart';
import 'package:job_match_app/presentation/widgets/HomePage/AI_Chat/ImageModel/ImageChatHomepage.dart';
import 'package:job_match_app/presentation/widgets/HomePage/AI_Chat/TextModel/TextChatHomepage.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/theme_button.dart';

class ChatScreenState extends StatefulWidget {
  const ChatScreenState({super.key});

  @override
  State<ChatScreenState> createState() => _ChatScreenStateState();
}

class _ChatScreenStateState extends State<ChatScreenState> {
  final bool _isvisionmodel = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Jc AI Assistent'),
        actions: const [
          ThemeButton(),
        ],
      ),
      body: AITextChat(),
    );
  }
}
