import 'package:ai_academy/view/Resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_academy/view/course/Courses_page.dart';
import 'package:ai_academy/view/CONTACT%20US%20PAGE/contact_us_page.dart';
import 'package:ai_academy/view/AI%20academy%20sing%20in%20&%20sign%20up%20page/sing_in_page.dart';
import 'package:ai_academy/view/home/web_home.dart';
import 'package:ai_academy/services/firebase_auth_service.dart';
import 'package:get/get.dart';

class CommonDrawer extends StatefulWidget {
  const CommonDrawer({super.key});

  @override
  State<CommonDrawer> createState() => _CommonDrawerState();
}

class _CommonDrawerState extends State<CommonDrawer> {

  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuthService.getCurrentUser();
    
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Colors.deepPurple),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "AI Academy",
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (user != null) ...[
                  SizedBox(height: 10),
                  Text(
                    user.email ?? 'User',
                    style: GoogleFonts.poppins(
                      color: Colors.white70,
                      fontSize: 14,
                    ),
                  ),
                ],
              ],
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
            child: user != null
                ? ElevatedButton(
                    onPressed: () async {
                      await FirebaseAuthService.signOut();
                      Get.offAll(() => const SignInPage());
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                    child: Text(
                      "Sign Out",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  )
                : ElevatedButton(
                    onPressed: () => Get.to(() => const SignInPage()),
                    child: Text(
                      "Log In",
                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                    ),
                  ),
          ),
        ],
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
          Get.to(() =>  Resources());
        }
      },
    );
  }
}
