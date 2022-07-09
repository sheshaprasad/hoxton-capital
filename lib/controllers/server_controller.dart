import 'dart:convert';

import 'package:get/get.dart';
import '/controllers/splash_controller.dart';
import '/models/data_models.dart';

class ServerController extends GetConnect{
  String url = "https://jsonplaceholder.typicode.com/users";

  getInitialData()=>get(url).then((value){
    print(value.body);
    SplashController sc = Get.find();
    var send = value.body;
    sc.data.value = List<Data>.from(send.map((model)=> Data.fromJson(model)));
    print("print "+sc.data[0].name);
  });

}