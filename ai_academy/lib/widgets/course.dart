import 'package:flutter/material.dart';

void main() {
  runApp(AICoursesApp());
}

class AICoursesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Academy - All Courses',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Roboto',
      ),
      home: AllCoursesPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class AllCoursesPage extends StatefulWidget {
  @override
  _AllCoursesPageState createState() => _AllCoursesPageState();
}

class _AllCoursesPageState extends State<AllCoursesPage> {
  String selectedCourseType = 'Short Course';
  String selectedLevel = 'Beginner';
  String selectedTopic = 'Agents';
  String sortBy = 'Newest';
  String searchQuery = '';
  String selectedFilter = 'Most Recent';

  List<Course> get filteredCourses {
    return courses.where((course) {
      // Search filter
      bool matchesSearch = searchQuery.isEmpty ||
          course.title.toLowerCase().contains(searchQuery.toLowerCase()) ||
          course.instructor.toLowerCase().contains(searchQuery.toLowerCase());
      
      // Course type filter
      bool matchesType = selectedCourseType == 'Short Course' ||
          course.type == selectedCourseType;
      
      return matchesSearch && matchesType;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header
          _buildHeader(),
          // Main Content
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Sidebar
                Container(
                  width: 600,
                  child: _buildSidebar(),
                ),
                // Main Content Area
                Expanded(
                  child: _buildMainContent(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  String _getCourseImageUrl(String imageName) {
    switch (imageName) {
      case 'ml_specialization.png':
        return 'https://images.unsplash.com/photo-1555255707-c07966088b7b?w=400&h=300&fit=crop';
      case 'generative_ai.png':
        return 'https://images.unsplash.com/photo-1677442136019-21780ecad995?w=400&h=300&fit=crop';
      case 'generative_llms.png':
        return 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400&h=300&fit=crop';
      case 'langchain_chat.png':
        return 'https://images.unsplash.com/photo-1531482615713-2afd69097998?w=400&h=300&fit=crop';
      case 'rag_building.png':
        return 'https://images.unsplash.com/photo-1581091226825-a6a2a5aee158?w=400&h=300&fit=crop';
      case 'post_training.png':
        return 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=400&h=300&fit=crop';
      case 'llama_building.png':
        return 'https://images.unsplash.com/photo-1555949963-aa79dcee981c?w=400&h=300&fit=crop';
      case 'data_analytics.png':
        return 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?w=400&h=300&fit=crop';
      case 'acp_protocol.png':
        return 'https://images.unsplash.com/photo-1522071820081-009f0129c71c?w=400&h=300&fit=crop';
      case 'workflows_genai.png':
        return 'https://images.unsplash.com/photo-1518186285589-2f7649de83e0?w=400&h=300&fit=crop';
      case 'dspy_optimize.png':
        return 'https://images.unsplash.com/photo-1504639725590-34d0984388bd?w=400&h=300&fit=crop';
      case 'rlhf_tuning.png':
        return 'https://images.unsplash.com/photo-1507003211169-0a1dd7228f2d?w=400&h=300&fit=crop';
      // NEW COURSE IMAGES
      case 'computer_vision.png':
        return 'https://images.unsplash.com/photo-1535223289827-42f1e9919769?w=400&h=300&fit=crop';
      case 'nlp_transformers.png':
        return 'https://images.unsplash.com/photo-1526374965328-7f61d4dc18c5?w=400&h=300&fit=crop';
      case 'mlops_course.png':
        return 'https://images.unsplash.com/photo-1451187580459-43490279c0fa?w=400&h=300&fit=crop';
      case 'ai_ethics.png':
        return 'https://images.unsplash.com/photo-1589254065878-42c9da997008?w=400&h=300&fit=crop';
      case 'quantum_ml.png':
        return 'https://images.unsplash.com/photo-1635070041078-e363dbe005cb?w=400&h=300&fit=crop';
      case 'robotics_ai.png':
        return 'https://images.unsplash.com/photo-1485827404703-89b55fcc595e?w=400&h=300&fit=crop';
      default:
        return 'https://images.unsplash.com/photo-1516321318423-f06f85e504b3?w=400&h=300&fit=crop';
    }
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'AI Academy',
            style: TextStyle(
              color: Color(0xFF8B5CF6),
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          Row(
            children: [
              _buildNavItem('Explore Courses'),
              SizedBox(width: 20),
              _buildNavItem('AI Newsletter'),
              SizedBox(width: 20),
              _buildNavItem('Community'),
              SizedBox(width: 20),
              _buildNavItem('Resources'),
              SizedBox(width: 20),
              _buildNavItem('Company'),
              SizedBox(width: 30),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: Text('Log In', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(String text) {
    return Text(
      text,
      style: TextStyle(
        color: Colors.grey[600],
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  Widget _buildSidebar() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        border: Border(
          right: BorderSide(color: Colors.grey[200]!, width: 1),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(
            'All Courses',
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 8),
          Text(
            'Advance your AI career with foundational specializations and targeted short courses led by industry experts.',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
              height: 1.4,
            ),
          ),
          SizedBox(height: 30),
          
          // Search Bar
          Container(
            height: 40,
            child: TextField(
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Search',
                hintStyle: TextStyle(color: Colors.grey[500]),
                prefixIcon: Icon(Icons.search, color: Colors.grey[500], size: 18),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: BorderSide(color: Colors.grey[300]!),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              ),
            ),
          ),
          SizedBox(height: 30),
          
          // Filters
          Row(
            children: [
              Text(
                'Filters',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Spacer(),
              TextButton(
                onPressed: () {
                  setState(() {
                    selectedCourseType = 'Short Course';
                    selectedLevel = 'Beginner';
                    selectedTopic = 'Agents';
                    searchQuery = '';
                  });
                },
                child: Text(
                  'Clear All',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          
          // Course Type Filter
          _buildFilterSection(
            'Course Type',
            ['Short Course', 'Course', 'Specialization'],
            selectedCourseType,
            (value) => setState(() => selectedCourseType = value),
          ),
          SizedBox(height: 20),
          
          // Level Filter
          _buildFilterSection(
            'Level',
            ['Beginner', 'Intermediate'],
            selectedLevel,
            (value) => setState(() => selectedLevel = value),
          ),
          SizedBox(height: 20),
          
          // Popular Topics Filter
          _buildFilterSection(
            'Popular Topics',
            ['Agents', 'AI Frameworks', 'AI Safety', 'Chatbots'],
            selectedTopic,
            (value) => setState(() => selectedTopic = value),
          ),
          SizedBox(height: 10),
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Show more',
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                Icon(Icons.keyboard_arrow_down, color: Colors.grey[600], size: 16),
              ],
            ),
          ),
        ],
        ),
      ),
    );
  }

  Widget _buildFilterSection(String title, List<String> options, String selected, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: 10),
        ...options.map((option) => Container(
          margin: EdgeInsets.only(bottom: 5),
          child: InkWell(
            onTap: () => onChanged(option),
            borderRadius: BorderRadius.circular(15),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: selected == option ? Colors.grey[600] : Colors.grey[200],
                borderRadius: BorderRadius.circular(15),
              ),
              child: Text(
                option,
                style: TextStyle(
                  color: selected == option ? Colors.white : Colors.grey[700],
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        )).toList(),
      ],
    );
  }

  Widget _buildMainContent() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          // Hero Image Section
          Container(
            height: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?w=800&h=400&fit=crop',
                width: double.infinity,
                height: 100,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.grey[200]!, Colors.grey[100]!],
                      ),
                    ),
                    child: Center(
                      child: Icon(Icons.group, size: 40, color: Colors.grey[500]),
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 30),
          
          // Filter Tabs and Sort
          Row(
            children: [
              InkWell(
                onTap: () => setState(() => selectedFilter = 'Most Recent'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedFilter == 'Most Recent' ? Color(0xFF8B5CF6) : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Most Recent',
                    style: TextStyle(
                      color: selectedFilter == 'Most Recent' ? Colors.white : Colors.grey[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 10),
              InkWell(
                onTap: () => setState(() => selectedFilter = 'Top Rated'),
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
                  decoration: BoxDecoration(
                    color: selectedFilter == 'Top Rated' ? Color(0xFF8B5CF6) : Colors.grey[200],
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'Top Rated',
                    style: TextStyle(
                      color: selectedFilter == 'Top Rated' ? Colors.white : Colors.grey[700],
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    'Sort by:',
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontSize: 14,
                    ),
                  ),
                  SizedBox(width: 10),
                  InkWell(
                    onTap: () => setState(() => sortBy = 'Newest'),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: sortBy == 'Newest' ? Color(0xFF8B5CF6) : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Newest',
                        style: TextStyle(
                          color: sortBy == 'Newest' ? Colors.white : Colors.grey[700],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  InkWell(
                    onTap: () => setState(() => sortBy = 'Oldest'),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                      decoration: BoxDecoration(
                        color: sortBy == 'Oldest' ? Color(0xFF8B5CF6) : Colors.grey[200],
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Oldest',
                        style: TextStyle(
                          color: sortBy == 'Oldest' ? Colors.white : Colors.grey[700],
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          
          // Courses Section Title
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Courses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 20),
          
          // Course Grid
          Expanded(
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
              ),
              itemCount: filteredCourses.length,
              itemBuilder: (context, index) {
                return _buildCourseCard(filteredCourses[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCourseCard(Course course) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Course Image
          Expanded(
            flex: 3,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
              ),
              child: Container(
                width: double.infinity,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(12),
                        topRight: Radius.circular(12),
                      ),
                      child: Image.network(
                        _getCourseImageUrl(course.imageName),
                        width: double.infinity,
                        height: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: course.isSpecial 
                                    ? [Colors.purple[300]!, Colors.blue[300]!]
                                    : [Colors.grey[300]!, Colors.grey[200]!],
                              ),
                            ),
                            child: Center(
                              child: Icon(
                                course.icon,
                                size: 30,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    if (course.hasVideo)
                      Positioned(
                        top: 8,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Icon(
                            Icons.play_arrow,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ),
                    if (course.rating > 0)
                      Positioned(
                        bottom: 8,
                        right: 8,
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.7),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(Icons.star, color: Colors.yellow, size: 12),
                              SizedBox(width: 2),
                              Text(
                                course.rating.toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 10,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ),
          // Course Content
          Expanded(
            flex: 2,
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Course Type Badge
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: course.typeColor,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: course.typeColor.withOpacity(0.3)),
                    ),
                    child: Text(
                      course.type,
                      style: TextStyle(
                        color: course.typeColor == Colors.orange[100] 
                            ? Colors.orange[800] 
                            : Colors.grey[700],
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  // Course Title
                  Expanded(
                    child: Text(
                      course.title,
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                        height: 1.3,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(height: 8),
                  // Instructor
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 10,
                        backgroundColor: Colors.grey[300],
                        child: Icon(Icons.person, size: 12, color: Colors.grey[600]),
                      ),
                      SizedBox(width: 6),
                      Text(
                        course.instructor,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Course {
  final String title;
  final String instructor;
  final String type;
  final Color typeColor;
  final double rating;
  final bool hasVideo;
  final bool isSpecial;
  final IconData icon;
  final String imageName;

  Course({
    required this.title,
    required this.instructor,
    required this.type,
    required this.typeColor,
    this.rating = 0.0,
    this.hasVideo = false,
    this.isSpecial = false,
    required this.icon,
    required this.imageName,
  });
}

final List<Course> courses = [
  Course(
    title: 'Machine Learning Specialization',
    instructor: 'DeepLearning.AI',
    type: 'Specialization',
    typeColor: Colors.grey[200]!,
    rating: 4.6,
    hasVideo: true,
    icon: Icons.analytics,
    imageName: 'ml_specialization.png',
  ),
  Course(
    title: 'Generative AI for everyone',
    instructor: 'DeepLearning.AI',
    type: 'Course',
    typeColor: Colors.grey[200]!,
    rating: 4.6,
    hasVideo: true,
    icon: Icons.auto_awesome,
    imageName: 'generative_ai.png',
  ),
  Course(
    title: 'Generative AI with LLMs',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.chat,
    imageName: 'generative_llms.png',
  ),
  Course(
    title: 'LangChain: Chat with Your Data',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.dataset,
    imageName: 'langchain_chat.png',
  ),
  Course(
    title: 'Building Retrieval Augmented Generation (RAG)',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.search,
    imageName: 'rag_building.png',
  ),
  Course(
    title: 'Post-training of LLMs',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.tune,
    imageName: 'post_training.png',
  ),
  Course(
    title: 'Building with Llama 4',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    isSpecial: true,
    icon: Icons.pets,
    imageName: 'llama_building.png',
  ),
  Course(
    title: 'Data Analytics Professional Certificate',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.bar_chart,
    imageName: 'data_analytics.png',
  ),
  Course(
    title: 'ACP: Agent Communication Protocol',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.diversity_3,
    imageName: 'acp_protocol.png',
  ),
  Course(
    title: 'Orchestrating Workflows for GenAI Applications',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.account_tree,
    imageName: 'workflows_genai.png',
  ),
  Course(
    title: 'DSPy: Build and Optimize Dynamic App',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.build,
    imageName: 'dspy_optimize.png',
  ),
  Course(
    title: 'Reinforcement Fine-Tuning LLMs with RLHF',
    instructor: 'DeepLearning.AI',
    type: 'Short Course',
    typeColor: Colors.orange[100]!,
    hasVideo: true,
    icon: Icons.psychology,
    imageName: 'rlhf_tuning.png',
  ),
];