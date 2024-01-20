import 'package:firebase/app/modules/chats/domain/models/user_model.dart';
import 'package:firebase/app/modules/one_to_one_chat/widgets/message_body_view.dart';
import 'package:firebase/app/modules/shared/custom_appbar.dart';
import 'package:flutter/material.dart';

class OneToOneMessagingScreen extends StatelessWidget {
  final MyUser user;

  const OneToOneMessagingScreen({super.key, required this.user});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(
        appBarTitle: Text(user.username.toString()),
        showLeading: true,
      ),
      body: MessagingBodyView(selectedUser: user),
    );
  }
}
