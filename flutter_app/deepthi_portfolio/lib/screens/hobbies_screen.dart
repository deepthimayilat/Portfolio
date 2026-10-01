import 'package:flutter/material.dart';
import '../widgets/image_placeholder.dart';
import '../services/api_service.dart';

class HobbiesScreen extends StatefulWidget {
  @override
  _HobbiesScreenState createState() => _HobbiesScreenState();
}

class _HobbiesScreenState extends State<HobbiesScreen> {
  Map<String, dynamic>? aboutData;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final data = await ApiService.getAboutData();
    setState(() {
      aboutData = data;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Hobbies")),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ImagePlaceholder(label: "Hobbies Graphic"),
                  SizedBox(height: 20),
                  ...List.generate(
                    aboutData?["hobbies"].length ?? 0,
                    (index) => Padding(
                      padding: const EdgeInsets.only(bottom: 8.0),
                      child: Text(
                        "• ${aboutData!["hobbies"][index]}",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
