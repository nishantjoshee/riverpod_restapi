import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_restapi/features/users/presentation/controllers/user_controller.dart';

class UserScreen extends ConsumerWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final users = ref.watch(userControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: users.when(
          data: (data) => ListView(
                children: [
                  ...data.data.map((e) => ListTile(
                        title: Text(e.email),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(e.avatar),
                        ),
                      ))
                ],
              ),
          error: (err, s) => Center(
                  child: ElevatedButton(
                onPressed: () {
                  ref.refresh(userControllerProvider);
                },
                child: Text("$err Click to try again"),
              )),
          loading: () => const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}

class UserSection extends StatelessWidget {
  const UserSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("User List"),
      ),
      body: Center(
        child: Consumer(
          builder: (context, ref, child) {
            return ref.watch(userControllerProvider).when(
                data: (data) => ListView(
                      children: [
                        ...data.data.map((e) => ListTile(
                              title: Text(e.email),
                              trailing: CircleAvatar(
                                backgroundImage: NetworkImage(e.avatar),
                              ),
                            ))
                      ],
                    ),
                error: (err, s) => Center(
                        child: ElevatedButton(
                      onPressed: () {
                        ref.refresh(userControllerProvider);
                      },
                      child: Text("$err Click to try again"),
                    )),
                loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ));
          },
        ),
      ),
    );
  }
}
