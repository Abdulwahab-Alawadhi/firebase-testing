import 'package:firebase/app/modules/one_to_one_chat/domain/providers/controller/chate_message_controller.dart';
import 'package:firebase/app/modules/one_to_one_chat/domain/providers/state/chate_message_state.dart';
import 'package:firebase/app/modules/one_to_one_chat/domain/repo/message_repo.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final messagingRepositoryProvider = Provider<MessagingRepository>((ref) {
  return MessagingRepository();
});

final chatMessageStateNotifierProvider =
    StateNotifierProvider<ChateMessageStateNotifier, ChateMessageState>(
  (ref) => ChateMessageStateNotifier(
    ChateMessageState(),
    ref.read(
      messagingRepositoryProvider,
    ),
  ),
);
