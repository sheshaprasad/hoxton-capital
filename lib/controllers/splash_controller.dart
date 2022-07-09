import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '/controllers/server_controller.dart';

import '../models/data_models.dart';

class SplashController extends GetxController{

  late RxList<Data> data = (List<Data>.of([])).obs;
  RxDouble val1= 10000.0.obs, val2 = 15000.0.obs, val3 = 23000.0.obs;

  getData(){
    ServerController sc = Get.find();
    sc.getInitialData();
  }
}