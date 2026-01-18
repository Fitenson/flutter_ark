import 'package:flutter/material.dart';
import 'package:flutter_ark/flutter_ark.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final class Dashboard extends ConsumerStatefulWidget {
  const Dashboard({
    super.key
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _DashboardState();
}

final class _DashboardState extends ConsumerState<Dashboard> with ArkStatefulNavigation<Dashboard> {
  @override
  String get path => '/';

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(child: Text('Dashboard')),
    );
  }
}
