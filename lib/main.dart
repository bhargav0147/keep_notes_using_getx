import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:keep_notes_using_getx/notes/view/dash_screen.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) =>
        Sizer(
          builder: (context, orientation, deviceType) =>
              GetMaterialApp(
                useInheritedMediaQuery: true,
                debugShowCheckedModeBanner: false,
                routes: {
                  '/':(p0) => DashScreen(),
                },
              ),
        ),
  ));
}