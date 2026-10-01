import 'package:flutter/material.dart';

class EducationScreen extends StatelessWidget {
  const EducationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Education")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "Bachelor of Computer Applications (India)\n\n"
          "Certifications:\n"
          "• ISTQB\n"
          "• Agile\n"
          "• Digital Marketing\n"
          "• Full Stack Development\n"
          "• Project Management\n"
          "• SFI Swedish Language (Beginner)",
        ),
      ),
    );
  }
}
