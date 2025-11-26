import 'dart:ui';
import 'package:ai_academy/constants/image.dart';
import 'package:ai_academy/view/CONTACT%20US%20PAGE/contact_us_page.dart';
import 'package:ai_academy/view/Careers%20page/careers_page.dart';
import 'package:ai_academy/view/about/about.dart';
import 'package:ai_academy/view/course/Courses_page.dart';
import 'package:ai_academy/widgets/common_header.dart';
import 'package:ai_academy/widgets/common_app_footer.dart';
import 'package:ai_academy/widgets/common_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class WebHome extends StatefulWidget {
  const WebHome({super.key});

  @override
  State<WebHome> createState() => _WebHomeState();
}

class _WebHomeState extends State<WebHome> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _precacheImages();
  }

  void _precacheImages() {
    precacheImage(const AssetImage('assets/images/home_baner.png'), context);
    precacheImage(const AssetImage('assets/images/pic1.png'), context);
    precacheImage(const AssetImage('assets/images/pic2.png'), context);
    precacheImage(const AssetImage('assets/images/pic3.png'), context);
    precacheImage(const AssetImage('assets/images/pic4.png'), context);
  }

  final List<Map<String, String>> acpCourses = [
    {
      "title": "ACP: Agent Communication Protocol",
      "desc":
          "Build agents that communicate and collaborate across different frameworks using ACP",
    },
    {
      "title": "Generative AI for Everyone",
      "desc":
          "Learn the basics of generative AI and its real-world applications.",
    },
    {
      "title": "Machine Learning Specialization",
      "desc": "Master ML concepts and apply them in real-world scenarios.",
    },
  ];

  final Map<String, String> courseUrls = {
    "Vibe Coding 101 With Replit": "https://replit.com/learn",
    "Machine Learning Specialization":
        "https://www.coursera.org/specializations/machine-learning-introduction",
    "Building Towards Computer Use With Anthropic": "https://www.anthropic.com",
    "Generative AI For Everyone":
        "https://www.coursera.org/learn/generative-ai-for-everyone",
  };

  Future<void> _launchURL(String url) async {
    try {
      final Uri uri = Uri.parse(url);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri, mode: LaunchMode.externalApplication);
      } else {
        print('Cannot launch URL: $url');
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
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
        child: Column(
          children: [
            _heroSection(isMobile, isTablet),

            const SizedBox(height: 20),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
              child: Text(
                "Join over 7 million people learning\nhow to use and build AI",
                textAlign: TextAlign.center,
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 18 : 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
            ),

            const SizedBox(height: 20),
            _coursesSection(isMobile, isTablet),

            const SizedBox(height: 20),
            _collaborationWith(isMobile),
            const SizedBox(height: 20),
            _acpCarousel(isMobile, isTablet),

            const SizedBox(height: 20),
            _theBatchSection(isMobile, isTablet),

            _freeResourcesPagesSection(isMobile, isTablet),

            _subscribeBanner(isMobile, isTablet),
            CommonAppFooter(isMobile: isMobile),
          ],
        ),
      ),
    );
  }

  Widget _heroSection(bool isMobile, bool isTablet) {
    return Container(
      height: isMobile ? 500 : 400,
      padding: EdgeInsets.all(isMobile ? 20 : 30),
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/home_baner.png"),
          fit: BoxFit.cover,
        ),
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: isMobile ? 40 : 70),
          Container(
            width: isMobile ? double.infinity : (isTablet ? 400 : 470),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 16 : 20,
              vertical: isMobile ? 16 : 20,
            ),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  const Color(0xFF240046).withOpacity(0.9),
                  const Color(0xFF3c096c).withOpacity(0.9),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              border: Border.all(color: const Color(0xff9153AF)),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                Text(
                  "AI is the new electricity.\nYou are the spark.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: isMobile ? 20 : (isTablet ? 28 : 32),
                    fontWeight: FontWeight.bold,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  "Get the latest AI news, courses, events, and insights from Andrew Ng and other AI leaders.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    color: Colors.white70,
                    fontSize: isMobile ? 14 : 16,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: isMobile ? double.infinity : (isTablet ? 350 : 400),
            child:
                isMobile
                    ? Column(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: GoogleFonts.poppins(),
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          style: GoogleFonts.poppins(),
                        ),
                        const SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Subscribed successfully!'),
                                  duration: Duration(seconds: 2),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                              backgroundColor: const Color(0xff2563EB),
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                                vertical: 16,
                              ),
                            ),
                            child: Text(
                              "Subscribe",
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                    : Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              hintText: "Email",
                              hintStyle: GoogleFonts.poppins(),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            style: GoogleFonts.poppins(),
                          ),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton(
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Subscribed successfully!'),
                                duration: Duration(seconds: 2),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            backgroundColor: const Color(0xff2563EB),
                            padding: const EdgeInsets.symmetric(
                              horizontal: 30,
                              vertical: 20,
                            ),
                          ),
                          child: Text(
                            "Subscribe",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
          ),
        ],
      ),
    );
  }

  Widget _coursesSection(bool isMobile, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xff9153AF), Color(0xFF1A497F)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "AI Courses and Specializations",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 20 : 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 0),
            child: Text(
              "Build a foundation of machine learning and AI skills,\n"
              "and understand how to apply them in the real world.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                color: Colors.white70,
                fontSize: isMobile ? 14 : 16,
              ),
            ),
          ),
          const SizedBox(height: 20),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1000) {
                crossAxisCount = 4;
              } else if (constraints.maxWidth > 700) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: isMobile ? 0.9 : 1.2,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  final courses = [
                    {"title": "Vibe Coding 101 With Replit", "image": "assets/images/pic1.png"},
                    {"title": "Machine Learning Specialization", "image": "assets/images/pic2.png"},
                    {"title": "Building Towards Computer Use With Anthropic", "image": "assets/images/pic3.png"},
                    {"title": "Generative AI For Everyone", "image": "assets/images/pic4.png"},
                  ];
                  return _courseCard(
                    courses[index]["title"]!,
                    "Visit online",
                    courses[index]["image"]!,
                    isMobile,
                    courseUrls[courses[index]["title"]]!,
                  );
                },

              );
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.to(() => const CoursesPage());
            },
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: 30,
                vertical: isMobile ? 12 : 15,
              ),
            ),
            child: Text(
              "Explore All Course",
              style: GoogleFonts.poppins(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: isMobile ? 14 : 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _courseCard(
    String title,
    String subtitle,
    String imagePath,
    bool isMobile,
    String url,
  ) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.white, Colors.grey[50]!],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: isMobile ? 120 : 160,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 30,
                    width: 150,
                    child: ElevatedButton(
                      onPressed: () => _launchURL(url),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff6792F1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        subtitle,
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 5),
                  SizedBox(
                    height: isMobile ? 50 : 35,
                    child: Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 12 : 14,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _collaborationWith(bool isMobile) {
    return Column(
      children: [
        Text(
          "IN COLLABORATION WITH",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 12 : 14,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.5,
            color: const Color(0xff969696),
          ),
        ),
        const SizedBox(height: 20),
        SizedBox(
          height: isMobile ? 100 : 150,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              scrollbars: true,
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
              physics: const BouncingScrollPhysics(),
              itemCount: 8,
              separatorBuilder:
                  (context, index) => SizedBox(width: isMobile ? 20 : 40),
              itemBuilder: (context, index) {
                List<String> logos = [
                  ImageAi.google,
                  ImageAi.shutterstock,
                  ImageAi.amazon,
                  ImageAi.generative,
                  ImageAi.microsoft,
                  ImageAi.googleCloud,
                  ImageAi.chatgpt,
                  ImageAi.gemini,
                ];
                return Image.asset(logos[index], height: isMobile ? 80 : 120);
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget _acpCarousel(bool isMobile, bool isTablet) {
    return Stack(
      alignment: Alignment.center,
      children: [
        CarouselSlider.builder(
          carouselController: _carouselController,
          itemCount: acpCourses.length,
          options: CarouselOptions(
            height: isMobile ? 350 : 400,
            enlargeCenterPage: true,
            autoPlay: false,
            enableInfiniteScroll: true,
            viewportFraction: isMobile ? 0.9 : 0.8,
            onPageChanged: (index, reason) {
              setState(() => _currentIndex = index);
            },
          ),
          itemBuilder: (context, index, realIndex) {
            final course = acpCourses[index];
            return _acpCard(
              course["title"]!,
              course["desc"]!,
              isMobile,
              isTablet,
            );
          },
        ),
        if (!isMobile) ...[
          Positioned(
            left: isTablet ? 20 : 230,
            child: IconButton(
              icon: Icon(Icons.chevron_left, size: 36, color: Colors.black54),
              onPressed: () => _carouselController.previousPage(),
            ),
          ),
          Positioned(
            right: isTablet ? 20 : 230,
            child: IconButton(
              icon: Icon(Icons.chevron_right, size: 36, color: Colors.black54),
              onPressed: () => _carouselController.nextPage(),
            ),
          ),
        ],
      ],
    );
  }

  Widget _acpCard(
    String title,
    String description,
    bool isMobile,
    bool isTablet,
  ) {
    return Container(
      width: isMobile ? double.infinity : 800,
      padding: EdgeInsets.all(isMobile ? 16 : 20),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF0E8DD8), Color(0xFFCF7FDB)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(6),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 4,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: Text(
              "NEW SHORT COURSE",
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 10 : 12,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 15),
          SizedBox(
            width: isMobile ? double.infinity : 600,
            child: Text(
              title,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 24 : (isTablet ? 30 : 35),
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 16 : 25,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: isMobile ? double.infinity : 150,
            height: 40,
            child: ElevatedButton(
              onPressed: () {
                Get.to(() => const CoursesPage());
              },
              style: ElevatedButton.styleFrom(
                elevation: 5,
                backgroundColor: Colors.white,
                foregroundColor: Colors.black87,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Enroll Now",
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 10),
                  const Icon(CupertinoIcons.arrow_right),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _theBatchSection(bool isMobile, bool isTablet) {
    return Container(
      color: const Color(0xffd1dbe6),
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "THE LARGEST WEEKLY AI NEWSLETTER",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 12 : 14,
              letterSpacing: 1.5,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "THE BATCH",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: Color(0xff1A497F),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            "WHAT MATTERS IN AI RIGHT NOW",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 16,
              color: const Color(0xff969696),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 20),

          // News Cards
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = 1;
              if (constraints.maxWidth > 1000) {
                crossAxisCount = 4;
              } else if (constraints.maxWidth > 700) {
                crossAxisCount = 2;
              } else {
                crossAxisCount = 1;
              }

              final newsItems = [
                {"title": "Grok Raises Questions, Meta Pouches Talent, California Reframes AI Regulations, Multi-Agent System Get Stronger", "date": "July 19, 2025", "image": "assets/images/im1.png"},
                {"title": "How to make LLMs Commit, Training Web Agents, Blackmail, Robotic Beehive", "date": "July 19, 2025", "image": "assets/images/im2.png"},
                {"title": "Amazon's 100 Billion Bet on AI Infrastructure and Cloud Dominance", "date": "July 12, 2025", "image": "assets/images/im3.png"},
                {"title": "Amazon's 100 Billion Bet on AI Infrastructure and Cloud Dominance", "date": "July 12, 2025", "image": "assets/images/im1.png"},
              ];
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: isMobile ? 10 : 20,
                  mainAxisSpacing: isMobile ? 10 : 20,
                  childAspectRatio: isMobile ? 0.8 : 1.0,
                ),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: newsItems.length,
                itemBuilder: (context, index) {
                  return _newsCard(
                    newsItems[index]["title"]!,
                    newsItems[index]["date"]!,
                    newsItems[index]["image"]!,
                    isMobile,
                  );
                },
              );
            },
          ),

          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _launchURL("https://www.deeplearning.ai/the-batch/");
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2563EB),
              padding: EdgeInsets.symmetric(
                horizontal: 40,
                vertical: isMobile ? 12 : 15,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              "Read More",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w500,
                color: Colors.white,
                fontSize: isMobile ? 14 : 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _newsCard(String title, String date, String imagePath, bool isMobile) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Container(
              height: isMobile ? 80 : 100,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Content Section
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 12 : 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date
                    Text(
                      date,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 10 : 12,
                        color: const Color(0xff6792F1),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Title
                    Expanded(
                      child: Text(
                        title,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                          height: 1.2,
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),

                    // Description
                    Text(
                      "The Batch AI News and Insights: The invention of this dataset is New Insights...",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 11 : 13,
                        color: const Color(0xff666666),
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Read more link
                    GestureDetector(
                      onTap: () {
                        _launchURL("https://www.deeplearning.ai/the-batch/");
                      },
                      child: Text(
                        "Read More →",
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 12 : 14,
                          color: const Color(0xff1A497F),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _freeResourcesPagesSection(bool isMobile, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 20 : 40),
      color: Colors.white,
      child: Column(
        children: [
          Text(
            "FREE ResourcesPageS",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 14 : 16,
              letterSpacing: 1.2,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Get Started with AI and Machine Learning",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 22 : 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 20),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 10 : 60),
            child: LayoutBuilder(
              builder: (context, constraints) {
                int crossAxisCount = 1;
                if (constraints.maxWidth > 900) {
                  crossAxisCount = 3;
                } else if (constraints.maxWidth > 600) {
                  crossAxisCount = 2;
                } else {
                  crossAxisCount = 1;
                }

                final resources = [
                  {"header": "HOW TO BUILD YOUR CAREER IN AI", "title": "How to Build Your Career in AI", "desc": "A practical roadmap to building your career in AI from AI pioneer Andrew Ng", "button": "Download", "image": "assets/images/Career.png"},
                  {"header": "MACHINE LEARNING YEARNING", "title": "Machine Learning Yearning", "desc": "Technical strategy for ML engineers to build and maintain high-performance AI systems", "button": "Download", "image": "assets/images/Learning.png"},
                  {"header": "COMPLETE GUIDE TO NLP", "title": "A Complete Guide to NLP", "desc": "Comprehensive guide to Natural Language Processing techniques and applications", "button": "Read More", "image": "assets/images/Guide.png"},
                ];
                return GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: crossAxisCount,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                    childAspectRatio: isMobile ? 1.3 : 1.1,
                  ),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: resources.length,
                  itemBuilder: (context, index) {
                    return _ResourcesPageCard(
                      resources[index]["header"]!,
                      resources[index]["title"]!,
                      resources[index]["desc"]!,
                      resources[index]["button"]!,
                      resources[index]["image"]!,
                      isMobile,
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _ResourcesPageCard(
    String header,
    String title,
    String description,
    String buttonText,
    String imagePath,
    bool isMobile,
  ) {
    final TextEditingController emailController = TextEditingController();

    final Map<String, String> downloadUrls = {
      "How to Build Your Career in AI":
          "https://www.deeplearning.ai/wp-content/uploads/2023/09/How-to-Build-Your-Career-in-AI.pdf",
      "Machine Learning Yearning":
          "https://www.deeplearning.ai/wp-content/uploads/2018/09/Ng-MLY01-13.pdf",
      "A Complete Guide to NLP":
          "https://www.deeplearning.ai/wp-content/uploads/2023/06/NLP-Guide.pdf",
    };

    Future<void> _sendDownloadEmail(
      String email,
      String ResourcesPageTitle,
    ) async {
      await Future.delayed(const Duration(seconds: 1));
      print('Email sent to $email for downloading $ResourcesPageTitle');
    }

    bool _isValidEmail(String email) {
      return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
    }

    Future<void> _handleDownload() async {
      if (emailController.text.isEmpty ||
          !_isValidEmail(emailController.text)) {
        return;
      }

      try {
        final url = downloadUrls[title];
        if (url != null) {
          await _launchURL(url);
          await _sendDownloadEmail(emailController.text, title);
          emailController.clear();
        }
      } catch (e) {
        print('Download failed: $e');
      }
    }

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Image Section
            Container(
              height: isMobile ? 140 : 180,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.contain,
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding: EdgeInsets.all(isMobile ? 12 : 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      header,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 10 : 12,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff6792F1),
                        letterSpacing: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Title
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                        fontSize: isMobile ? 16 : 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 4),

                    // Description
                    Expanded(
                      child: Text(
                        description,
                        style: GoogleFonts.poppins(
                          fontSize: isMobile ? 12 : 14,
                          color: const Color(0xff666666),
                          height: 1.5,
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),

                    // Email Input and Button
                    isMobile
                        ? Column(
                          children: [
                            TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: GoogleFonts.poppins(
                                  color: Colors.grey[600],
                                ),
                                filled: true,
                                fillColor: Colors.grey[50],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: BorderSide.none,
                                ),
                                contentPadding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                              ),
                              style: GoogleFonts.poppins(),
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Email required';
                                if (!_isValidEmail(value))
                                  return 'Invalid email';
                                return null;
                              },
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed:
                                    buttonText == "Download"
                                        ? _handleDownload
                                        : () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff1A497F),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  buttonText,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                        : Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: const Color.fromRGBO(0, 0, 0, 0.19),
                                blurRadius: 20,
                                spreadRadius: 0,
                                offset: Offset(0, 10),
                              ),
                              BoxShadow(
                                color: const Color.fromRGBO(0, 0, 0, 0.23),
                                blurRadius: 6,
                                spreadRadius: 0,
                                offset: Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                    hintText: "Email",
                                    hintStyle: GoogleFonts.poppins(
                                      color: Colors.grey[600],
                                    ),
                                    filled: true,
                                    fillColor: Colors.grey[50],
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8),
                                      borderSide: BorderSide.none,
                                    ),
                                    contentPadding: const EdgeInsets.symmetric(
                                      horizontal: 16,
                                      vertical: 12,
                                    ),
                                  ),
                                  style: GoogleFonts.poppins(),
                                  validator: (value) {
                                    if (value == null || value.isEmpty)
                                      return 'Email required';
                                    if (!_isValidEmail(value))
                                      return 'Invalid email';
                                    return null;
                                  },
                                ),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed:
                                    buttonText == "Download"
                                        ? _handleDownload
                                        : () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: const Color(0xff1A497F),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 12,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                child: Text(
                                  buttonText,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _subscribeBanner(bool isMobile, bool isTablet) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF9153AF), Color(0xFF1A497F)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      width: double.infinity,
      child:
          isMobile
              ? Column(
                children: [
                  Image.asset(ImageAi.events, height: 200),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: Column(
                      children: [
                        Text(
                          "Stay up to date on the latest news, courses, and AI events",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Column(
                          children: [
                            TextField(
                              decoration: InputDecoration(
                                hintText: "Email",
                                hintStyle: GoogleFonts.poppins(),
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              style: GoogleFonts.poppins(),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Subscribed successfully!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: const Color(0xff2563EB),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                ),
                                child: Text(
                                  "Subscribe",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Image.asset(ImageAi.events2, height: 200),
                ],
              )
              : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (!isTablet) Image.asset(ImageAi.events, height: 300),
                  Column(
                    children: [
                      SizedBox(
                        width: isTablet ? 300 : 350,
                        child: Text(
                          "Stay up to date on the latest news, courses, and AI events",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: isTablet ? 18 : 22,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        width: isTablet ? 400 : 500,
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: "Email",
                                  hintStyle: GoogleFonts.poppins(),
                                  filled: true,
                                  fillColor: Colors.white,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                style: GoogleFonts.poppins(),
                              ),
                            ),
                            const SizedBox(width: 10),
                            SizedBox(
                              height: 50,
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Subscribed successfully!'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  backgroundColor: const Color(0xff2563EB),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 15,
                                  ),
                                ),
                                child: Text(
                                  "Subscribe",
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  if (!isTablet) Image.asset(ImageAi.events2, height: 300),
                ],
              ),
    );
  }


}
