import 'package:auto_route/auto_route.dart';
import 'package:fax/screens/account/account_screen.dart';
import 'package:fax/screens/account/generate_number/generate_number_screen.dart';
import 'package:fax/screens/account/profile_detail/profile_details_screen.dart';
import 'package:flutter/foundation.dart';

import '../components/utilities.dart';
import '../screens/account/subscriptions/subscriptions_screen.dart';
import '../screens/ai_tools/ai_tools_screen.dart';
import '../screens/home/document_folder/document_details_screen.dart';
import '../screens/home/document_folder/document_folder_screen.dart';
import '../screens/home/home_screen.dart';
import '../screens/new_fax/new_fax_screen.dart';
import '../screens/new_fax/recent_filed_details/files_details_screen.dart';
import '../screens/new_fax/templates/template_screen.dart';
import '../screens/shell_screen.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      page: ShellRoute.page,
      path: "/",
      children: [
        AutoRoute(page: HomeRoute.page, path: ""),
        AutoRoute(page: NewFaxRoute.page),
        AutoRoute(page: AiToolsRoute.page),
        AutoRoute(page: AccountRoute.page),
      ],
    ),

    AutoRoute(page: GenerateFaxNumberRoute.page),
    AutoRoute(page: ProfileDetailRoute.page),
    AutoRoute(page: TemplateRoute.page),
    AutoRoute(page: SubscriptionsRoute.page),
    AutoRoute(page: FileDetailsRoute.page),
    AutoRoute(page: DocumentFolderRoute.page),
    AutoRoute(page: DocumentDetailsRoute.page)


  ];
}
