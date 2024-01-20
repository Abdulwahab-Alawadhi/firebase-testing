import 'package:firebase/app/config/routes/named_routes.dart';
import 'package:firebase/app/modules/auth/domain/models/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authStateProvider = ref.watch(authControllerProvider.notifier);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          color: Colors.green,
          height: 300,
          width: 300,
        ),
        IconButton(
            onPressed: () {
              authStateProvider.signOut().whenComplete(
                  () => context.pushNamed(MyNamedRoutes.register));
            },
            icon: const Icon(Icons.exit_to_app))
      ],
    );
  }
}
