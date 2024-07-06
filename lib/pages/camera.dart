import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_camera/flutter_camera.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  @override
  Widget build(BuildContext context) {
    return FlutterCamera(
      color: const Color.fromARGB(255, 0, 255, 64),
      onImageCaptured: (value) {
        final path = value.path;
        // print("::::::::::::::::::::::::::::::::: $path");
        if (path.contains('.jpg')) {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: Image.file(File(path)),
                );
              });
        }
      },
      onVideoRecorded: (value) {
        // final path = value.path;
        // print('::::::::::::::::::::::::;; dkdkkd $path');
        ///Show video preview .mp4
      },
    );
    // return Container();
  }
}