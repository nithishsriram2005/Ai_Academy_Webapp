import 'package:ai_academy/view/Resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ai_academy/constants/image.dart';
import 'package:ai_academy/view/course/Courses_page.dart';
import 'package:ai_academy/view/CONTACT%20US%20PAGE/contact_us_page.dart';
import 'package:ai_academy/view/AI%20academy%20sing%20in%20&%20sign%20up%20page/sing_in_page.dart';
import 'package:ai_academy/view/home/web_home.dart';
import 'package:ai_academy/services/firebase_auth_service.dart';
import 'package:get/get.dart';

class CommonHeader extends StatefulWidget implements PreferredSizeWidget {
  final GlobalKey<ScaffoldState> scaffoldKey;

  const CommonHeader({super.key, required this.scaffoldKey});

  @override
  State<CommonHeader> createState() => _CommonHeaderState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _CommonHeaderState extends State<CommonHeader> {

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    final isTablet =
        MediaQuery.of(context).size.width < 1100 &&
        MediaQuery.of(context).size.width >= 800;
    final user = FirebaseAuthService.getCurrentUser();

    return AppBar(
      automaticallyImplyLeading: false,
      elevation: 0,
      backgroundColor: Colors.white,
      leading:
          isMobile
              ? IconButton(
                icon: const Icon(Icons.menu, color: Colors.black87),
                onPressed: () => widget.scaffoldKey.currentState!.openDrawer(),
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
            user != null ? _userMenu(user.email ?? 'User', isTablet) : _loginButton(isTablet),
          ],
        ],
      ),
    );
  }

  Widget _loginButton(bool isTablet) {
    return ElevatedButton(
      onPressed: () => Get.to(() => const SignInPage()),
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
    );
  }

  Widget _userMenu(String email, bool isTablet) {
    return PopupMenuButton<String>(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: isTablet ? 12 : 16,
          vertical: isTablet ? 8 : 12,
        ),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[300]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.account_circle, color: Colors.grey[600]),
            SizedBox(width: 8),
            Text(
              email.length > 15 ? '${email.substring(0, 15)}...' : email,
              style: GoogleFonts.poppins(
                fontSize: isTablet ? 12 : 14,
                color: Colors.black87,
              ),
            ),
            Icon(Icons.arrow_drop_down, color: Colors.grey[600]),
          ],
        ),
      ),
      onSelected: (value) async {
        if (value == 'signout') {
          await FirebaseAuthService.signOut();
          Get.offAll(() => const SignInPage());
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: 'signout',
          child: Row(
            children: [
              Icon(Icons.logout, color: Colors.red),
              SizedBox(width: 8),
              Text('Sign Out'),
            ],
          ),
        ),
      ],
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

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
