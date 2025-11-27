// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_academy/widgets/common_header.dart';
import 'package:ai_academy/widgets/common_app_footer.dart';
import 'package:ai_academy/widgets/common_drawer.dart';


class CoursesPage extends StatefulWidget {
  const CoursesPage({super.key});

  @override
  State<CoursesPage> createState() => _CoursesPageState();
}

class _CoursesPageState extends State<CoursesPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _searchController = TextEditingController();
  String _searchQuery = '';
  String _selectedTab = 'Most Rated';
  String _selectedSort = 'Newest';
  final List<String> _selectedFilters = [];
  
  final List<Map<String, String>> _allCourses = [
    {
      'title': 'Generative AI with LLMs',
      'subtitle': 'Understand the foundations of generative AI and large language models (LLMs).',
      'image': 'assets/images/pic1.png',
      'tag': 'Short Course',
      'publisher': 'Open AI',
      'logo': 'assets/icon/generative.png',
    },
    {
      'title': 'Machine Learning Basics',
      'subtitle': 'Learn the core concepts of supervised and unsupervised learning.',
      'image': 'assets/images/pic2.png',
      'tag': 'Beginner',
      'publisher': 'Google AI',
      'logo': 'assets/icon/generative.png',
    },
    {
      'title': 'Deep Learning Specialization',
      'subtitle': 'Master deep learning techniques with real-world projects.',
      'image': 'assets/images/pic3.png',
      'tag': 'Specialization',
      'publisher': 'Coursera',
      'logo': 'assets/icon/generative.png',
    },
    {
      'title': 'Natural Language Processing',
      'subtitle': 'Learn NLP techniques for text analysis and language understanding.',
      'image': 'assets/images/pic1.png',
      'tag': 'Course',
      'publisher': 'Stanford',
      'logo': 'assets/icon/generative.png',
    },
    {
      'title': 'Computer Vision Fundamentals',
      'subtitle': 'Explore image processing and computer vision algorithms.',
      'image': 'assets/images/pic2.png',
      'tag': 'Course',
      'publisher': 'MIT',
      'logo': 'assets/icon/generative.png',
    },
  ];
  
  List<Map<String, String>> get _filteredCourses {
    var courses = _allCourses;
    
    // Apply search filter
    if (_searchQuery.isNotEmpty) {
      courses = courses.where((course) {
        return course['title']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               course['subtitle']!.toLowerCase().contains(_searchQuery.toLowerCase()) ||
               course['publisher']!.toLowerCase().contains(_searchQuery.toLowerCase());
      }).toList();
    }
    
    // Apply category filters
    if (_selectedFilters.isNotEmpty) {
      courses = courses.where((course) {
        return _selectedFilters.any((filter) => 
          course['tag']!.toLowerCase().contains(filter.toLowerCase()) ||
          course['publisher']!.toLowerCase().contains(filter.toLowerCase())
        );
      }).toList();
    }
    
    return courses;
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isTablet =
        MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: CommonHeader(scaffoldKey: _scaffoldKey),
      drawer: isMobile ? const CommonDrawer() : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ✅ Hero Section
              isMobile
                  ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "All Courses",
                        style: GoogleFonts.poppins(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        "Advance your AI career with foundational specializations and targeted short courses led by industry experts.",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.black54,
                          height: 1.5,
                        ),
                      ),
                      const SizedBox(height: 20),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          "assets/images/coursebanner.png",
                          height: 200,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  )
                  : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left text
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "All Courses",
                              style: GoogleFonts.poppins(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              "Advance your AI career with foundational specializations and targeted short courses led by industry experts.",
                              style: GoogleFonts.poppins(
                                fontSize: 16,
                                color: Colors.black54,
                                height: 1.5,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24),
                      // Right image
                      Expanded(
                        flex: 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: Image.asset(
                            "assets/images/coursebanner.png",
                            height: 300,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  ),
              const SizedBox(height: 30),

              // Mobile Search
              if (isMobile) ...[
                TextField(
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: "Search courses...",
                    prefixIcon: const Icon(Icons.search),
                    filled: true,
                    fillColor: const Color(0xffF3F4F6),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
              
              // ✅ Main Content Row
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (!isMobile) SizedBox(width: 250, child: _buildFilters()),
                  if (!isMobile) const SizedBox(width: 24),
                  Expanded(child: _buildCoursesSection(isMobile)),
                ],
              ),
              CommonAppFooter(isMobile: isMobile),
            ],
          ),
        ),
      ),

    );
  }

  // ---------------- FILTER SIDEBAR ----------------
  Widget _buildFilters() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: _searchController,
          onChanged: (value) {
            setState(() {
              _searchQuery = value;
            });
          },
          decoration: InputDecoration(
            hintText: "Search courses...",
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: const Color(0xffF3F4F6),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        const SizedBox(height: 20),
        Text(
          "Filters",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        Text("Course Type", style: GoogleFonts.poppins(fontSize: 14)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _chip("Short Course"),
            _chip("Course"),
            _chip("Specialization"),
          ],
        ),
        const SizedBox(height: 20),

        Text("Level", style: GoogleFonts.poppins(fontSize: 14)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [_chip("Beginner"), _chip("Intermediate")]
        ),
        const SizedBox(height: 20),

        Text("Popular Topics", style: GoogleFonts.poppins(fontSize: 14)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _chip("Agents"),
            _chip("AI Frameworks"),
            _chip("AI Safety"),
            _chip("Chatbots"),
          ],
        ),
      ],
    );
  }

  Widget _chip(String label) {
    final isSelected = _selectedFilters.contains(label);
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isSelected) {
            _selectedFilters.remove(label);
          } else {
            _selectedFilters.add(label);
          }
        });
      },
      child: Chip(
        label: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 12,
            color: isSelected ? Colors.white : Colors.black87,
          ),
        ),
        backgroundColor: isSelected ? Colors.purple : Colors.grey.shade300,
      ),
    );
  }

  // ---------------- COURSE SECTION ----------------
  Widget _buildCoursesSection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Tabs
        Row(
          children: [
            _tabButton("Most Rated", _selectedTab == "Most Rated"),
            const SizedBox(width: 12),
            _tabButton("Top Rated", _selectedTab == "Top Rated"),
          ],
        ),
        const SizedBox(height: 20),

        // ✅ Featured Courses
        SizedBox(
          height: 250,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              _featuredCourseCard(
                "Machine Learning Specialization",
                "Learn core machine learning concepts and apply them through hands-on projects. Build a strong foundation for advanced AI topics.",
                "assets/images/pic1.png",
                "Specialization",
                "DeepLearning.AI",
                "assets/icon/Gemini.png", // small logo
                4.8,
              ),
              const SizedBox(width: 16),
              _featuredCourseCard(
                "Generative AI for Everyone",
                "Discover the fundamentals of generative AI and learn how to use powerful tools like ChatGPT in everyday work, creativity, and problem solving.",
                "assets/images/pic2.png",
                "Short Course",
                "Open AI",
                "assets/icon/Gemini.png", // small logo
                4.7,
              ),
            ],
          ),
        ),
        const SizedBox(height: 30),

        // Sort
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Courses",
              style: GoogleFonts.poppins(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              children: [
                Text("Sort by:", style: GoogleFonts.poppins(fontSize: 14)),
                const SizedBox(width: 8),
                _tabButton("Newest", _selectedSort == "Newest"),
                const SizedBox(width: 8),
                _tabButton("Oldest", _selectedSort == "Oldest"),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Clear filters button
        if (_selectedFilters.isNotEmpty || _searchQuery.isNotEmpty) ...[
          Row(
            children: [
              TextButton.icon(
                onPressed: () {
                  setState(() {
                    _selectedFilters.clear();
                    _searchQuery = '';
                    _searchController.clear();
                  });
                },
                icon: const Icon(Icons.clear, size: 16),
                label: Text(
                  'Clear Filters',
                  style: GoogleFonts.poppins(fontSize: 14),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '${_filteredCourses.length} courses found',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
        ],
        
        // ✅ Courses Grid
        _filteredCourses.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                      const SizedBox(height: 16),
                      Text(
                        _searchQuery.isNotEmpty 
                            ? 'No courses found for "$_searchQuery"'
                            : 'No courses match the selected filters',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
              )
            : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 2.2,
                ),
                itemCount: _filteredCourses.length,
                itemBuilder: (context, index) {
                  final course = _filteredCourses[index];
                  return _courseCard(
                    course['title']!,
                    course['subtitle']!,
                    course['image']!,
                    course['tag']!,
                    course['publisher']!,
                    course['logo']!,
                  );
                },
              ),
      ],
    );
  }

  Widget _tabButton(String label, bool isActive) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (label == "Most Rated" || label == "Top Rated") {
            _selectedTab = label;
          } else {
            _selectedSort = label;
          }
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isActive ? Colors.purple.shade100 : Colors.grey.shade200,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: isActive ? Colors.purple : Colors.black,
          ),
        ),
      ),
    );
  }

  Widget _featuredCourseCard(
    String title,
    String subtitle,
    String imagePath,
    String tag,
    String publisher,
    String publisherLogo, // path to small logo
    double rating,
  ) {
    return Container(
      width: 320,
      margin: const EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- IMAGE + TAG ----------
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  height: 160,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Text(
                    tag,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12.withOpacity(0.1),
                        blurRadius: 4,
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      Image.asset(
                        publisherLogo,
                        height: 20,
                        width: 50,
                        fit: BoxFit.fill,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        publisher,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // ---------- PUBLISHER ----------

          // ---------- TITLE + SUBTITLE + RATING ----------
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 6),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.black54,
                          height: 1.4,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Icon(Icons.star, color: Colors.amber, size: 16),
                    Text(
                      "$rating",
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
        ],
      ),
    );
  }

  // ---------------- COURSE CARD ----------------
  Widget _courseCard(
    String title,
    String subtitle,
    String imagePath,
    String tag,
    String publisher,
    String publisherLogo,
  ) {
    return Container(
      width: 380, // total card width
      height: 160, // fixed card height
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.16),
            blurRadius: 6,
            spreadRadius: 0,
            offset: Offset(0, 3),
          ),
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.23),
            blurRadius: 6,
            spreadRadius: 0,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ---------- IMAGE + TAG ----------
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.horizontal(
                  left: Radius.circular(12),
                ),
                child: Image.asset(
                  imagePath,
                  height: 215,
                  width: 215,
                  fit: BoxFit.cover,
                ),
              ),
            ],
          ),

          // ---------- CONTENT ----------
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Title
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 4,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.red, width: 1),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12.withOpacity(0.1),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Text(
                      tag,
                      style: GoogleFonts.poppins(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: Colors.red, // highlight for "Short Course"
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: 200,
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 6),

                  // Subtitle
                  SizedBox(
                    width: 200,
                    child: Text(
                      subtitle,
                      style: GoogleFonts.poppins(
                        fontSize: 13,
                        color: Colors.black54,
                        height: 1.4,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // const Spacer(),
                  SizedBox(height: 10),
                  // Publisher (logo + name)
                  Row(
                    children: [
                      Image.asset(publisherLogo, height: 20, width: 20),
                      const SizedBox(width: 6),
                      Text(
                        publisher,
                        style: GoogleFonts.poppins(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          color: Colors.black87,
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


