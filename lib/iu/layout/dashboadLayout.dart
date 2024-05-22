import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:managerapp/Widgets/Siderbar.dart';

class DashboardLayout extends StatelessWidget {
  final Widget child;
  const DashboardLayout({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [const Siderbar(), Expanded(child: child)],
      ),
    );
  }
}
