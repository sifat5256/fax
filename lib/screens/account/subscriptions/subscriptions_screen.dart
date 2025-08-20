import 'package:auto_route/annotations.dart';
import 'package:fax/theme.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SubscriptionsScreen extends StatefulWidget {
  const SubscriptionsScreen({super.key});

  @override
  State<SubscriptionsScreen> createState() => _SubscriptionsScreenState();
}

class _SubscriptionsScreenState extends State<SubscriptionsScreen> {
  String? selectedPlan;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        title: const Text(
          "Choose Your Plan",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildPlanCard(
              title: "Basic",
              price: "\$9.90/mo",
              features: const ["100 Faxes/month", "Basic OCR", "Email support"],
              isSelected: selectedPlan == "Basic",
              onSelect: () => setState(() => selectedPlan = "Basic"),
              accentColor: Colors.blue,
            ),
            const SizedBox(height: 20),
            _buildPlanCard(
              title: "Pro",
              price: "\$19.99/mo",
              features: const [
                "Unlimited faxes",
                "Advanced OCR and AI Tools",
                "Priority support",
                "Multiple Fax Numbers",
              ],
              isSelected: selectedPlan == "Pro",
              onSelect: () => setState(() => selectedPlan = "Pro"),
              accentColor: Colors.deepPurple,
              isPopular: true,
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    selectedPlan == null
                        ? null
                        : () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('$selectedPlan plan selected'),
                            ),
                          );
                        },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  backgroundColor: AppColors.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  "Subscribe Now",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Cancel Subscription",
                      style: TextStyle(decoration: TextDecoration.underline),
                      selectionColor: Colors.blue,
                    ),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () {},
                    child: Text(
                      "Restore Purchase",
                      style: TextStyle(decoration: TextDecoration.underline),
                      selectionColor: Colors.blue,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required List<String> features,
    required bool isSelected,
    required VoidCallback onSelect,
    required Color accentColor,
    bool isPopular = false,
  }) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.only(top: 16),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? accentColor : Colors.grey[300]!,
            width: isSelected ? 2 : 1,
          ),
          // boxShadow: [
          //   if (isSelected)
          //     BoxShadow(
          //       color: Colors.blue.withOpacity(0.3),
          //       blurRadius: 10,
          //       spreadRadius: 2,
          //     ),
          // ],
        ),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title and price section
                Padding(
                  padding: const EdgeInsets.only(top: 4.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          // color: accentColor,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        price,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                ...features.map(
                  (feature) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.check, size: 20, color: AppColors.green),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            feature,
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            if (isPopular)
              Positioned(
                top: 10, // Slightly outside the card
                right: -10, // Slightly outside the card
                child: Transform.rotate(
                  angle: 0.785, // 45 degrees in radians
                  child: Container(
                    width: 100,
                    height: 24,
                    color: Colors.orange,
                    alignment: Alignment.center,
                    child: const Text(
                      "POPULAR",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.bold,
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
}
