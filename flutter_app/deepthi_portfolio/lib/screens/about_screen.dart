import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About Me")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "I am Deepthi, a multi-domain software professional with experience "
          "I’ve built a strong 12‑year career across QA testing, mainframe development, and project/release management in embedded systems and software for web and mobile applications. I enjoy turning complex challenges into successful outcomes by combining technical expertise, quality‑driven delivery, and clear, collaborative communication. My experience spans testing, production support, incident management, defect analysis, and leading Agile Scrum teams through end‑to‑end delivery. Over the years, I’ve worked across industries such as healthcare, entertainment, supply chain, finance, IoT, and consumer appliances, giving me a broad perspective and the ability to adapt quickly to new environments. I thrive in multicultural teams and believe in leading through trust, empowerment, and accountability—creating high‑performing teams that consistently deliver meaningful results and long‑lasting business value.",
        ),
      ),
    );
  }
}
