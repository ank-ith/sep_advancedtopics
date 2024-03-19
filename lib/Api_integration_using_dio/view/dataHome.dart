import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:sep_advancedtopics/Api_integration_using_dio/controller/dataController.dart';
import 'package:sep_advancedtopics/Api_integration_using_dio/utils/colors.dart';
import 'package:sep_advancedtopics/Api_integration_using_dio/utils/const_snackbar.dart';

class DataHomeDio extends StatelessWidget {
  DataController controller = Get.put(DataController()); //initialize controller
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.bgColor,
      floatingActionButton: Obx(
              () =>
          controller.isNetConnected.value
              ? _buildFAB()
              : Container()),
      appBar: (AppBar(
        title: Text('Data Dio'),
        backgroundColor: MyColors.prColor,
      )),
      body: Obx(() =>
          SizedBox(
              height: double.infinity,
              width: double.infinity,
              child: controller.isNetConnected.value ? (controller.isloading.value ? Center(
                  child: CircularProgressIndicator()) : getData())
              : noInternet(context))
    ));


  }

  FloatingActionButton _buildFAB() {
    return FloatingActionButton(
      onPressed: () {
        controller.isListDown.value
            ? controller.scrollToUp()
            : controller.scrollToDown();
      },
      backgroundColor: MyColors.prColor,
      child: FaIcon(controller.isListDown.value
          ? FontAwesomeIcons.arrowUp
          : FontAwesomeIcons.arrowDown),
    );
  }

  RefreshIndicator getData() {
    return RefreshIndicator(child: ScrollablePositionedList.builder(
        itemScrollController: controller.scrollController,
        itemCount: controller.datas.length,
        itemBuilder
            : (context, index) {
          return InkWell(child: Card(child: ListTile(
            subtitle: Text('${controller.datas[index].body}'),
            title: Text('${controller.datas[index].title}'),
            leading: CircleAvatar(
              backgroundColor: MyColors.scColor,
              child: Text(controller.datas[index].id.toString()),),),),);
        }
    ), onRefresh: () {
      return controller.fetchdata();
    });
  }

  Center noInternet(BuildContext context) {
    return Center(
      child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('try again'),
          MaterialButton(onPressed: () async {
            if (await InternetConnectionChecker().hasConnection) {
              controller.fetchdata();
            }
            else {
              showCustomSnackbar(context);
            }
          })
        ],),
    );
  }
}
