import 'package:flutter/material.dart';
import 'package:socialio/pages/camera/parts/body.dart';

// each page has the parts to it which is the body and the background
// they make up what the page looks like
// this class just runs the other classes
class CameraPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}
