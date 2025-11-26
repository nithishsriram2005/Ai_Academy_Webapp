import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_academy/constants/image.dart';
import 'package:ai_academy/view/course/Courses_page.dart';
import 'package:ai_academy/view/CONTACT%20US%20PAGE/contact_us_page.dart';
import 'package:ai_academy/view/Careers%20page/careers_page.dart';
import 'package:ai_academy/view/about/about.dart';
import 'package:get/get.dart';

class CommonAppFooter extends StatelessWidget {
  final bool isMobile;
  
  const CommonAppFooter({super.key, required this.isMobile});

  @override
  Widget build(BuildContext context) {
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
              _footerLink("Courses", () => Get.to(() => const CoursesPage())),
              _footerLink("The Batch", () {}),
              _footerLink("Community", () => Get.to(() => const ContactUsPage())),
              _footerLink("Careers", () => Get.to(() => const CareersPage())),
              _footerLink("About", () => Get.to(() => const About())),
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