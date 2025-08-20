// document_details_screen.dart
import 'package:auto_route/annotations.dart';
import 'package:bootstrap_icons/bootstrap_icons.dart';
import 'package:fax/theme.dart';
import 'package:flutter/material.dart';

import 'document_folder_screen.dart';

@RoutePage()
class DocumentDetailsScreen extends StatelessWidget {
  final DocumentItem document;
  const DocumentDetailsScreen({super.key, required this.document});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actionsPadding: EdgeInsets.all(12),
        title: Text(document.name),
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

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Document Image
            Container(
              height: 380,
              width: MediaQuery.of(context).size.width*1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                  image: AssetImage(document.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const SizedBox(height: 16),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: Colors.grey.shade500,
                  width: 0.5
                )
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Status",style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue.shade100,
                        ),

                          child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Center(child: Text("${document.status}",style: TextStyle(
                          color: AppColors.primaryColor
                        ),)),
                      )),
                    ],
                  ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("From",style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),),
                        Text("+1(555)987-6543"),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("To",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Text("+1(555)987-6543"),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Recipient",style: TextStyle(
                            fontWeight: FontWeight.w700
                        ),),
                        Text("Insurance claim",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(

                      color: Colors.grey,
                      thickness: 0.5,

                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Sent",style: TextStyle(
                            fontWeight: FontWeight.w700
                        ),),
                        Text("Dec 10,2023 2:30:15 PM",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivered",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Text("Dec 10,2023 2:30:15 PM"),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Attempts",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Text("1"),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Pages",style: TextStyle(
                            fontWeight: FontWeight.bold
                        ),),
                        Text(document.pages),
                      ],
                    ),


                  ],
                ),
              ),
            )

          ],
        ),
      ),
    );
  }
}

