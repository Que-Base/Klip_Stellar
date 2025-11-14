import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:klip/core/routes/app_router.dart';

class EmptyView extends StatelessWidget {
  const EmptyView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            context.push(AppRoutes.homeRoute);
          },
          child: Text("Navigate"),
        ),
      ),
    );
  }
}
