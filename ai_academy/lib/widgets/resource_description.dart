import 'package:flutter/material.dart';

class ResourceDescription extends StatelessWidget {
  final Function(String) onCategorySelected;
  
  const ResourceDescription({Key? key, required this.onCategorySelected}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.0),
      color: Color(0xFFE1BEE7),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Resources center to help you get started and',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          Text(
            'advance your skills in Artificial Intelligence and Machine Learning.',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () => onCategorySelected('Guides'),
                child: Text(
                  'Guides',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B1FA2),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onCategorySelected('Ebooks'),
                child: Text(
                  'eBooks',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B1FA2),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onCategorySelected('Course Slides'),
                child: Text(
                  'Course Slides',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B1FA2),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onCategorySelected('AI Notes'),
                child: Text(
                  'AI Notes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B1FA2),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () => onCategorySelected('Other Resources'),
                child: Text(
                  'Other Resources',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF7B1FA2),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}