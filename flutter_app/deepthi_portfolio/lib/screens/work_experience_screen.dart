import 'package:flutter/material.dart';

class WorkExperienceScreen extends StatelessWidget {
  const WorkExperienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Work Experience")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            _section("Electrolux Professional AB (IoT / Embedded Systems)",
                "Software Test Engineer",
                "Jun 2026 – Current | Sweden", [
              "End-to-end functional, regression, and HIL testing.",
              "Firmware flashing and embedded diagnostics.",
              "Telemetry log analysis and machine-to-cloud validation.",
              "Endurance and stress testing.",
              "Collaboration with R&D for control algorithms.",
            ]),
            _section("Arjo AB (Medical Equipment Testing)",
                "QA Tester / Release Specialist",
                "Jan 2025 – Jun 2026 | Sweden", [
              "QA and release validation for medical equipment.",
              "Functional, Regression, UAT and Sanity testing.",
              "Debugging hardware/software inconsistencies.",
              "Defect pattern standardization in Salesforce.",
              "Prototype evaluations with cross-functional teams.",
            ]),
            _section("Fyaril AB (Web Development)", "Software Developer Intern",
                "Sep 2024 – Jan 2025 | Sweden", [
              "Theme-based B2C/B2B e-commerce development.",
              "UX and performance improvements.",
              "Responsive UI implementation.",
              "Testing checkout flows and integrations.",
              "Code reviews and QA walkthroughs.",
            ]),
            _section("Winnopro Technologies (Project Delivery)", "Delivery Lead",
                "Dec 2020 – Sep 2022 | Germany (Remote)", [
              "End-to-end project delivery for global clients.",
              "Agile ceremonies: planning, stand-ups, retrospectives.",
              "Cross-functional team coordination.",
              "Digital product delivery across multiple domains.",
              "Balancing technical leadership and QA.",
            ]),
            _section("Allstate (Mainframe Development)", "Senior Developer",
                "Sep 2016 – Oct 2020 | India", [
              "Development and QA for Auto & Home Insurance systems.",
              "COBOL, JCL, IMS, CICS Web Services, MQ.",
              "Production support and triage across regions.",
              "Automation of mainframe security scanning.",
              "Mentoring and award-winning contributions.",
            ]),
            _section("L&T Infotech (Finance / Mainframe)", "Software Developer",
                "Jun 2014 – Sep 2016 | India", [
              "Development and QA for finance and order-to-cash systems.",
              "Work on ESD, Tier Pricing, and related modules.",
              "COBOL, CICS, JCL, IMS/DB2, VSAM.",
              "Collaboration with global teams.",
              "Recognized with Eagle Team Award.",
            ]),
          ],
        ),
      ),
    );
  }

  Widget _section(String company, String role, String duration,
      List<String> bullets) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(company,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            const SizedBox(height: 4),
            Text(role,
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
            Text(duration,
                style: const TextStyle(
                    fontSize: 13, fontStyle: FontStyle.italic)),
            const SizedBox(height: 10),
            ...bullets.map(
              (b) => Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text("• $b"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
