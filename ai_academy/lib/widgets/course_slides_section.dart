import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CourseSlidesSection extends StatelessWidget {
  Future<void> _launchURL(String url) async {
    final Uri uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  void _showEmailDialog(BuildContext context, String courseTitle) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Email Required'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Enter your email to get $courseTitle slides'),
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
                SnackBar(content: Text('Course slides sent to email!')),
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
            'Course Slides',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF7B1FA2),
            ),
          ),
          SizedBox(height: 16),
          GridView.count(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            crossAxisCount: 4,
            childAspectRatio: 0.7,
            crossAxisSpacing: 12,
            mainAxisSpacing: 12,
            children: [
              _buildCourseCard(
                context,
                'Machine Learning',
                'Andrew Ng Course',
                'ML fundamentals',
                'https://www.coursera.org/specializations/machine-learning-introduction',
                'https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=300&h=200&fit=crop',
              ),
              _buildCourseCard(
                context,
                'Deep Learning',
                'Neural Networks',
                'Advanced AI concepts',
                'https://www.coursera.org/specializations/deep-learning',
                'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=300&h=200&fit=crop',
              ),
              _buildCourseCard(
                context,
                'Mathematics',
                'Linear Algebra',
                'Math for ML',
                'https://www.coursera.org/specializations/mathematics-machine-learning',
                'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=300&h=200&fit=crop',
              ),
              _buildCourseCard(
                context,
                'GANs',
                'Generative AI',
                'Image generation',
                'https://www.coursera.org/learn/build-basic-generative-adversarial-networks-gans',
                'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=300&h=200&fit=crop',
              ),
              _buildCourseCard(
                context,
                'NLP',
                'Text Processing',
                'Language models',
                'https://www.coursera.org/specializations/natural-language-processing',
                'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=300&h=200&fit=crop',
              ),
              _buildCourseCard(
                context,
                'AI for Everyone',
                'Non-technical AI',
                'Business applications',
                'https://www.coursera.org/learn/ai-for-everyone',
                'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=300&h=200&fit=crop',
              ),
              _buildCourseCard(
                context,
                'Computer Vision',
                'Image Recognition',
                'Visual AI systems',
                'https://www.coursera.org/specializations/computer-vision',
                'https://images.unsplash.com/photo-1518709268805-4e9042af2176?w=300&h=200&fit=crop',
              ),
              _buildCourseCard(
                context,
                'Data Science',
                'Analytics & Stats',
                'Data insights',
                'https://www.coursera.org/specializations/data-science',
                'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=300&h=200&fit=crop',
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(
    BuildContext context,
    String title1,
    String title2,
    String description,
    String courseUrl,
    String imagePath,
  ) {
    return Card(
      elevation: 4,
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(4)),
              child: Image.network(
                imagePath,
                width: double.infinity,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    color: Colors.grey[300],
                    child: Icon(Icons.book, size: 24),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title1,
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    title2,
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    description,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.grey[600],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ),
          // BOTTOM BUTTONS
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _showEmailDialog(context, title1),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 6),
                    ),
                    child: Text('Email', style: TextStyle(fontSize: 10)),
                  ),
                ),
                SizedBox(width: 6),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => _launchURL(courseUrl),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 6),
                    ),
                    child: Text('View', style: TextStyle(fontSize: 10)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}