import 'package:auto_route/annotations.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:fax/components/utilities.dart';
import 'package:flutter/material.dart';

import '../../theme.dart';

@RoutePage()
class AiToolsScreen extends StatelessWidget {
   AiToolsScreen({super.key});

  final List<AiToolsItemModel> items = const [
    AiToolsItemModel(
      icon: BootstrapIcons.upc_scan,
      title: "OCR Scanner",
      description: "Extract text from documents",
      color: Colors.blue

    ),
    AiToolsItemModel(
      icon: BootstrapIcons.card_image,
      title: "Image Enhancement",
      description: "Improve document clarity",
      color: Colors.green
    ),
    AiToolsItemModel(
      icon: BootstrapIcons.list,
      title: "Translation",
      description: "Translate to any language",
      color: Colors.amber
    ),
    AiToolsItemModel(
      icon: BootstrapIcons.pencil_square,
      title: "Summary Generator",
      description: "Auto-generate summaries",
      color: Colors.blueAccent
    ),
    AiToolsItemModel(
      icon: BootstrapIcons.eye_slash,
      title: "Redaction Tool",
      description: "Hide sensitive information",
      color: Colors.redAccent
    ),
    AiToolsItemModel(
      icon: BootstrapIcons.pencil_square,
      title: "Form Filler",
      description: "Auto-fill forms with AI",
      color: Colors.lightGreen
    ),
    AiToolsItemModel(
      icon: BootstrapIcons.send,
      title: "E-Sign",
      description: "Digitally sign documents",
    ),
    AiToolsItemModel(
      icon: BootstrapIcons.list_task,
      title: "Edit Docs",
      description: "Edit and annotate documents",
      color: Colors.deepPurpleAccent
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.surfaceColor,
      appBar: _appBar(),
      body: SingleChildScrollView(
        padding: defaultPaddingHorizontal(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 10),
            _recentFiles(),
            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  EdgeInsets defaultPaddingHorizontal() {
    return const EdgeInsets.symmetric(horizontal: 16);
  }

  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: AppColors.cardColor,
      backgroundColor: AppColors.cardColor,
      title: Text(
        "AI Tools",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: Color(0xFFFF7428),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              "Premium",
              style: TextStyle(color: AppColors.onPrimary),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }

  Widget _recentFiles() {
    return AiToolsAutoGridItems(items: items);
  }
}
