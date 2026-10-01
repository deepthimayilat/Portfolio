import 'package:flutter/material.dart';

class SkillsScreen extends StatelessWidget {
  const SkillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Skills")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _skillCategory("Programming", {
              "Python": 0.8,
              "JavaScript": 0.75,
              "COBOL": 0.9,
              "HTML/CSS": 0.85,
            }),
            _skillCategory("Testing", {
              "Functional Testing": 0.9,
              "Regression Testing": 0.85,
              "UAT": 0.8,
              "Automation": 0.6,
            }),
            _skillCategory("Mainframe", {
              "COBOL": 0.9,
              "JCL": 0.85,
              "IMS/DB2": 0.8,
              "CICS": 0.75,
            }),
            _skillCategory("Tools", {
              "GitHub": 0.85,
              "JIRA": 0.8,
              "Salesforce": 0.75,
              "Postman": 0.8,
            }),
            _skillCategory("CI/CD", {
              "Octopus Deploy": 0.7,
              "IBM UCD": 0.75,
              "Gearset": 0.7,
            }),
          ],
        ),
      ),
    );
  }

  Widget _skillCategory(String title, Map<String, double> skills) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            ...skills.entries.map(
              (entry) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(entry.key),
                  const SizedBox(height: 4),
                  LinearProgressIndicator(
                    value: entry.value,
                    color: const Color(0xFF0066CC),
                    backgroundColor: Colors.grey.shade300,
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
