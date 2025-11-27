import 'package:flutter/material.dart';

class ResourceFooter extends StatelessWidget {
  const ResourceFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      color: Color(0xFF1A237E),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text('Courses', style: TextStyle(color: Colors.white)),
          Text('Batch', style: TextStyle(color: Colors.white)),
          Text('Community', style: TextStyle(color: Colors.white)),
          Text('Careers', style: TextStyle(color: Colors.white)),
        ],
      ),
    );
  }
}