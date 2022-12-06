import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_restapi/features/users/presentation/widgets/user_screen.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("HomePage"),
      ),
      body: Center(
        child: ElevatedButton(
          child: const Text("See Users"),
          onPressed: () {
            Navigator.of(context).push(
                CupertinoPageRoute(builder: (context) => const UserScreen()));
          },
        ),
      ),
    );
  }
}
