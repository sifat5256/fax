import 'package:auto_route/auto_route.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:flutter/material.dart';

import '../../../components/utilities.dart';
import '../../../theme.dart';

@RoutePage()
class FileDetailsScreen extends StatelessWidget {
  final AutoGridItemModel item;

  const FileDetailsScreen({
    super.key,
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(item.name),
        toolbarHeight: 48, // Reduced app bar height
        elevation: 0,
        actionsPadding: EdgeInsets.all(12),
        actions: [
          Icon(BootstrapIcons.box_arrow_in_down,color: Colors.blue,size: 17,),
          SizedBox(width: 12,),
          Icon(BootstrapIcons.trash,color: Colors.red,size: 17,),
          SizedBox(width: 12,),
          Icon(BootstrapIcons.upc_scan,color: Colors.blue,size: 17,),
          SizedBox(width: 12,),
          Icon(BootstrapIcons.x_lg,size: 17,),

        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Stack(
         // fit: StackFit.expand, // Makes stack fill all available space
          children: [
            // Main image content
            Positioned.fill(
              child: Image.asset(
                item.image,
                fit: BoxFit.contain,
                alignment: Alignment.topCenter, // Aligns image to top
              ),
            ),

            // Bottom shadow overlay
            Positioned(
              bottom: 200,
              left: 0,
              right: 0,
              height: 80,
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.3),
                      Colors.black.withOpacity(0.2),
                      Colors.black.withOpacity(0.1),
                      Colors.transparent
                    ],
                  ),
                ),
              ),
            ),

            // Action buttons
            Positioned(
              bottom: 210,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildActionButton(
                    icon: Icons.document_scanner,
                    label: 'OCR',
                    onTap: _handleOcrAction,
                  ),
                  _buildActionButton(
                    icon: Icons.edit,
                    label: 'Edit',
                    onTap: _handleEditAction,
                  ),
                  _buildActionButton(
                    icon: Icons.share,
                    label: 'Share',
                    onTap: _handleShareAction,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w500,
                color:Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleOcrAction() {
    // OCR implementation
  }

  void _handleEditAction() {
    // Edit implementation
  }

  void _handleShareAction() {
    // Share implementation
  }
}