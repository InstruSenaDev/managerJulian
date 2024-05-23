import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: 100,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ItemDashboard(),
            SizedBox(
              width: 30,
            ),
            _ItemDashboard(),
            SizedBox(
              width: 30,
            ),
            _ItemDashboard(),
          ],
        ),
        SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ItemDashboard(),
            SizedBox(
              width: 30,
            ),
            _ItemDashboard(),
            SizedBox(
              width: 30,
            ),
            _ItemDashboard(),
          ],
        ),
      ],
    );
  }
}

class _ItemDashboard extends StatelessWidget {
  const _ItemDashboard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      width: 300,
      height: 300,
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color(0xff2F333E),
          boxShadow: [
            const BoxShadow(
                color: Colors.black87, blurRadius: 3, offset: Offset(0, 0))
          ],
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
