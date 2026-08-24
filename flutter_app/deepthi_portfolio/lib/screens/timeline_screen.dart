import 'package:flutter/material.dart';

class TimelineScreen extends StatelessWidget {
  const TimelineScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> timeline = [
      {"year": "2026", "event": "Software Test Engineer – Electrolux"},
      {"year": "2025", "event": "QA Tester / Release Specialist – Arjo AB"},
      {"year": "2024", "event": "Software Developer Intern – Fyaril AB"},
      {"year": "2022", "event": "Delivery Lead – Winnopro Technologies"},
      {"year": "2020", "event": "Senior Developer – Allstate"},
      {"year": "2016", "event": "Software Developer – L&T Infotech"},
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Career Timeline")),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: timeline.length,
        itemBuilder: (context, index) {
          final item = timeline[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.symmetric(vertical: 10),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: CircleAvatar(
                backgroundColor: const Color(0xFF0066CC),
                child: Text(
                  item["year"]!,
                  style: const TextStyle(color: Colors.white, fontSize: 11),
                ),
              ),
              title: Text(item["event"]!),
            ),
          );
        },
      ),
    );
  }
}
