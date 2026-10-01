import 'package:flutter/material.dart';

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Background")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "With over 10 years of experience across Sweden, Germany, India, "
          "and global teams, I bring a blend of technical depth and "
          "cross-functional leadership, working in QA, delivery, mainframe, "
          "and web development.",
        ),
      ),
    );
  }
}
