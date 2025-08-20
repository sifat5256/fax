import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fax/theme.dart';
import 'package:flutter/material.dart';

import '../../../routes/router.dart';

@RoutePage()
class ProfileDetailScreen extends StatefulWidget {
  const ProfileDetailScreen({super.key});

  @override
  State<ProfileDetailScreen> createState() => _ProfileDetailScreenState();
}

class _ProfileDetailScreenState extends State<ProfileDetailScreen> {

  PreferredSizeWidget _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      surfaceTintColor: AppColors.cardColor,
      backgroundColor: AppColors.cardColor,
      leading: IconButton(onPressed: () {

      }, icon: Icon(Icons.arrow_back_ios)),
      title: Text(
        "Profile Details",
        style: TextStyle(fontWeight: FontWeight.w600),
      ),
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
            _sectionTitle('Security Settings'),
            _tile(Icons.lock_outline, 'Change Password'),
            _sectionTitle('Account Management'),
            _tileDelete(Icons.delete_outline, 'Delete Account'),
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

  Widget _tile(IconData icon, String title) {
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
        onTap: () {if (title == 'Generate Fax Number') {
          context.router.push(const GenerateFaxNumberRoute());
        }},
      ),
    );
  }

  Widget _tileDelete(IconData icon, String title) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: AppColors.red.withValues(alpha: 0.1)),
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.red),
        title: Text(title, style: const TextStyle(
            fontWeight: FontWeight.w500, color: AppColors.red)),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: AppColors.borderColor,
        ),
        onTap: () {},
      ),
    );
  }
}
