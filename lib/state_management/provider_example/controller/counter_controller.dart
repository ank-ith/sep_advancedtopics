//file for state change (THROUGH PROVIDER)
import 'package:flutter/material.dart';
import 'package:sep_advancedtopics/state_management/provider_example/model/count.dart';

class CounterProvider extends ChangeNotifier{//to moniter state change
  Count inccounter=Count(0);
  Count get counter_value=>inccounter;
  void increment_Count(){
    inccounter.value++;
    notifyListeners();
  }
}