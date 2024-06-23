import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_generative_ai/google_generative_ai.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:job_match_app/presentation/widgets/HomePage/AI_Chat/api/gemini_apikey.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class AIImageChat extends StatefulWidget {
  const AIImageChat({
    super.key,
  });

  @override
  State<AIImageChat> createState() => _AIImageChatState();
}

class _AIImageChatState extends State<AIImageChat> {
  //initilization
  late final GenerativeModel _model;
  late final GenerativeModel _visionModel;
  late final ChatSession _chat;
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  final FocusNode _textFieldFocus = FocusNode();
  final List<({Image? image, String? text, bool fromUser})> _generatedContent =
      <({Image? image, String? text, bool fromUser})>[];

  //loading state
  bool _loading = false;

  //initfunction
  @override
  void initState() {
    super.initState();
    _model = GenerativeModel(model: 'gemini-pro', apiKey: apikey);
    _visionModel = GenerativeModel(
      model: 'gemini-pro-vision',
      apiKey: apikey,
    );
    _chat = _model.startChat();
  }

  //other function
  void _scrollDown() {
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(
          milliseconds: 750,
        ),
        curve: Curves.easeOutCirc,
      ),
    );
  }

  Future<void> _sendImagePrompt(String message) async {
    setState(() {
      _loading = true;
    });
    try {
      final ImagePicker picker = ImagePicker();
      // Show options for the user to select image from gallery or capture from camera
      final ImageSource? source = await showDialog<ImageSource>(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Select Image Source'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                GestureDetector(
                  child: const Row(
                    children: [
                      Icon(Icons.photo_library),
                      SizedBox(width: 20),
                      Text('Gallery'),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pop(ImageSource.gallery);
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: GestureDetector(
                    child: const Row(
                      children: [
                        Icon(Icons.camera_alt_outlined),
                        SizedBox(width: 20),
                        Text('Camera'),
                      ],
                    ),
                    onTap: () {
                      Navigator.of(context).pop(ImageSource.camera);
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      );

      if (source == null) {
        setState(() {
          _loading = false;
        });
        return;
      }

      final XFile? image = await picker.pickImage(source: source);
      if (image == null) {
        setState(() {
          _loading = false;
        });
        return;
      }
      final ByteData bytes =
          await image.readAsBytes().then((bytes) => bytes.buffer.asByteData());
      final content = [
        Content.multi([
          TextPart(message),
          DataPart('image/jpeg', bytes.buffer.asUint8List()),
        ])
      ];
      _generatedContent.add(
          (image: Image.file(File(image.path)), text: message, fromUser: true));
      var response = await _visionModel.generateContent(content);
      var text = response.text;
      _generatedContent.add((image: null, text: text, fromUser: false));

      if (text == null) {
        _showError('No response from API.');
        return;
      } else {
        setState(() {
          _loading = false;
          _scrollDown();
        });
      }
    } catch (e) {
      _showError(e.toString());
      setState(() {
        _loading = false;
      });
    } finally {
      _textController.clear();
      setState(() {
        _loading = false;
      });
      // _textFieldFocus.requestFocus();
    }
  }

  void _showError(String message) {
    showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Something went wrong'),
          content: SingleChildScrollView(
            child: SelectableText(message),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            )
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final textFieldDecoration = InputDecoration(
      contentPadding: const EdgeInsets.all(20),
      hintText: 'Enter your message...',
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(
          Radius.circular(10),
        ),
        borderSide: BorderSide(
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(color: Colors.black),
      ),
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(6.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: EdgeInsets.only(top: 50),
                  child: Text(
                    'Jc AI Chat',
                    style: TextStyle(
                        fontSize: 52,
                        fontWeight: FontWeight.bold,
                        color: Colors.orange),
                  ),
                ),
              ),
            ),
            const Center(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Send me a photo!\n   For example:',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),
            Expanded(
              child: _generatedContent.isEmpty // Check if there are no messages
                  ? SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Image.network(
                                'https://cdn2.hubspot.net/hubfs/53/image8-2.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Image.network(
                                'https://blogs.microsoft.com/wp-content/uploads/prod/2012/08/8867.Microsoft_5F00_Logo_2D00_for_2D00_screen.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: SizedBox(
                              width: 200,
                              height: 200,
                              child: Image.network(
                                'https://as1.ftcdn.net/v2/jpg/05/43/99/34/1000_F_543993425_MHEjNzFuemuEzA29DyhbXnwkyAdmscBB.jpg',
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  : ListView.builder(
                      controller: _scrollController,
                      itemBuilder: (context, index) {
                        final content = _generatedContent[index];
                        return MessageWidget(
                          text: content.text,
                          image: content.image,
                          isFromUser: content.fromUser,
                        );
                      },
                      itemCount: _generatedContent.length,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 1,
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: !_loading
                        ? () async {
                            _sendImagePrompt(_textController.text);
                            _textController.clear();
                          }
                        : null,
                    icon: Icon(
                      Icons.image_search_sharp,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      cursorColor: Colors.grey,
                      autofocus: false,
                      focusNode: _textFieldFocus,
                      decoration: textFieldDecoration,
                      controller: _textController,
                    ),
                  ),
                  const SizedBox.square(dimension: 15),
                  if (!_loading)
                    IconButton(
                      onPressed: () async {
                        _textController.clear();
                      },
                      icon: Icon(
                        Icons.send,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.white
                            : Colors.black,
                      ),
                    )
                  else
                    SizedBox(
                      height: 25,
                      width: 25,
                      // color: Colors.red,
                      child: CircularProgressIndicator(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessageWidget extends StatelessWidget {
  const MessageWidget({
    super.key,
    this.image,
    this.text,
    required this.isFromUser,
  });

  final Image? image;
  final String? text;
  final bool isFromUser;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          isFromUser ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Flexible(
            child: Container(
                constraints: const BoxConstraints(maxWidth: 520),
                decoration: BoxDecoration(
                  color: isFromUser
                      ? Theme.of(context).colorScheme.primaryContainer
                      : Theme.of(context).colorScheme.surfaceVariant,
                  borderRadius: BorderRadius.circular(18),
                ),
                padding: const EdgeInsets.symmetric(
                  vertical: 15,
                  horizontal: 20,
                ),
                margin: const EdgeInsets.only(bottom: 8),
                child: Column(children: [
                  if (text case final text?) MarkdownBody(data: text),
                  if (image case final image?) image,
                ]))),
      ],
    );
  }
}
