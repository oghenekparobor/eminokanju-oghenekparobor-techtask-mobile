import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tech_task/core/constants-n-assets/assets.dart';
import 'package:tech_task/core/extension/context.dart';
import 'package:tech_task/module/lunch/presentation/views/home.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({super.key});

  @override
  State<SplachScreen> createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  @override
  void initState() {
    Future.delayed(Duration(milliseconds: 1200), () {
      // did this to use both material page route and named route
      context.nav.pushReplacement(
        MaterialPageRoute(
          builder: (_) => HomeScreen(),
        ),
      );
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElasticIn(
          child: Image.asset(kLogo),
        ),
      ),
    );
  }
}
