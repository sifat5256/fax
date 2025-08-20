import 'package:auto_route/auto_route.dart';
import 'package:fax/components/utilities.dart';
import 'package:fax/routes/router.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ShellScreen extends StatelessWidget {
  const ShellScreen({super.key});

  final List<ToolbarItem> _toolbarItems = const [
    ToolbarItem(icon: Icons.home, label: 'Home', index: 0),
    ToolbarItem(icon: Icons.history, label: 'New Tax', index: 1),
    ToolbarItem(icon: Icons.star, label: 'AI Tools', index: 2),
    ToolbarItem(icon: Icons.person, label: 'Account', index: 3),
  ];

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      routes: [HomeRoute(),NewFaxRoute(), AiToolsRoute(), AccountRoute()],
      builder: (context, child) {
        final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(
          body: child,
          bottomNavigationBar: CustomToolbarAdvanced(
            items: _toolbarItems,
            selected: tabsRouter.activeIndex,
            onSelect: (index) {
              tabsRouter.setActiveIndex(index);
            },
          ),
        );
      },
    );
  }
}
