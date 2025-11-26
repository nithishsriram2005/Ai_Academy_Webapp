import 'package:ai_academy/constants/image.dart';
import 'package:ai_academy/view/AI%20academy%20sing%20in%20&%20sign%20up%20page/sing_in_page.dart';
import 'package:ai_academy/view/Resources/resources.dart';
import 'package:ai_academy/view/about/about.dart';
import 'package:ai_academy/view/course/Courses_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_academy/widgets/common_footer.dart';

class ContactUsPage extends StatefulWidget {
  const ContactUsPage({super.key});

  @override
  State<ContactUsPage> createState() => _ContactUsPageState();
}

class _ContactUsPageState extends State<ContactUsPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedCategory;

  final List<String> categories = [
    "Feedback / Questions about our online courses",
    "Speaking engagement for Andrew Ng",
    "Press or interview request",
    "Entrepreneurship or career advice",
    "Business partnership or corporate training",
    "Other",
  ];

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 800;
    final isTablet = screenWidth >= 800 && screenWidth < 1100;

    final containerWidth =
        isMobile
            ? screenWidth * 0.9
            : isTablet
            ? screenWidth * 0.7
            : 600.0;

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        leading:
            isMobile
                ? IconButton(
                  icon: const Icon(Icons.menu, color: Colors.black87),
                  onPressed: () => scaffoldKey.currentState!.openDrawer(),
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
            const SizedBox(height: 25),
            Center(
              child: SizedBox(
                width: containerWidth,
                child: Column(
                  children: [
                    Text(
                      "Contact us",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth < 600 ? 22 : 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      "To contact us, please fill out the form below.",
                      style: GoogleFonts.poppins(
                        fontSize: screenWidth < 600 ? 13 : 14,
                        color: Colors.black54,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32),
                    Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextField("First name*"),
                          const SizedBox(height: 16),
                          _buildTextField("Last name*"),
                          const SizedBox(height: 16),
                          _buildTextField("Email*"),
                          const SizedBox(height: 24),
                          Text(
                            "Which category does your request fall under?",
                            style: GoogleFonts.poppins(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:
                                categories.map((category) {
                                  return RadioListTile<String>(
                                    title: Text(
                                      category,
                                      style: GoogleFonts.poppins(fontSize: 13),
                                    ),
                                    value: category,
                                    groupValue: _selectedCategory,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedCategory = value;
                                      });
                                    },
                                  );
                                }).toList(),
                          ),
                          const SizedBox(height: 16),
                          _buildTextField("Message*", maxLines: 4),
                          const SizedBox(height: 24),
                          SizedBox(
                            width: 180,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.purpleAccent,
                                padding: const EdgeInsets.symmetric(
                                  vertical: 14,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        "Form Submitted Successfully",
                                      ),
                                    ),
                                  );
                                }
                              },
                              child: Text(
                                "Submit",
                                style: GoogleFonts.poppins(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
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
              ),
            ),
            const SizedBox(height: 50),
            // Footer
            CommonFooter(isMobile: screenWidth < 600 ? true : false),
          ],
        ),
      ),
    );
  }
  Widget _buildTextField(
    String label, {
    int maxLines = 1,
    bool enabled = true,
  }) {
    return TextFormField(
      enabled: enabled,
      decoration: InputDecoration(
        hintText: label,
        hintStyle: GoogleFonts.poppins(
          fontSize: 13,
          fontWeight: FontWeight.w500,
          color: Colors.black54,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Color(0xFF2563EB),
          ), 
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(
            color: Color(0xFFCCCCCC),
          ), 
        ),
      ),
      maxLines: maxLines,
      validator:
          (value) =>
              (value == null || value.isEmpty)
                  ? "This field is required"
                  : null,
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
              _footerLink("Careers", () {}),
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
}

Widget _navItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: GestureDetector(
      onTap: () {
        if (title.contains("Courses")) {
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
