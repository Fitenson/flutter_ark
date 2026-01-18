import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:playground/src/app/desktop/navbar.desktop.dart';

final class DocsPage extends ConsumerStatefulWidget {
  const DocsPage({
    super.key
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DocsPageState();
}

final class _DocsPageState extends ConsumerState<DocsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DesktopNavbar(),
      body: Center(
        child: Text('Docs'),
      )
    );
  }
}
