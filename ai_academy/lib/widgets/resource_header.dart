import 'package:flutter/material.dart';

class ResourceHeader extends StatelessWidget {
  const ResourceHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 120,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xFFAB47BC), Color(0xFF7B1FA2)],
        ),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(
                  'AI Academy',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 20),
                Text(
                  'Explore Courses',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  'Newsletter',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Community',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  'Careers',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                SizedBox(width: 20),
                Text(
                  'Learning',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}