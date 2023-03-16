import 'dart:developer';

import 'package:get/get.dart';

class ProductsController extends GetxController {
  RxList widgets = [].obs;
  RxInt counter = 1.obs;
  @override
  void onInit() {
    log("OnInit ProductsController");
    log(hashCode.toString());
    super.onInit();
  }

  @override
  void onReady() {
    log("OnReady ProductsController");
    log(hashCode.toString());

    super.onReady();
  }

  @override
  void onClose() {
    log("OnClose ProductsController");
    log(hashCode.toString());
    super.onClose();
  }
}
