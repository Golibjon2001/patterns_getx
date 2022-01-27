
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/pages/home_page.dart';
import 'package:patterns_getx/serves/http_server.dart';

class AddController extends GetxController{
  var  isLoading = false.obs;
  final TextEditingController titleTextEditingController = TextEditingController();
  final TextEditingController bodyTextEditingController = TextEditingController();

  apiPostCreate(BuildContext context) async {
    isLoading(true);

    Post post = Post(
        title: titleTextEditingController.text,
        body: bodyTextEditingController.text,
        userId: Random().nextInt(99999), id:Random().nextInt(9999));

    var response =
    await Network.POST(Network.API_CREATE, Network.paramsCreate(post));

    if (response != null) {
      Navigator.pushNamedAndRemoveUntil(
          context, HomePage.id, (route) => false);
    }
    isLoading(true);
  }
}