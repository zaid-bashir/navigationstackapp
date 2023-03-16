import 'dart:developer';

import 'package:get/get.dart';

class ProductDetailController extends GetxController {
  @override
  void onInit() {
    log("OnInit ProductDetailController");
    log(hashCode.toString());
    super.onInit();
  }

  @override
  void onReady() {
    log("OnReady ProductDetailController");
    log(hashCode.toString());
    super.onReady();
  }

  @override
  void onClose() {
    log("OnClose ProductDetailController");
    log(hashCode.toString());
    super.onClose();
  }
}
