import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';

import '../widgets/template_card.dart';

@RoutePage()
class TemplateScreen extends StatelessWidget {
  const TemplateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cover Page Templates"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            TemplateCard(title: "Classic"),
            SizedBox(height: 16),
            TemplateCard(title: "Modern"),
            SizedBox(height: 16),
            TemplateCard(title: "Professional"),
            SizedBox(height: 16),
            TemplateCard(title: "Simple"),
          ],
        ),
      ),
    );
  }
}



