import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:playground/src/docs/docs_page.dart';

final class DocsRouter extends ArkRouter {
  @override
  void registerRoutes() {
    register('/docs', (context, state) => DocsPage());
  }
}
