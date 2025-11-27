import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AiNotesSection extends StatelessWidget {
  const AiNotesSection({super.key});

  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _showEmailDialog(BuildContext context, String noteTitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Email Required'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter your email to get $noteTitle'),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                hintText: 'Enter email',
                border: OutlineInputBorder(),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('AI Notes sent to email!')),
              );
            },
            child: Text('Send'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'AI Notes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7B1FA2),
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'AI Notes from Deep Learning',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Specialization with entirely tutorials deep learning,',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            ElevatedButton(
                              onPressed: () => _showEmailDialog(context, 'Deep Learning Notes'),
                              child: Text('Email'),
                            ),
                            SizedBox(width: 8),
                            ElevatedButton(
                              onPressed: () => _launchURL('https://www.deeplearning.ai/courses/deep-learning-specialization/'),
                              child: Text('Get Notes'),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Initializing Neural Networks',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'can significantly affect the speed of training neural nets. It is used very',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        Text(
                          'important to use the right initialization.',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => _launchURL('https://www.deeplearning.ai/'),
                          child: Row(
                            children: [
                              Text('Read more', style: TextStyle(color: Color(0xFF7B1FA2))),
                              Icon(Icons.arrow_forward, size: 16, color: Color(0xFF7B1FA2)),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Card(
                  elevation: 4,
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Parameters Optimization in Neural Networks',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Cleaning the data in the process of training the machine observed',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                        SizedBox(height: 8),
                        GestureDetector(
                          onTap: () => _launchURL('https://www.deeplearning.ai/'),
                          child: Row(
                            children: [
                              Text('Read more', style: TextStyle(color: Color(0xFF7B1FA2))),
                              Icon(Icons.arrow_forward, size: 16, color: Color(0xFF7B1FA2)),
                            ],
                          ),
                        ),
                      ],
                    ),
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