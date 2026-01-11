import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';

final class DesktopNavbar extends StatefulWidget implements PreferredSizeWidget {
  const DesktopNavbar({ super.key });

  @override
  State<StatefulWidget> createState() => _DesktopNavbarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _DesktopNavbarState extends State<DesktopNavbar> {
  @override
  Widget build(BuildContext context) {
    final theme = ArkTheme.of(context);

    return AppBar(
      title: Row(
        children: [
          ArkButton.destructive(
            child: Text('Data'),
          )
          // ArkButton(
          //   child: const Text('Docs'),
          // ),
          // const SizedBox(width: 16),
          // ArkButton(
          //   child: const Text('UI Components'),
          // )
        ],
      ),
      centerTitle: true,
      // backgroundColor: theme.colorScheme.primary,
      elevation: 2,
      // leading: ArkIconButton.outline(
      //     icon: const Icon(Icons.directions_boat_filled_outlined)
      // ),
      automaticallyImplyLeading: false,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(16)
        )
      ),
    );
  }
}
