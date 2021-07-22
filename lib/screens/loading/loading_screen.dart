import 'package:brain_stacks/widgets/widgets.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DotLoader(
              color: Colors.deepPurple,
              duration: Duration(milliseconds: 800),
              size: 25,
            ),
          ],
        ),
      ),
    );
  }
}
