
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fax/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class GenerateFaxNumberScreen extends StatefulWidget {
  const GenerateFaxNumberScreen({super.key});

  @override
  State<GenerateFaxNumberScreen> createState() => _GenerateFaxNumberScreenState();
}

class _GenerateFaxNumberScreenState extends State<GenerateFaxNumberScreen> {
  String selectedState = 'CA';

  final Map<String, List<String>> areaCodes = {
    'CA': ['213', '310', '323', '408', '415', '510', '619', '626', '650', '707', '714', '818', '831', '909', '916', '925', '949'],
    'NY': ['212', '315', '332', '516', '518'],
    'TX': ['214', '254', '281', '325', '346'],
    'FL': ['305', '321', '352', '386', '407'],
    'IL': ['217', '224', '309', '312', '331'],
  };

  final Map<String, String> states = {
    'CA': 'California',
    'NY': 'New York',
    'TX': 'Texas',
    'FL': 'Florida',
    'IL': 'Illinois',
  };
  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: AppColors.cardColor,
      backgroundColor: AppColors.cardColor,
      title: Text(
        "Generate Fax Number",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
      actions: [
        IconButton(onPressed: () => context.router.pop(), icon: const Icon(Icons.close)),
      ],
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      appBar: _appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("1. Select State", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),

            // State Buttons
            Wrap(
              spacing: 12,
              runSpacing: 12,
              children: states.entries.map((entry) {
                final isSelected = selectedState == entry.key;
                return ChoiceChip(
                  label: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(entry.value, style: const TextStyle(fontSize: 14)),
                      Text("(${entry.key})", style: const TextStyle(fontSize: 12, color: AppColors.textColor)),
                    ],
                  ),
                  showCheckmark: false,
                  selected: isSelected,
                  selectedColor: Colors.blue.shade50,
                  backgroundColor: AppColors.surfaceColor,
                  labelStyle: TextStyle(
                    color: isSelected ? Colors.blue : Colors.black87,
                  ),
                  side: BorderSide(color: isSelected ? Colors.blue : Colors.grey.shade300),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  onSelected: (_) => setState(() => selectedState = entry.key),
                );
              }).toList(),
            ),

            const SizedBox(height: 24),
            const Text("2. Select Area Code", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            const SizedBox(height: 12),

            // Area Codes
            Expanded(
              child: SingleChildScrollView(
                child: Wrap(
                  spacing: 12,
                  runSpacing: 12,
                  children: areaCodes[selectedState]!
                      .map((code) => Container(
                    width: 70,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: Text(code, style: const TextStyle(fontWeight: FontWeight.w500)),
                  ))
                      .toList(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
