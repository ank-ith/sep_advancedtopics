import 'package:flutter/animation.dart';
import 'package:get/get.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import '../model/datamodel.dart';
import '../service/dioService.dart';

class DataController extends GetxController {
  RxList<DataModel> datas = RxList(); //similar to -var datas=[].obs
  RxBool isloading = true.obs;
  RxBool isListDown = false.obs;
  RxBool isNetConnected = true.obs;
  var url = 'https://jsonplaceholder.typicode.com/posts';
  var scrollController = ItemScrollController(); //to control postion of scrollable positioned list
//to get data from api
  fetchdata() async {
    isInternetConnected();
    isloading.value = true;
    var response = await DioService().getData(url);
    if (response.statusCode == 200) {
      response.data.forEach((data) {
        datas.add(DataModel.fromJson(data));
      });
      isloading.value = false;
    }
  }

//internet connection checking
  void isInternetConnected() async {
    isNetConnected.value = await InternetConnectionChecker().hasConnection;
  }

//scroll listview to down
  scrollToDown() {
    scrollController.scrollTo(
        index: datas.length, duration: Duration(seconds: 4),
        curve:Curves.bounceIn);
    isListDown.value=true;
  }
  scrollToUp(){
    scrollController.scrollTo(
        index: 0, duration: Duration(seconds: 4),
        curve:Curves.linearToEaseOut);
    isListDown.value=false;
  }
  @override
  void onInit() {
    fetchdata();
    isInternetConnected();
    super.onInit();
  }
}