import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'package:playground/src/app/nav_item.dart';
import 'package:flutter_ark/src/navigation/router_observer.dart';

final class DesktopNavbar extends ConsumerStatefulWidget implements PreferredSizeWidget {
  const DesktopNavbar({ super.key });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DesktopNavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DesktopNavbarState extends ConsumerState<DesktopNavbar> {
  final List<NavItem> _navItems = [
    NavItem(path: '/docs', label: 'Docs'),
    NavItem(path: '/components', label: 'UI Components'),
  ];
  
  void _navigateTo(String path, BuildContext context) {
    ref.read(activePathProvider.notifier).state = path;
    GoRouter.of(context).go(path);
  }
  
  @override
  Widget build(BuildContext context) {
    final theme = ArkTheme.of(context);
    final activeItem = ref.watch(activePathProvider);

    return AppBar(
      title: Row(
        children: _navItems.map((item) {
          final isActive = activeItem == item.path;
          
          return Padding(
              padding: EdgeInsets.symmetric(horizontal: 2),
              child: ArkButton.ghost(
                onPressed: () => _navigateTo(item.path, context),
                child: Text(
                    item.label,
                    style: TextStyle(
                      fontWeight: isActive ? FontWeight.bold : FontWeight.normal,
                      color: isActive ? theme.colorScheme.primary : null
                    ),
                ),
              ),
          );
        }).toList(),
      ),
      centerTitle: true,
      backgroundColor: theme.colorScheme.background,
      elevation: 2,
      leading: ArkIconButton.outline(
          icon: const Icon(Icons.directions_boat_filled_outlined)
      ),
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16)
        )
      ),
    );
  }
}
