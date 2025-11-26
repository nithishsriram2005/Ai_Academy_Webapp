import 'package:ai_academy/view/Resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:ai_academy/view/home/web_home.dart';
import 'package:ai_academy/view/course/Courses_page.dart';
import 'package:ai_academy/view/CONTACT%20US%20PAGE/contact_us_page.dart';
import 'package:ai_academy/view/about/about.dart';

class CommonBottomNavigation extends StatelessWidget {
  final int currentIndex;

  const CommonBottomNavigation({super.key, this.currentIndex = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 4,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          _buildNavItem(
            0,
            Icons.home,
            "Home",
            () => Get.offAll(() => const WebHome()),
          ),
          _buildNavItem(
            1,
            Icons.school,
            "Courses",
            () => Get.offAll(() => const CoursesPage()),
          ),
          _buildNavItem(
            2,
            Icons.library_books,
            "ResourcesPages",
            () => Get.offAll(() =>  Resources()),
          ),
          _buildNavItem(
            3,
            Icons.contact_mail,
            "Contact",
            () => Get.offAll(() => const ContactUsPage()),
          ),
          _buildNavItem(
            4,
            Icons.info,
            "About",
            () => Get.offAll(() => const About()),
          ),
        ],
      ),
    );
  }

  Widget _buildNavItem(
    int index,
    IconData icon,
    String label,
    VoidCallback onTap,
  ) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: isSelected ? const Color(0xff2563EB) : Colors.grey,
            size: 24,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: GoogleFonts.poppins(
              fontSize: 12,
              color: isSelected ? const Color(0xff2563EB) : Colors.grey,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
