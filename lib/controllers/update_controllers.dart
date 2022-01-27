
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/serves/http_server.dart';

class UpdateController extends GetxController{
  var isLoading = false.obs;
  final TextEditingController titleTextEditingController = TextEditingController();
  final TextEditingController bodyTextEditingController = TextEditingController();

  apiPostUpdate(BuildContext context) async {
    Post post = Post(
        id: Random().nextInt(999),
        title: titleTextEditingController.text,
        body: bodyTextEditingController.text,
        userId: Random().nextInt(999));

    var response =
    await Network.PUT(Network.API_UPDATE , Network.paramsUpdate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(context, HomePage.id, (route) => false);
    }
    isLoading(false);
  }
}