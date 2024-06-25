import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:job_match_app/domain/models/chats/chat_model.dart';
import 'package:job_match_app/domain/models/chats/message_model.dart';
import 'package:job_match_app/presentation/screens/Home/UserViews/home_view_user.dart';
import 'package:job_match_app/presentation/widgets/HomePage/Chat/chat_screen.dart';
import 'package:job_match_app/presentation/widgets/HomePage/Chat/user_model.dart';
import 'package:job_match_app/presentation/widgets/HomePage/General/theme_button.dart';
import 'custom_container.dart';

class MainChatScreen extends StatelessWidget {
  const MainChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = size.height;
    double width = size.width;

    List<User> users = User.users;
    List<Chat> chats = Chat.chats;

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.topLeft,
            colors: [
              Color.fromARGB(255, 255, 104, 58),
              Color.fromARGB(255, 218, 10, 79),
              Color.fromARGB(255, 255, 104, 58),
            ],
          ),
        ),
        child: Scaffold(
          appBar: const _CustomAppBar(),
          backgroundColor: Colors.transparent,
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _ChatContacts(height: height, users: users),
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    _ChatMessages(height: height, chats: chats),
                    _CustomBottomNavBar(width: width),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ChatContacts extends StatelessWidget {
  const _ChatContacts({
    super.key,
    required this.height,
    required this.users,
  });

  final double height;
  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      height: height * 0.125,
      margin: const EdgeInsets.only(
        left: 20.0,
        top: 20.0,
      ),
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: users.length,
        itemBuilder: (context, index) {
          User user = users[index];
          return Container(
            margin: const EdgeInsets.only(right: 10),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(user.imageUrl),
                ),
                const SizedBox(height: 10),
                Text(
                  user.name,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _ChatMessages extends StatelessWidget {
  const _ChatMessages({
    super.key,
    required this.height,
    required this.chats,
  });

  final double height;
  final List<Chat> chats;

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      height: height * 0.7,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: chats.length,
        itemBuilder: (context, index) {
          User user = chats[index].users!.where((user) => user.id != '1').first;
          chats[index]
              .messages!
              .sort((a, b) => b.createdAt.compareTo(a.createdAt));
          Message lastMessage = chats[index].messages!.first;

          return ListTile(
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ChatScreen(
                    chat: chats[index],
                    user: user,
                  ),
                ),
              );
            },
            contentPadding: EdgeInsets.zero,
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(user.imageUrl),
            ),
            title: Text(
              '${user.name} ${user.surname}',
              style: TextStyle(
                color: Colors.grey[550],
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(
              lastMessage.text,
              maxLines: 1,
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Text(
              '${lastMessage.createdAt.hour}:${lastMessage.createdAt.minute}',
              style: const TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
              ),
            ),
          );
        },
      ),
    );
  }
}

class _CustomBottomNavBar extends StatelessWidget {
  const _CustomBottomNavBar({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 65,
        width: width * 0.50,
        margin: const EdgeInsets.only(bottom: 30.0),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary.withAlpha(30),
          borderRadius: BorderRadius.circular(15.0),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(
                  Icons.person,
                ),
              ),
            ),
            const SizedBox(width: 20),
            Material(
              color: Colors.transparent,
              child: IconButton(
                onPressed: () {},
                iconSize: 30,
                icon: const Icon(Icons.business),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const _CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back_ios_rounded),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const UserScreen(),
          ));
        },
      ),
      title: Text(
        'Chats',
        style: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: false,
      elevation: 0,
      actions: const [
        ThemeButton(),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
