import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:html' as html;

void main() {
  runApp(const RecruitingPortfolioApp());
}

class RecruitingPortfolioApp extends StatelessWidget {
  const RecruitingPortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Deepthi Mayilat | TalentStream Hub',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0F172A), // Slate 900
        primaryColor: const Color(0xFF38BDF8), // Sky blue accent
        cardColor: const Color(0xFF1E293B), // Slate 800
        textTheme: const TextTheme(
          displayMedium: TextStyle(fontSize: 32, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5),
          titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8)),
          bodyLarge: TextStyle(fontSize: 15, color: Color(0xFF94A3B8), height: 1.6),
        ),
      ),
      home: const PortfolioDashboard(),
    );
  }
}

class PortfolioDashboard extends StatefulWidget {
  const PortfolioDashboard({Key? key}) : super(key: key);

  @override
  State<PortfolioDashboard> createState() => _PortfolioDashboardState();
}

class _PortfolioDashboardState extends State<PortfolioDashboard> {
  Map<String, dynamic> data = {};
  bool loading = true;

  @override
  void initState() {
    super.initState();
    loadAssetData();
  }

  Future<void> loadAssetData() async {
    try {
      final String jsonStr = await rootBundle.loadString('assets/data.json');
      setState(() {
        data = json.decode(jsonStr);
        loading = false;
      });
    } catch (e) {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator(color: Color(0xFF38BDF8))));
    }
    if (data.isEmpty) {
      return const Scaffold(body: Center(child: Text("Data rendering anomaly. Verify data.json placement.")));
    }

    final isMobile = MediaQuery.of(context).size.width < 900;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Top Conversion Banner Hook
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
              color: const Color(0xFF0EA5E9), // Sky 500 accent line
              child: Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 12,
                  children: [
                    const Icon(Icons.verified_user, color: Colors.white, size: 18),
                    Text(
                      data['work_permit'] ?? '',
                      style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ),

            // Hero Branding Profile Block
            Container(
              padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFF0F172A), Color(0xFF1E1B4B)], // Indigo dark blending
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                child: Container(
                  constraints: const BoxConstraints(maxWidth: 1100),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF38BDF8).withOpacity(0.15),
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: const Color(0xFF38BDF8).withOpacity(0.4), width: 1),
                        ),
                        child: const Text("THE 12-YEAR RETROSPECTIVE", style: TextStyle(color: Color(0xFF38BDF8), fontSize: 11, fontWeight: FontWeight.bold, letterSpacing: 1.5)),
                      ),
                      const SizedBox(height: 20),
                      Text(data['name'] ?? '', style: const TextStyle(fontSize: 48, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: -1)),
                      const SizedBox(height: 12),
                      Text(
                        data['title'] ?? '',
                        textAlign: TextAlign.center,
                        style: const TextStyle(fontSize: 18, color: Color(0xFFE2E8F0), fontWeight: FontWeight.w400, height: 1.4),
                      ),
                      const SizedBox(height: 32),
                      Wrap(
                        spacing: 16,
                        runSpacing: 12,
                        alignment: WrapAlignment.center,
                        children: [
                          QuickActionPill(icon: Icons.location_on, label: data['location'] ?? ''),
                          QuickActionPill(icon: Icons.email, label: data['email'] ?? ''),
                          QuickActionPill(icon: Icons.share, label: data['linkedin'] ?? ''),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Core layout matrix setup
            Center(
              child: Container(
                constraints: const BoxConstraints(maxWidth: 1100),
                padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: isMobile 
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: buildLayoutBlocks(),
                    )
                  : Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(flex: 3, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: buildLeftBlocks())),
                        const SizedBox(width: 40),
                        Expanded(flex: 2, child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: buildRightBlocks())),
                      ],
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSummaryCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFF1E293B),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF334155), width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Why We should Talk", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white)),
          const SizedBox(height: 12),
          Text(data['summary'] ?? '', style: Theme.of(context).textTheme.bodyLarge),
          const SizedBox(height: 16),
          const Text("Languages", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFF38BDF8))),
          const SizedBox(height: 6),
          Text(data['languages'] ?? '', style: const TextStyle(fontSize: 14, color: Color(0xFF94A3B8))),
        ],
      ),
    );
  }

  List<Widget> buildLayoutBlocks() {
    return [
      buildSummaryCard(),
      const SizedBox(height: 32),
      const SectionHeader(title: "Where I've Made an Impact"),
      const SizedBox(height: 20),
      if (data['experience'] != null)
        ...((data['experience'] as List).map((job) => ExperienceCard(job: job)).toList()),
      const SizedBox(height: 32),
      ...buildRightBlocks(),
    ];
  }

  List<Widget> buildLeftBlocks() {
    return [
      buildSummaryCard(),
      const SizedBox(height: 40),
      const SectionHeader(title: "Where I've Made an Impact"),
      const SizedBox(height: 20),
      if (data['experience'] != null)
        ...((data['experience'] as List).map((job) => ExperienceCard(job: job)).toList()),
    ];
  }

  List<Widget> buildRightBlocks() {
    return [
      const SectionHeader(title: "What I Bring to the Table"),
      const SizedBox(height: 20),
      if (data['skills'] != null && data['skills'] is Map)
        ...((data['skills'] as Map).entries.map((entry) {
          final List<dynamic> skillList = entry.value is List ? entry.value as List : [];
          return SkillCategoryBlock(title: entry.key.toString(), skills: skillList);
        }).toList()),
      const SizedBox(height: 32),
      
      const SectionHeader(title: "The Continuous Upgrade"),
      const SizedBox(height: 16),
      if (data['certifications'] != null)
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(12)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: (data['certifications'] as List).map((cert) => Padding(
              padding: const EdgeInsets.only(bottom: 12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.only(top: 2.0),
child: Icon(Icons.verified, size: 16, color: Color(0xFF10B981)),
),
const SizedBox(width: 12),
Expanded(child: Text(cert.toString(), style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4))),
],
),
)).toList(),
),
),
const SizedBox(height: 32),
const SectionHeader(title: "Roots of the Craft"),
const SizedBox(height: 16),
if (data['education'] != null)
Container(
width: double.infinity,
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(12)),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: (data['education'] as List).map((edu) => Padding(
padding: const EdgeInsets.only(bottom: 12.0),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Padding(
padding: EdgeInsets.only(top: 2.0),
child: Icon(Icons.school, size: 16, color: Color(0xFF38BDF8)),
),
const SizedBox(width: 12),
Expanded(child: Text(edu.toString(), style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4))),
],
),
)).toList(),
),
),
const SizedBox(height: 32),
const SectionHeader(title: "The Pat on the Back Section"),
const SizedBox(height: 16),
if (data['awards'] != null)
Container(
width: double.infinity,
padding: const EdgeInsets.all(20),
decoration: BoxDecoration(color: const Color(0xFF1E293B), borderRadius: BorderRadius.circular(12)),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: (data['awards'] as List).map((award) => Padding(
padding: const EdgeInsets.only(bottom: 12.0),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Padding(
padding: EdgeInsets.only(top: 2.0),
child: Icon(Icons.emoji_events, size: 16, color: Color(0xFFF59E0B)),
),
const SizedBox(width: 12),
Expanded(child: Text(award.toString(), style: const TextStyle(color: Colors.white, fontSize: 14, height: 1.4))),

],
),
)).toList(),
),
),
];
}
}
class SectionHeader extends StatelessWidget {
final String title;
const SectionHeader({Key? key, required this.title}) : super(key: key);
@override
Widget build(BuildContext context) {
return Text(
title,
style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w800, color: Colors.white, letterSpacing: -0.5),
);
}
}
class QuickActionPill extends StatelessWidget {
final IconData icon;
final String label;
const QuickActionPill({Key? key, required this.icon, required this.label}) : super(key: key);
@override
Widget build(BuildContext context) {
final isLinkedin = icon == Icons.share || label.toLowerCase().contains("linkedin");
return InkWell(
onTap: () {
if (isLinkedin) {
html.window.open('linkedin.com', '_blank');
}
},
borderRadius: BorderRadius.circular(30),
child: Container(
padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
decoration: BoxDecoration(
color: const Color(0xFF1E293B),
borderRadius: BorderRadius.circular(30),
border: Border.all(color: const Color(0xFF334155)),
),
child: Row(
mainAxisSize: MainAxisSize.min,
children: [
Icon(icon, size: 14, color: const Color(0xFF38BDF8)),
const SizedBox(width: 8),
Text(
label,
style: TextStyle(
color: isLinkedin ? const Color(0xFF38BDF8) : Colors.white70,
fontSize: 13,
fontWeight: FontWeight.w500,
decoration: isLinkedin ? TextDecoration.underline : TextDecoration.none,
),
),
],
),
),
);
}
}
class ExperienceCard extends StatelessWidget {
final Map<String, dynamic> job;
const ExperienceCard({Key? key, required this.job}) : super(key: key);
@override
Widget build(BuildContext context) {
final bullets = job['bullets'] as List? ?? [];
return Container(
width: double.infinity,
margin: const EdgeInsets.only(bottom: 24),
padding: const EdgeInsets.all(24),
decoration: BoxDecoration(
color: const Color(0xFF1E293B),
borderRadius: BorderRadius.circular(16),
border: Border.all(color: const Color(0xFF334155), width: 1),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(job['role'] ?? '', style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
const SizedBox(height: 4),
Text(job['company'] ?? '', style: const TextStyle(fontSize: 15, color: Color(0xFF38BDF8), fontWeight: FontWeight.w500)),
],
),
),
const SizedBox(width: 8),
Container(
padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
decoration: BoxDecoration(color: const Color(0xFF0F172A), borderRadius: BorderRadius.circular(12)),
child: Text(job['period'] ?? '', style: const TextStyle(fontSize: 11, color: Color(0xFF94A3B8), fontWeight: FontWeight.bold)),
)
],
),
const SizedBox(height: 16),
...bullets.map((bullet) => Padding(
padding: const EdgeInsets.only(bottom: 8.0),
child: Row(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
const Padding(
padding: EdgeInsets.only(top: 6.0),
child: Icon(Icons.arrow_forward_ios, size: 10, color: Color(0xFF0EA5E9)),
),
const SizedBox(width: 10),
Expanded(child: Text(bullet.toString(), style: const TextStyle(color: Color(0xFF94A3B8), fontSize: 14, height: 1.5))),
],
),
)).toList(),
],
),
);
}
}
class SkillCategoryBlock extends StatelessWidget {
final String title;
final List skills;
const SkillCategoryBlock({Key? key, required this.title, required this.skills}) : super(key: key);
@override
Widget build(BuildContext context) {
return Container(
width: double.infinity,
margin: const EdgeInsets.only(bottom: 16),
padding: const EdgeInsets.all(16),
decoration: BoxDecoration(
color: const Color(0xFF0F172A),
borderRadius: BorderRadius.circular(12),
border: Border.all(color: const Color(0xFF1E293B), width: 1),
),
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text(title, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Color(0xFFE2E8F0))),
const SizedBox(height: 10),
Wrap(
spacing: 8,
runSpacing: 8,
children: skills.map((skill) => Container(
padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
decoration: BoxDecoration(
color: const Color(0xFF1E293B),
borderRadius: BorderRadius.circular(6),
),
child: Text(skill.toString(), style: const TextStyle(color: Color(0xFF38BDF8), fontSize: 12, fontWeight: FontWeight.w500)),
)).toList(),
),
],
),
);
}
}
