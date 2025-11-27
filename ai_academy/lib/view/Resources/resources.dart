import 'package:flutter/material.dart';
import 'package:ai_academy/widgets/common_header.dart';
import 'package:ai_academy/widgets/common_app_footer.dart';
import 'package:ai_academy/widgets/common_drawer.dart';
import 'package:ai_academy/widgets/resource_description.dart';
import 'package:ai_academy/widgets/guides_section.dart';
import 'package:ai_academy/widgets/ebooks_section.dart';
import 'package:ai_academy/widgets/course_slides_section.dart';
import 'package:ai_academy/widgets/ai_notes_section.dart';
import 'package:ai_academy/widgets/other_resources_section.dart';

class Resources extends StatefulWidget {
  const Resources({super.key});

  @override
  State<Resources> createState() => _ResourcesState();
}

class _ResourcesState extends State<Resources> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  String selectedCategory = 'All';

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 800;
    
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: CommonHeader(scaffoldKey: _scaffoldKey),
      drawer: isMobile ? const CommonDrawer() : null,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ResourceDescription(onCategorySelected: (category) => setState(() => selectedCategory = category)),
            _buildSelectedContent(),
            CommonAppFooter(isMobile: isMobile),
          ],
        ),
      ),
    );
  }



  Widget _buildSelectedContent() {
    switch (selectedCategory) {
      case 'Guides':
        return GuidesSection();
      case 'Ebooks':
        return EbooksSection();
      case 'Course Slides':
        return CourseSlidesSection();
      case 'AI Notes':
        return AiNotesSection();
      case 'Other Resources':
        return OtherResourcesSection();
      default:
        return Column(
          children: [
            GuidesSection(),
            EbooksSection(),
            CourseSlidesSection(),
            AiNotesSection(),
            OtherResourcesSection(),
          ],
        );
    }
  }
}
