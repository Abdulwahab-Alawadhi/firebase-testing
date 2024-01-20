import 'package:firebase/app/modules/auth/domain/models/provider/controller/auth_controller.dart';
import 'package:firebase/app/modules/auth/domain/models/provider/controller/text_form_provider.dart';
import 'package:firebase/app/modules/auth/domain/models/provider/state/auth_state.dart';
import 'package:firebase/app/modules/auth/domain/repo/auth_repo.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider.autoDispose<User?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges;
});

final authControllerProvider = StateNotifierProvider<AuthController, AuthState>(
  (ref) {
    return AuthController(
      AuthState(),
      ref.watch(authRepositoryProvider),
    );
  },
);

final authFormController =
    ChangeNotifierProvider((ref) => MyAuthFormController());

final checkIfAuthinticated =
    FutureProvider.autoDispose((ref) => ref.watch(authStateProvider));
