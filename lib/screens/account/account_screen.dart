import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fax/theme.dart';
import 'package:flutter/material.dart';

import '../../routes/router.dart';

@RoutePage()
class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});
  void _navigateToGenerateFaxNumber(BuildContext context) {
    context.router.push(const GenerateFaxNumberRoute());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cardColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Fixed profile header
            Container(
              color: AppColors.cardColor,
              padding: const EdgeInsets.symmetric(vertical: 24),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(
                      'assets/images/profile.jpg',
                    ), // Replace with your image
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'John Smith',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '+1 (555) 123-4567',
                    style: TextStyle(fontSize: 14, color: Colors.blueAccent),
                  ),
                ],
              ),
            ),

            // Scrollable list
            Expanded(
              child: Container(
                color: AppColors.surfaceColor,
                child: SingleChildScrollView(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _sectionTitle('Account Management'),
                      _tile(Icons.phone, 'Generate Fax Number',onTap: () => _navigateToGenerateFaxNumber(context)),
                      _tile(Icons.person_outline, 'Profile Details',onTap: () => context.router.push(const ProfileDetailRoute())),
                      _tile(Icons.subscriptions, 'Subscription',onTap: () => context.router.push(const SubscriptionsRoute())),

                      _sectionTitle('App Preferences'),
                      _tile(Icons.notifications_none, 'Notifications'),
                      _tile(Icons.language, 'Language'),

                      _sectionTitle('Help & Support'),
                      Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        decoration: BoxDecoration(
                          color: AppColors.cardColor,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: AppColors.borderColor),
                        ),
                        child: ExpansionTile(
                          tilePadding: const EdgeInsets.symmetric(
                            horizontal: 12,
                          ),
                          collapsedShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          title: Row(
                            children: [
                              Icon(Icons.help_outline, color: Colors.grey[800]),
                              const SizedBox(width: 12),
                              const Text(
                                'Help & FAQ',
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                          childrenPadding: const EdgeInsets.only(
                            bottom: 12,
                            right: 12,
                            left: 12,
                            top: 4,
                          ),
                          expandedCrossAxisAlignment:
                              CrossAxisAlignment.stretch,
                          children: [
                            _tile(Icons.question_answer, 'FAQ Support'),
                            _tile(
                              Icons.report_problem_outlined,
                              'Report a Problem',
                            ),
                            _tile(Icons.feedback_outlined, 'Send Feedback'),
                          ],
                        ),
                      ),
                      _tile(Icons.help_outline, 'Terms & Privacy'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          color: Colors.black54,
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String title, {VoidCallback? onTap}) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.borderColor),
      ),
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[800]),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.borderColor,
        ),
        onTap: onTap,
      ),
    );
  }
}
