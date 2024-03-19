import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sep_advancedtopics/Api_integration_using_dio/view/dataHome.dart';

void main(){
  runApp(DioMain());
}

class DioMain extends StatelessWidget {
  const DioMain({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: DataHomeDio(),
    );
  }
}
