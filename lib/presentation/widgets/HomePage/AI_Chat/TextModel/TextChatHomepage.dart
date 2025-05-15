import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:job_match_app/presentation/widgets/HomePage/AI_Chat/api/gemini_apikey.dart';
import 'package:job_match_app/presentation/widgets/HomePage/AI_Chat/ImageModel/ImageChatHomepage.dart';

class AITextChat extends StatefulWidget {
  const AITextChat({
    super.key,
  });
  @override
  _AITextChatState createState() => _AITextChatState();
}

class _AITextChatState extends State<AITextChat> {
  final ScrollController _scrollController = ScrollController();
  late final GenerativeModel _model;
  late final ChatSession _chat;
  final TextEditingController _textController = TextEditingController();
  final List<String> _messages = [];
  List<String> Sampleprompts = [
    "Looking for job search tips or career advice? Ask me anything! 💼🔎",
    "Need guidance on studying techniques or educational resources? I'm here to help! 📚🎓",
  ];
  bool _loading = false;

  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(model: 'gemini-pro', apiKey: apikey);
    _chat = _model.startChat();
  }

  void _scrollDown() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 5),
      curve: Curves.easeOutCirc,
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _sendMessage(String text) async {
    setState(() {
      _loading = true;
      _messages.add(text);
    });
    try {
      final response = _chat.sendMessageStream(
        Content.text(text),
      );
      String generatedText = '';
      _messages.add('');
      await for (final chunk in response) {
        for (int i = 0; i < chunk.text!.length; i++) {
          generatedText += chunk.text![i];
        }
        setState(() {
          _loading = false;
          _messages[_messages.length - 1] = generatedText;
        });
        _scrollDown(); // Scroll down after updating the UI
        await Future.delayed(const Duration(milliseconds: 1));

        _scrollDown();
      }
    } catch (e) {
      // print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _messages.isEmpty
              ? Flexible(
                  fit: FlexFit.loose,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 300),
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Center(
                            child: Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                'Jc AI Chat',
                                style: TextStyle(
                                    fontSize: 52,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.orange),
                              ),
                            ),
                          ),
                          const Center(
                            child: Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
                                'Send me a message! 🚀',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.amber,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      _textController.text = Sampleprompts[0];
                                      _textController.clear();
                                    },
                                    subtitle: Text(Sampleprompts[0]),
                                    title: const Text('Job Search Tips'),
                                    leading: const Icon(Icons.work),
                                  ),
                                ),
                                const SizedBox(height: 12),
                                Card(
                                  child: ListTile(
                                    onTap: () {
                                      _textController.text = Sampleprompts[1];
                                      _textController.clear();
                                    },
                                    subtitle: Text(Sampleprompts[1]),
                                    title: const Text('Study Techniques'),
                                    leading: const Icon(Icons.book),
                                  ),
                                ),
                                const SizedBox(height: 12),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    controller: _scrollController,
                    itemCount: _messages.length,
                    itemBuilder: (context, index) {
                      final message = _messages[index];
                      return Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        child: MessageWidget(
                          text: message,
                        ),
                      );
                    },
                  ),
                ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: const Icon(Icons.image),
                    onPressed: () {
                      // Navigator.of(context).push(
                      //   MaterialPageRoute(
                      //     // builder: (context) => const AIImageChat(),
                      //   ),
                      // );
                    },
                  ),
                  Expanded(
                    child: TextField(
                      controller: _textController,
                      decoration: InputDecoration(
                        hintText: 'Enter your message...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                          borderSide: BorderSide(color: Colors.grey),
                        ),
                      ),
                      cursorColor: Colors.grey, // Set the cursor color
                      onSubmitted: (value) {
                        _sendMessage(value.trim());
                        _textController.clear();
                      },
                    ),
                  ),
                  if (_loading)
                    const SizedBox(
                      height: 30,
                      width: 30,
                      child: CircularProgressIndicator(),
                    )
                  else
                    IconButton(
                      icon: const Icon(Icons.send),
                      onPressed: () {
                        final text = _textController.text.trim();
                        if (text.isNotEmpty) {
                          _sendMessage(text);
                          _textController.clear();
                        }
                      },
                    ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    this.text,
  });

  final String? text;
  @override
  Widget build(BuildContext context) {
    return Flexible(
      fit: FlexFit.tight,
      child: Card(
        color: Theme.of(context)
            .cardColor, // Use primary color as the background color for the card
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: MarkdownBody(
            data: text ?? '',
            styleSheet: MarkdownStyleSheet(
              p: TextStyle(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black),
            ),
          ),
        ),
      ),
    );
  }
}
