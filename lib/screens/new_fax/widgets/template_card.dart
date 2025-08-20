import 'package:flutter/material.dart';

import 'labeld_text_field.dart';


class TemplateCard extends StatelessWidget {
  final String title;
  final bool isSelected; // New property to track selection
  const TemplateCard({
    super.key,
    required this.title,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: isSelected ? Colors.blue : Colors.grey,
          width: isSelected ? 1.5 : 1,
        ),
      ),
      color: isSelected ? Colors.blue.shade50.withOpacity(0.3) : Colors.white,
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => _handleTap(context),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16,right: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 16),

                  Row(
                    children: [
                      Text(
                        title,
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.blue : Colors.black,
                        ),
                      ),

                    ],
                  ),
                  const SizedBox(height: 16),
                  const LabeledTextField(label: "To", hintText: "Recipient Name"),
                  const SizedBox(height: 12),
                  const LabeledTextField(label: "From", hintText: "Sender name"),
                  const SizedBox(height: 12),
                  const LabeledTextField(label: "Subject", hintText: "Fax subject"),
                  const SizedBox(height: 12),
                  const LabeledTextField(
                    label: "Comments",
                    maxLines: 3,
                    hintText: "Add your comments here",
                  ),
                  const SizedBox(height: 8),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "0/500",
                      style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(height: 12),

                ],
              ),
            ),

            Container(

              decoration: BoxDecoration(
                color: isSelected ? Colors.blue.shade100 : Colors.blue.shade50,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12),bottomRight:Radius.circular(12), ),
                border: Border.all(
                  color: isSelected ? Colors.grey : Colors.grey,
                  width: 1,
                ),
              ),
              child: Center(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      isSelected ? "Selected Template" : "Select Template",
                      style: TextStyle(
                        fontSize: 20,
                        color: isSelected ? Colors.black : Colors.black,
                        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleTap(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('$title template selected')),
    );
    // You would typically call a callback here to update the selected state
    // onTap?.call();
  }
}