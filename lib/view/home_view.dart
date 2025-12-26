import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Theme.of(context).colorScheme.surfaceTint,
            Theme.of(context).colorScheme.surfaceDim,
            Theme.of(context).colorScheme.surfaceBright,
          ],
        ),
      ),
      child: Center(
        child: Column(mainAxisSize: MainAxisSize.max, children: [
            
          ],
        ),
      ),
    );
  }
}
