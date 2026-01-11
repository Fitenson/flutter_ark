import 'package:flutter/material.dart';

final class Dashboard extends StatefulWidget {
  const Dashboard({
    super.key
  });

  @override
  State<StatefulWidget> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      child: Center(child: Text('Dashboard')),
    );
  }
}
