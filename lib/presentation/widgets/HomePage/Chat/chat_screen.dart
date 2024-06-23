import 'package:flutter/material.dart';
import 'package:job_match_app/domain/models/chats/chat_model.dart';
import 'package:job_match_app/presentation/widgets/HomePage/Chat/custom_container.dart';
import 'package:job_match_app/domain/models/chats/message_model.dart';
import 'package:job_match_app/presentation/widgets/HomePage/Chat/user_model.dart';

// ignore: must_be_immutable
class ChatScreen extends StatefulWidget {
  late User user;
  late Chat chat;

  ChatScreen({super.key, required this.user, required this.chat});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  ScrollController scrollController = ScrollController();
  TextEditingController textEditingController = TextEditingController();
  late String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.topRight,
          colors: [
            Color.fromARGB(255, 255, 104, 58),
            Color.fromARGB(255, 218, 10, 79),
            Color.fromARGB(255, 255, 104, 58),
          ],
        ),
      ),
      child: Scaffold(
        appBar: _CustomAppBar(user: widget.user),
        backgroundColor: Colors.transparent,
        body: CustomContainer(
          height: MediaQuery.of(context).size.height,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              
              _ChatMessages(
                scrollController: scrollController,
                chat: widget.chat,
              ),
              TextFormField(
                cursorColor: Colors.amber,
                controller: textEditingController,
                onChanged: (value) {
                  setState(() {
                    text = value;
                  });
                },
                style: Theme.of(context).textTheme.bodyMedium,
                decoration: InputDecoration(
                  filled: true,
                  fillColor:
                      Theme.of(context).colorScheme.secondary.withAlpha(100),
                  hintText: 'Type here...',
                  hintStyle: Theme.of(context).textTheme.bodyMedium,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.all(20.0),
                  suffixIcon: _buildIconButton(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  IconButton _buildIconButton(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.send),
      color: Colors.amber,
      onPressed: () {
        Message message = Message(
          senderId: '1',
          recipientId: '2',
          text: text,
          createdAt: DateTime.now(),
        );
        List<Message> messages = List.from(widget.chat.messages!)..add(message);
        messages.sort((a, b) => b.createdAt.compareTo(a.createdAt));
        setState(() {
          widget.chat = widget.chat.copyWith(messages: messages);
        });

        scrollController.animateTo(
          scrollController.position.minScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeIn,
        );
        textEditingController.clear();
      },
    );
  }
}

class _ChatMessages extends StatelessWidget {
  const _ChatMessages({
    super.key,
    required this.scrollController,
    required this.chat,
  });

  final ScrollController scrollController;
  final Chat chat;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        reverse: true,
        controller: scrollController,
        itemCount: chat.messages!.length,
        itemBuilder: (context, index) {
          Message message = chat.messages![index];
          return Align(
            alignment: (message.senderId == '1')
                ? Alignment.centerLeft
                : Alignment.centerRight,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.66,
              ),
              padding: const EdgeInsets.all(10.0),
              margin: const EdgeInsets.symmetric(vertical: 5.0),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 255, 104, 58),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: Text(
                message.text,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({
    super.key,
    required this.user,
  });

  final User user;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${user.name} ${user.surname}',
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 5),
          Container(
            width: 90,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(right: 45),
            child: Text(
              'Online',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ),
        ],
      ),
      elevation: 0,
      actions: [
        Container(
          margin: const EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            backgroundImage: NetworkImage(user.imageUrl),
          ),
        )
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}
