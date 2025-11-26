import 'package:ai_academy/constants/image.dart';
import 'package:ai_academy/view/Resources/resources.dart';
import 'package:ai_academy/view/course/Courses_page.dart';
import 'package:ai_academy/view/CONTACT%20US%20PAGE/contact_us_page.dart';
import 'package:ai_academy/view/AI%20academy%20sing%20in%20&%20sign%20up%20page/sing_in_page.dart';
import 'package:ai_academy/view/Careers%20page/careers_page.dart';
import 'package:ai_academy/view/home/web_home.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final List<String> ecosystemLogos = [
    "assets/images/Frame1.png",
    "assets/images/Frame2.png",
    "assets/images/Frame3.png",
    "assets/images/Frame4.png",
    "assets/images/Frame5.png",
    "assets/images/Frame6.png",
    "assets/images/Frame7.png",
    "assets/images/Frame8.png",
  ];
  final List<String> companyNames = [
    "WoNera",
    "AI Fund",
    "Kira Learning",
    "Woebot Health",
    "Bearing AI",
    "Factored",
    "FourthBrain",
    "Landing AI",
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
                _navItem("Home"),
                _navItem("Courses"),
                _navItem("Newsletter"),
                _navItem("Community"),
              ] else ...[
                _navItem("Home"),
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
                    _drawerItem("Home"),
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
            _buildHeaderSection(isMobile),
            _buildMissionSection(isMobile, isTablet),
            _buildStorySection(isMobile),
            _buildEcosystemSection(isMobile),
            _buildCTASection(isMobile, isTablet),
            _footer(isMobile),
          ],
        ),
      ),
    );
  }

  Widget _buildHeaderSection(bool isMobile) {
    return Container(
      height: isMobile ? 200 : 300,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(ImageAi.about),
          fit: BoxFit.cover,
        ),
      ),
      alignment: Alignment.center,
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.black38,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(
          "About Us",
          style: GoogleFonts.poppins(
            fontSize: isMobile ? 28 : 35,
            fontWeight: FontWeight.w500,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildMissionSection(bool isMobile, bool isTablet) {
    return Container(
      padding: EdgeInsets.all(isMobile ? 30 : 60),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Our Mission",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 32 : 42,
              fontWeight: FontWeight.bold,
              color: const Color(0xff000000),
            ),
          ),
          // const SizedBox(height: 20),
          // Container(width: 80, height: 4, color: const Color(0xff2563EB)),
          // const SizedBox(height: 30),
          Container(
            width: isMobile ? double.infinity : 800,
            padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 40),
            child: Column(
              children: [
                Text(
                  "To expand and link the Deep Learning community worldwide.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 20 : 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                    height: 1.4,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  "With top-notch instruction, practical training, and a supportive community, "
                  "AI Academy is enabling the workforce worldwide to create an AI-powered future.",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                    fontSize: isMobile ? 16 : 15,
                    color: const Color(0xff000000),
                    height: 1.6,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 50),
          LayoutBuilder(
            builder: (context, constraints) {
              int crossAxisCount = isMobile ? 1 : (isTablet ? 2 : 3);
              double aspectRatio = isMobile ? 1.1 : 0.9;

              return GridView.count(
                crossAxisCount: crossAxisCount,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: 30,
                mainAxisSpacing: 30,
                childAspectRatio: aspectRatio,
                children: [
                  _buildMissionItemWithImage(
                    "assets/icon/education.png",
                    "Get a top-notch education\nto increase your technological expertise.",
                    isMobile,
                  ),
                  _buildMissionItemWithImage(
                    "assets/icon/practical.png",
                    "Receive practical instruction\nto develop your skills.",
                    isMobile,
                  ),
                  _buildMissionItemWithImage(
                    "assets/icon/knowledge.png",
                    "Gain knowledge from a cooperative\ngroup of mentors and peers.",
                    isMobile,
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildMissionItemWithImage(
    String imagePath,
    String text,
    bool isMobile,
  ) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        padding: EdgeInsets.all(isMobile ? 20 : 30),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Colors.white, Color(0xffF8FAFC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: isMobile ? 100 : 120,
              height: isMobile ? 100 : 120,
              padding: EdgeInsets.all(isMobile ? 10 : 15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(120),
                color: const Color(0xffF9EAFF),
              ),
              child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
            SizedBox(height: isMobile ? 20 : 25),
            Text(
              text,
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 15 : 16,
                fontWeight: FontWeight.w500,
                color: const Color(0xff374151),
                height: 1.4,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStorySection(bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 30 : 60),
      color: const Color(0xffD1DBE6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "Our Story",
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 28 : 36,
              fontWeight: FontWeight.bold,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "Andrew Ng, a pioneer in machine learning and education, "
            "established AI Academy in 2017 to address the \ndemand for top-notch AI instruction.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xff4E4E4E),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "AI Academy has developed world-class AI courses on Coursera that have attracted a large international \nstudent body. "
            "It has emerged as the route for anyone wishing to pursue a career in artificial \nintelligence by offering a platform "
            "for education and cultivating a close-knit community.",
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
              fontSize: isMobile ? 16 : 18,
              color: const Color(0xff4E4E4E),
              height: 1.6,
            ),
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.to(() => ContactUsPage());
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xff2563EB),
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Text(
              "Contact us",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 15,
            children: const [
              Icon(Icons.facebook, color: Colors.blue),
              Icon(Icons.camera_alt, color: Colors.purple),
              Icon(Icons.work, color: Colors.blueGrey),
              Icon(Icons.link, color: Colors.blueAccent),
              Icon(Icons.video_library, color: Colors.red),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEcosystemSection(bool isMobile) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(isMobile ? 30 : 60),
        child: Column(
          children: [
            Text(
              "Our Ecosystem",
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 28 : 36,
                fontWeight: FontWeight.bold,
                color: const Color(0xff1A497F),
              ),
            ),
            const SizedBox(height: 20),
            Container(width: 80, height: 4, color: const Color(0xff2563EB)),
            const SizedBox(height: 30),
            Text(
              "We are a part of an ecosystem of businesses working to create a future driven by AI in business,\neducation, and other areas.",
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(
                fontSize: isMobile ? 16 : 18,
                color: const Color(0xff4E4E4E),
                height: 1.6,
              ),
            ),
            const SizedBox(height: 40),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: isMobile ? 1 : 4,
                crossAxisSpacing: 40,
                mainAxisSpacing: 40,
                childAspectRatio: 296 / 174,
              ),
              itemCount: companyNames.length,
              itemBuilder: (context, index) {
                return _buildEcosystemItem(
                  companyNames[index],
                  ecosystemLogos[index],
                );
              },
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildEcosystemItem(String companyName, String logoPath) {
    return Column(
      children: [
        Container(
          width: 260,
          height: 135, 
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(logoPath),
              fit: BoxFit.fill,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: const Color(0xffE5E7EB), width: 1),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.1),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Text(
          companyName,
          style: GoogleFonts.poppins(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: const Color(0xff1A497F),
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}

Widget _buildCTASection(bool isMobile, bool isTablet) {
  return Container(
    width: double.infinity,
    padding: const EdgeInsets.all(30),
    margin: const EdgeInsets.all(30),
    decoration: BoxDecoration(
      color: const Color(0xffD1DBE6),
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (!isMobile)
          Expanded(
            flex: 1,
            child: SizedBox(
              height: 300,
              child: Center(
                child: Image.asset(
                  "assets/images/Frame1.png",
                  width: 300,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        if (!isMobile) const SizedBox(width: 30),
        Expanded(
          flex: 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isMobile) ...[
                Row(
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: const Color(0xffF3F4F6),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/Frame1.png",
                          width: 30,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Workera",
                      style: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: const Color(0xff1A497F),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 15),
              ] else ...[
                Text(
                  "Workera",
                  style: GoogleFonts.poppins(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff1A497F),
                  ),
                ),
                const SizedBox(height: 15),
              ],
              Text(
                "Don’t know where to start?",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 16 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Test your current abilities and create your personalized learning pathway to become a machine learning expert.",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.black,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                "Are you already a practitioner of machine learning?",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 16 : 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                "Determine your next course of action to further your profession and stay current with the newest methods.",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.black,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 15),

              // Final description paragraph
              Text(
                "Workera's free tests assist you in determining the abilities required for the AI positions you are interested in, and they offer the credentials, tools, and feedback you need to effectively demonstrate your skill set.",
                style: GoogleFonts.poppins(
                  fontSize: isMobile ? 14 : 16,
                  color: Colors.black,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 25),

              // Learn More button
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const ContactUsPage());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2563EB),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 30,
                    vertical: 12,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  "Learn more",
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w600,
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
  );
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
            _footerLink("About", () {}),
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

Widget _navItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: GestureDetector(
      onTap: () {
        if (title.contains("Home")) {
          Get.to(() => const WebHome());
        } else if (title.contains("Courses")) {
          Get.to(() => const CoursesPage());
        } else if (title.contains("Community")) {
          Get.to(() => const ContactUsPage());
        } else if (title.contains("ResourcesPages")) {
          Get.to(() =>  Resources());
        }
      },
      child: Text(
        title,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: const Color(0xff9C9C9C),
          fontWeight: FontWeight.w500,
        ),
      ),
    ),
  );
}

Widget _drawerItem(String title) {
  return ListTile(
    title: Text(
      title,
      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
    ),
    onTap: () {
      Get.back();
      if (title.contains("Home")) {
        Get.to(() => const WebHome());
      } else if (title.contains("Courses")) {
        Get.to(() => const CoursesPage());
      } else if (title.contains("Community")) {
        Get.to(() => const ContactUsPage());
      } else if (title.contains("ResourcesPages")) {
        Get.to(() => Resources());
      }
    },
  );
}
