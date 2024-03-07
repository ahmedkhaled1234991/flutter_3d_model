import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Flutter3DController controller;
  String animationName = 'Survey';

  @override
  void initState() {
    controller = Flutter3DController();
    controller.playAnimation(animationName: animationName);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.brown[200],
        body: SafeArea(
          child: Center(
            child: Flutter3DViewer(
              controller: controller,
              src: 'assets/models/fox.glb',
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            if (animationName == 'Survey') {
              animationName = 'Walk';
            } else if (animationName == 'Walk') {
              animationName = 'Run';
            } else {
              animationName = 'Survey';
            }
            controller.playAnimation(animationName: animationName);
          },
          backgroundColor: Colors.brown,
          child: const Icon(Icons.animation),
        ));
  }
}
