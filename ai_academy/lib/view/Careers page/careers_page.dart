import 'package:ai_academy/constants/image.dart';
import 'package:ai_academy/view/CONTACT%20US%20PAGE/contact_us_page.dart';
import 'package:ai_academy/view/Resources/resources.dart';
import 'package:ai_academy/view/about/about.dart';
import 'package:ai_academy/view/course/Courses_page.dart';
import 'package:ai_academy/view/AI%20academy%20sing%20in%20&%20sign%20up%20page/sing_in_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CareersPage extends StatefulWidget {
  const CareersPage({super.key});

  @override
  State<CareersPage> createState() => _CareersPageState();
}

class _CareersPageState extends State<CareersPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<Map<String, String>> jobs = [
    {
      "title": "Curriculum Developer",
      "type": "Contract",
      "location": "EU",
      "department": "Product",
    },
    {
      "title": "Curriculum Developer",
      "type": "Contract",
      "location": "India",
      "department": "Product",
    },
    {
      "title": "Curriculum Developer",
      "type": "Contract",
      "location": "Africa",
      "department": "Product",
    },
    {
      "title": "Curriculum Developer",
      "type": "Contract",
      "location": "LATAM",
      "department": "Product",
    },
    {
      "title": "Curriculum Engineer",
      "type": "Contract",
      "location": "EU",
      "department": "Product",
    },
    {
      "title": "Curriculum Engineer",
      "type": "Contract",
      "location": "LATAM",
      "department": "Product",
    },
    {
      "title": "Curriculum Engineer",
      "type": "Contract",
      "location": "Africa",
      "department": "Product",
    },
    {
      "title": "Curriculum Engineer",
      "type": "Contract",
      "location": "India",
      "department": "Product",
    },
    {
      "title": "Curriculum Product Manager",
      "type": "Full Time",
      "location": "United States",
      "department": "Product",
    },
    {
      "title": "Product Marketing Manager",
      "type": "Full Time",
      "location": "San Francisco Bay Area",
      "department": "Marketing",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isTablet =
        MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 800;

    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
            isMobile
                ? IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () => _scaffoldKey.currentState!.openDrawer(),
                )
                : null,
        title: Row(
          children: [
            SizedBox(width: isMobile ? 16 : 40),
            Image.asset(ImageAi.logo, height: isMobile ? 30 : 40),
            const Spacer(),
            if (!isMobile) ...[
              if (isTablet) ...[
                _navItem("Courses"),
                _navItem("Newsletter"),
                _navItem("Community"),
              ] else ...[
                _navItem("Explore Courses"),
                _navItem("AI Newsletter"),
                _navItem("Community"),
                _navItem("ResourcesPages"),
                _navItem("Company"),
              ],
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignInPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2563EB),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: isTablet ? 16 : 24,
                    vertical: isTablet ? 12 : 16,
                  ),
                ),
                child: Text(
                  "Log In",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: isTablet ? 12 : 14,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
      drawer:
          isMobile
              ? Drawer(
                child: ListView(
                  padding: EdgeInsets.zero,
                  children: [
                    DrawerHeader(
                      decoration: const BoxDecoration(color: Colors.deepPurple),
                      child: Text(
                        "AI Academy",
                        style: GoogleFonts.poppins(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _drawerItem("Explore Courses"),
                    _drawerItem("AI Newsletter"),
                    _drawerItem("Community"),
                    _drawerItem("ResourcesPages"),
                    _drawerItem("Company"),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => const SignInPage());
                        },
                        child: Text(
                          "Log In",
                          style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
              : null,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 32),
            Text(
              "Careers",
              style: GoogleFonts.poppins(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              "Join the team working to make AI education accessible to the entire world!",
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.black54),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 150),
              child: LayoutBuilder(
                builder: (context, constraints) {
                  int crossAxisCount =
                      constraints.maxWidth > 900
                          ? 3
                          : constraints.maxWidth > 600
                          ? 2
                          : 1;
                  return GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: crossAxisCount,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                      childAspectRatio: 1.3,
                    ),
                    itemCount: jobs.length,
                    itemBuilder: (context, index) {
                      final job = jobs[index];
                      return _buildJobCard(
                        job["title"]!,
                        job["type"]!,
                        job["location"]!,
                        job["department"]!,
                      );
                    },
                  );
                },
              ),
            ),
            const SizedBox(height: 50),
            _footer(isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildJobCard(
    String title,
    String type,
    String location,
    String department,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black12),
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Icon(
                Icons.access_time,
                size: 18,
                color: Color.fromARGB(255, 73, 128, 245),
              ),
              const SizedBox(width: 6),
              Text(type, style: GoogleFonts.poppins(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 18,
                color: Color.fromARGB(255, 73, 128, 245),
              ),
              const SizedBox(width: 6),
              Text(location, style: GoogleFonts.poppins(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              const Icon(
                Icons.business_center,
                size: 18,
                color: Color.fromARGB(255, 73, 128, 245),
              ),
              const SizedBox(width: 6),
              Text(department, style: GoogleFonts.poppins(fontSize: 13)),
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              Get.to(() => const ContactUsPage());
            },
            child: Row(
              children: [
                Text(
                  "Learn more",
                  style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Color.fromARGB(255, 73, 128, 245),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward, size: 16, color: Colors.blue),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _navItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () {
          if (text.contains("Courses")) {
            Get.to(() => const CoursesPage());
          } else if (text.contains("Community")) {
            Get.to(() => const ContactUsPage());
          } else if (text.contains("ResourcesPages")) {
            Get.to(() => Resources());
          }
        },
        child: Text(
          text,
          style: GoogleFonts.poppins(fontSize: 14, color: Colors.black87),
        ),
      ),
    );
  }

  /// Footer
  //   Widget _buildFooter() {
  //     return Container(
  //       width: double.infinity,
  //       color: const Color(0xFF0D1B2A),
  //       padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
  //       child: Column(
  //         children: [
  //           Wrap(
  //             spacing: 20,
  //             alignment: WrapAlignment.center,
  //             children: [
  //               _footerLink("Courses"),
  //               _footerLink("The Batch"),
  //               _footerLink("Community"),
  //               _footerLink("Careers"),
  //               _footerLink("About"),
  //             ],
  //           ),
  //           const SizedBox(height: 24),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             children: [
  //               _socialIcon(Icons.facebook),
  //               _socialIcon(Icons.circle), // placeholder
  //               _socialIcon(Icons.work), // placeholder for LinkedIn
  //               _socialIcon(Icons.play_circle_fill), // YouTube
  //             ],
  //           ),
  //         ],
  //       ),
  //     );
  //   }

  //   Widget _footerLink(String text) {
  //     return Text(
  //       text,
  //       style: GoogleFonts.poppins(color: Colors.white, fontSize: 14),
  //     );
  //   }

  //   Widget _socialIcon(IconData icon) {
  //     return Padding(
  //       padding: const EdgeInsets.symmetric(horizontal: 6),
  //       child: Icon(icon, color: Colors.white, size: 24),
  //     );
  //   }
  // }

  Widget _drawerItem(String title) {
    return ListTile(
      title: Text(
        title,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      onTap: () {
        Get.back();
        if (title.contains("Courses")) {
          Get.to(() => const CoursesPage());
        } else if (title.contains("Community")) {
          Get.to(() => const ContactUsPage());
        } else if (title.contains("ResourcesPages")) {
          Get.to(() => Resources());
        }
      },
    );
  }
}


Widget _footer(bool isMobile) {
  return Container(
    width: double.infinity,
    color: const Color(0xFF1E293B),
    padding: EdgeInsets.all(isMobile ? 20 : 30),
    child: Column(
      children: [
        Wrap(
          spacing: isMobile ? 20 : 40,
          runSpacing: isMobile ? 10 : 0,
          alignment: WrapAlignment.center,
          children: [
            _footerLink("Courses", () {
              Get.to(() => const CoursesPage());
            }),
            _footerLink("The Batch", () {}),
            _footerLink("Community", () {
              Get.to(() => const ContactUsPage());
            }),
            _footerLink("Careers", () {
              Get.to(() => const CareersPage());
            }),
            _footerLink("About", () {
              Get.to(() => const About());
            }),
          ],
        ),

        const SizedBox(height: 20),
        Wrap(
          spacing: 20,
          children: [
            _socialIcon(ImageAi.facebook, () {}),
            _socialIcon(ImageAi.instagram, () {}),
            _socialIcon(ImageAi.x, () {}),
            _socialIcon(ImageAi.linkedin, () {}),
            _socialIcon(ImageAi.youtube, () {}),
          ],
        ),
        const SizedBox(height: 20),
        Text(
          "© 2025 AI Academy. All rights reserved.",
          style: GoogleFonts.poppins(
            color: Colors.white54,
            fontSize: isMobile ? 10 : 12,
          ),
        ),
      ],
    ),
  );
}

Widget _footerLink(String text, VoidCallback onTap) {
  return GestureDetector(
    onTap: onTap,
    child: Text(
      text,
      style: GoogleFonts.poppins(color: Colors.white70, fontSize: 14),
    ),
  );
}

Widget _socialIcon(String assetPath, VoidCallback onTap) {
  return IconButton(
    onPressed: onTap,
    icon: ImageIcon(AssetImage(assetPath), color: Colors.white, size: 24),
  );
}
