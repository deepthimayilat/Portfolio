import 'package:flutter/material.dart';
import 'work_experience_screen.dart';
import 'skills_screen.dart';
import 'timeline_screen.dart';
import 'contact_screen.dart';
import 'about_screen.dart';
import 'background_screen.dart';
import 'education_screen.dart';
import 'hobbies_screen.dart';

class HomeScreen extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback onToggleTheme;

  const HomeScreen({
    super.key,
    required this.isDarkMode,
    required this.onToggleTheme,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: _buildSideMenu(context),
      appBar: AppBar(
        title: const Text(
          "Deepthi Portfolio Hub",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            icon: Icon(isDarkMode ? Icons.dark_mode : Icons.light_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: _buildHomeContent(context),
    );
  }

  Widget _buildHomeContent(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 220,
            width: double.infinity,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0066CC),
                  Color(0xFF7B2FFF),
                ],
              ),
            ),
            alignment: Alignment.center,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Welcome to My Portfolio",
                  style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  "QA • Release • Mainframe • Web • Delivery",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          _menuButton(context, "Work Experience", Icons.work_outline,
              const WorkExperienceScreen()),
          _menuButton(context, "Skills", Icons.bolt_outlined,
              const SkillsScreen()),
          _menuButton(context, "Career Timeline", Icons.timeline,
              const TimelineScreen()),
          _menuButton(context, "Contact", Icons.email_outlined,
              const ContactScreen()),

          const Divider(height: 40),

          _menuButton(context, "About Me", Icons.person_outline,
              const AboutScreen()),
          _menuButton(context, "Background", Icons.info_outline,
              const BackgroundScreen()),
          _menuButton(context, "Education", Icons.school_outlined,
              const EducationScreen()),
          _menuButton(context, "Hobbies", Icons.favorite_outline,
                    HobbiesScreen()),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  Widget _menuButton(
      BuildContext context, String title, IconData icon, Widget screen) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: ListTile(
          leading: Icon(icon, color: const Color(0xFF0066CC)),
          title: Text(title),
          trailing: const Icon(Icons.arrow_forward_ios, size: 16),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => screen),
            );
          },
        ),
      ),
    );
  }

  Drawer _buildSideMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xFF0066CC),
                  Color(0xFF7B2FFF),
                ],
              ),
            ),
            child: const Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                "Navigation Menu",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          _drawerItem(context, "Home", Icons.home, () {
            Navigator.pop(context);
          }),
          _drawerItem(context, "Work Experience", Icons.work, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const WorkExperienceScreen()),
            );
          }),
          _drawerItem(context, "Skills", Icons.bolt, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const SkillsScreen()),
            );
          }),
          _drawerItem(context, "Timeline", Icons.timeline, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const TimelineScreen()),
            );
          }),
          _drawerItem(context, "Contact", Icons.email, () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ContactScreen()),
            );
          }),
        ],
      ),
    );
  }

  ListTile _drawerItem(
      BuildContext context, String title, IconData icon, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: const Color(0xFF0066CC)),
      title: Text(title),
      onTap: onTap,
    );
  }
}
