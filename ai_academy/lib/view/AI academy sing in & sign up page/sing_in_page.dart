import 'package:ai_academy/constants/image.dart';
import 'package:ai_academy/view/Joining%20Page/joinform1.dart';
import 'package:ai_academy/view/Joining%20Page/joinform2.dart';
import 'package:ai_academy/view/AI%20academy%20sing%20in%20&%20sign%20up%20page/sign_up_page.dart';
import 'package:ai_academy/services/firebase_auth_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool isStudent = true;
  bool isLoading = false;
  String? emailError;
  String? passwordError;
  bool showValidation = false;

  bool _isValidEmail(String email) {
    return RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    ).hasMatch(email);
  }

  bool _isStrongPassword(String password) {
    return RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    ).hasMatch(password);
  }

  void _validateFields() {
    setState(() {
      showValidation = true;

      // Email validation
      if (_emailController.text.isEmpty) {
        emailError = "📧 Email address is required";
      } else if (!_isValidEmail(_emailController.text)) {
        emailError = "⚠️ Please enter a valid email format";
      } else if (!_emailController.text.contains('.')) {
        emailError = "🔍 Email must contain a domain extension";
      } else {
        emailError = null;
      }

      // Password validation
      if (_passwordController.text.isEmpty) {
        passwordError = "🔒 Password is required";
      } else if (_passwordController.text.length < 8) {
        passwordError = "📏 Password must be at least 8 characters";
      } else if (!_isStrongPassword(_passwordController.text)) {
        passwordError =
            "💪 Password needs: uppercase, lowercase, number & symbol";
      } else {
        passwordError = null;
      }
    });
  }

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  Future<void> _signIn() async {
    _validateFields();

    if (emailError != null || passwordError != null) {
      return;
    }

    setState(() => isLoading = true);

    final error = await FirebaseAuthService.signIn(
      _emailController.text,
      _passwordController.text,
    );

    if (error == null) {
      Get.to(() => isStudent ? const JoinForm1() : const JoinForm2());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error), backgroundColor: Colors.red),
      );
    }

    setState(() => isLoading = false);
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
                // Simplified navigation for tablets
                _navItem("Courses"),
                _navItem("Newsletter"),
                _navItem("Community"),
              ] else ...[
                // Full navigation for desktop
                _navItem("Explore Courses"),
                _navItem("AI Newsletter"),
                _navItem("Community"),
                _navItem("ResourcesPages"),
                _navItem("Company"),
              ],
              const SizedBox(width: 20),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => const SignUpPage());
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
                  "Create Account",
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
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            width: 400,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.purple.shade100, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(2, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                const Text(
                  "Sign In",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      // Toggle (Student / Recruiter)
                      Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isStudent = true),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      isStudent
                                          ? Colors.purple.shade300
                                          : Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "As Student",
                                  style: TextStyle(
                                    color:
                                        isStudent
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: GestureDetector(
                              onTap: () => setState(() => isStudent = false),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 12,
                                ),
                                decoration: BoxDecoration(
                                  color:
                                      !isStudent
                                          ? Colors.purple.shade300
                                          : Colors.purple.shade50,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                alignment: Alignment.center,
                                child: Text(
                                  "As Recruiter",
                                  style: TextStyle(
                                    color:
                                        !isStudent
                                            ? Colors.white
                                            : Colors.black87,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      // Email
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextField(
                            "Email *",
                            controller: _emailController,
                            hasError: showValidation && emailError != null,
                          ),
                          if (showValidation && emailError != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 8),
                              child: Text(
                                emailError!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      // Password
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildTextField(
                            "Password *",
                            controller: _passwordController,
                            isPassword: true,
                            hasError: showValidation && passwordError != null,
                          ),
                          if (showValidation && passwordError != null)
                            Padding(
                              padding: const EdgeInsets.only(top: 4, left: 8),
                              child: Text(
                                passwordError!,
                                style: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          "Forgot password?",
                          style: TextStyle(color: Colors.purple.shade400),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 16),

                // Sign In button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: isLoading ? null : _signIn,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.purple.shade300,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child:
                        isLoading
                            ? const CircularProgressIndicator(
                              color: Colors.white,
                            )
                            : const Text(
                              "Sign in",
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            ),
                  ),
                ),

                const SizedBox(height: 16),

                // Divider
                Row(
                  children: const [
                    Expanded(child: Divider(thickness: 1)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      child: Text("Or"),
                    ),
                    Expanded(child: Divider(thickness: 1)),
                  ],
                ),
                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: isLoading ? null : () async {
                      setState(() => isLoading = true);
                      try {
                        final userCredential = await FirebaseAuthService.signInWithGoogle();
                        if (userCredential?.user != null) {
                          Get.to(() => isStudent ? const JoinForm1() : const JoinForm2());
                        }
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Google Sign-In failed: $e'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } finally {
                        setState(() => isLoading = false);
                      }
                    },
                    icon: Image.network(
                      "https://img.icons8.com/color/48/google-logo.png",
                      height: 24,
                    ),
                    label: const Text("Continue with Google"),
                    style: OutlinedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      side: BorderSide(color: Colors.grey.shade300),
                      backgroundColor: Colors.purple.shade50,
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Footer Links
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Don’t have an account? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const SignUpPage());
                      },
                      child: Text(
                        "Create account",
                        style: TextStyle(color: Colors.purple.shade400),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  "By signing up, you agree to our Terms Of Use and Privacy Policy",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey.shade600, fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget _buildTextField(
  String label, {
  int maxLines = 1,
  bool enabled = true,
  TextEditingController? controller,
  bool isPassword = false,
  bool hasError = false,
}) {
  return TextFormField(
    controller: controller,
    enabled: enabled,
    obscureText: isPassword,
    decoration: InputDecoration(
      hintText: label,
      hintStyle: GoogleFonts.poppins(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: Colors.black54,
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: hasError ? Colors.red : const Color(0xFFCCCCCC),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: BorderSide(
          color: hasError ? Colors.red : const Color(0xFF2563EB),
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.red),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Colors.red),
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(6),
        borderSide: const BorderSide(color: Color(0xFFCCCCCC)),
      ),
    ),
    maxLines: maxLines,
  );
}

Widget _navItem(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 12),
    child: Text(
      title,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: const Color(0xff9C9C9C),
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
