import 'package:firebase/app/core/extenstions/build_context_extenstion.dart';
import 'package:firebase/app/modules/chats/domain/models/user_model.dart';
import 'package:firebase/app/modules/one_to_one_chat/domain/helper/image_picker.dart';
import 'package:firebase/app/modules/one_to_one_chat/domain/models/message.dart';
import 'package:firebase/app/modules/one_to_one_chat/domain/providers/message_providers.dart';
import 'package:firebase/app/modules/one_to_one_chat/domain/repo/message_repo.dart';
import 'package:firebase/app/modules/one_to_one_chat/widgets/loading_effect.dart';
import 'package:firebase/app/modules/one_to_one_chat/widgets/message_bubble.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MessagingBodyView extends ConsumerStatefulWidget {
  final MyUser selectedUser;

  const MessagingBodyView({
    super.key,
    required this.selectedUser,
  });

  @override
  ConsumerState<MessagingBodyView> createState() => _MessagingBodyViewState();
}

class _MessagingBodyViewState extends ConsumerState<MessagingBodyView>
    with PickAnImageBottomSheet {
  final _sendMessageController = TextEditingController();

  @override
  void dispose() {
    _sendMessageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final messagingRepo = ref.read(messagingRepositoryProvider);

    return Column(
      children: [
        Expanded(
          child: StreamBuilder<List<Message>>(
            stream: messagingRepo.messagesStream(
              senderId: FirebaseAuth.instance.currentUser!.uid,
              receiverId: widget.selectedUser.userId,
            ),
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                debugPrint(snapshot.error.toString());
                return Center(
                    child: Text('Error fetching messages: ${snapshot.error}'));
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(child: CircularProgressIndicator());
              }
              final messages = snapshot.data ?? [];
              return ListView.builder(
                reverse: true,
                itemCount: messages.length,
                itemBuilder: (context, index) =>
                    MessageBubble(message: messages[index]),
              );
            },
          ),
        ),
        const LoadingEffect(),
        _buildMessageInput(context, widget.selectedUser.userId, messagingRepo),
      ],
    );
  }

  Widget _buildMessageInput(
      BuildContext context, String userId, MessagingRepository messagingRepo) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          IconButton(
              onPressed: () => showOptions(
                    context,
                    senderId: FirebaseAuth.instance.currentUser!.uid,
                    receiverId: userId,
                  ),
              icon: const Icon(Icons.add_a_photo)),
          Expanded(
            child: TextField(
              controller: _sendMessageController,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Type your message',
                hintStyle: context.textTheme.bodySmall,
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 10.0, horizontal: 6),
              ),
            ),
          ),
          Consumer(builder: (context, ref, child) {
            final messageProvider =
                ref.read(chatMessageStateNotifierProvider.notifier);
            return IconButton(
              onPressed: () async {
                try {
                  await messageProvider.sendMessage(
                    senderId: FirebaseAuth.instance.currentUser!.uid,
                    receiverId: userId,
                    message: _sendMessageController.text,
                  );

                  _sendMessageController.clear();
                } catch (e) {
                  WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                    context.showSnackbar(
                      'Error sending message: $e',
                    );
                  });
                }
              },
              icon: const Icon(Icons.send),
            );
          }),
        ],
      ),
    );
  }
}
