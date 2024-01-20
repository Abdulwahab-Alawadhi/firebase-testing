import 'package:firebase/app/config/routes/named_routes.dart';
import 'package:firebase/app/modules/chats/domain/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ChatUserCard extends StatelessWidget {
  const ChatUserCard({
    super.key,
    required this.user,
  });

  final MyUser user;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(user.username),
        subtitle: Text(user.email),
        onTap: () {
          context.goNamed(MyNamedRoutes.chatDetails, extra: user);
        },
      ),
    );
  }
}
