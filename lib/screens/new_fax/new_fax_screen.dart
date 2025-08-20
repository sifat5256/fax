import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:fax/components/utilities.dart';
import 'package:fax/routes/router.dart';
import 'package:flutter/material.dart';

import '../../components/input.dart';
import '../../theme.dart';

@RoutePage()
class NewFaxScreen extends StatelessWidget {
  const NewFaxScreen({super.key});

  final List<AutoGridItemModel> items = const [
    AutoGridItemModel(image: "assets/images/1.jpg", name: "Item 1"),
    AutoGridItemModel(image: "assets/images/2.jpg", name: "Item 2"),
    AutoGridItemModel(image: "assets/images/1.jpg", name: "Item 3"),
    AutoGridItemModel(image: "assets/images/2.jpg", name: "Item 4"),
    // Add more items as needed
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
            SizedBox(height: 16),
            _recipientFaxLabel(),
            SizedBox(height: 10),
            _faxNumberInput(),
            SizedBox(height: 24),
            _coverPageStyle(context),
            SizedBox(height: 24),
            _selectDocumentLabel(),
            SizedBox(height: 10),
            _documentSelection(),
            SizedBox(height: 24),
            _recentFilesLabel(),
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
      title: Text("Send new fax", style: TextStyle(fontWeight: FontWeight.w600)),
    );
  }

  Widget _recipientFaxLabel() {
    return Text("Recipient Fax Number", style: TextStyle(fontSize: 14));
  }

  Widget _faxNumberInput() {
    return FaxNumberInput(controller: TextEditingController());
  }

  Widget _coverPageStyle(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppSizes.small),
        border: Border.all(color: AppColors.borderColor),
        color: AppColors.cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppSizes.medium),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Cover Page"),
            TextButton(
              style: ButtonStyle(
                backgroundColor: WidgetStatePropertyAll(AppColors.surfaceColor,)
              ),
              onPressed: () {
                context.pushRoute(const TemplateRoute());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("Classic Selected"),
                  SizedBox(width: 8),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _selectDocumentLabel() {
    return Text("Select Document", style: TextStyle(fontSize: 14));
  }

  Widget _documentSelection() {
    return Row(
      children: [
        Expanded(
          child: InkWell(
            onTap: () {
              // Your button action
            },
            borderRadius: BorderRadius.circular(AppSizes.small),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.small),
                border: Border.all(color: AppColors.borderColor),
                color: AppColors.cardColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.upload_file, size: 24, color: AppColors.primaryColor),
                  SizedBox(height: 8),
                  Text(
                    "Upload PDF/Doc",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: AppSizes.small),
        Expanded(
          child: InkWell(
            onTap: () {
              // Your button action
            },
            borderRadius: BorderRadius.circular(AppSizes.small),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppSizes.small),
                border: Border.all(color: AppColors.borderColor),
                color: AppColors.cardColor,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.camera_alt_outlined, size: 24, color: AppColors.primaryColor),
                  SizedBox(height: 8),
                  Text(
                    "Camera Scan",
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }



  Widget _recentFilesLabel() {

    return Text("Recent Files", style: TextStyle(fontSize: 14));
  }

  Widget _recentFiles() {
    return RecentsAutoGridItems(items: items);
  }
}
