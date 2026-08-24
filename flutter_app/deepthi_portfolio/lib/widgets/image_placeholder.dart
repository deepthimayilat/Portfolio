import 'package:flutter/material.dart';

class ImagePlaceholder extends StatelessWidget {
  final String label;

  const ImagePlaceholder({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(
        child: Text(
          "Image Placeholder: $label",
          style: TextStyle(fontSize: 16, color: Colors.black54),
        ),
      ),
    );
  }
}
