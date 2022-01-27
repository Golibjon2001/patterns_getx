import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:patterns_getx/controllers/update_controllers.dart';
import 'package:patterns_getx/model/post_model.dart';
import 'package:patterns_getx/serves/http_server.dart';

import 'home_page.dart';

class UpdatePage extends StatefulWidget {
  static final String id = 'update_page';

  String? title, body;
  UpdatePage({this.title, this.body, Key? key}) : super(key: key);

  @override
  _UpdatePageState createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {

 final controler=Get.put(UpdateController());
  @override
  void initState() {
    super.initState();
    controler.titleTextEditingController.text = widget.title!;
    controler.bodyTextEditingController.text = widget.body!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
      ),
      body:Obx(()=>SingleChildScrollView(
        child:Stack(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  // Title
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(5),
                    child: Center(
                      child: TextField(maxLines: 2,
                        controller: controler.titleTextEditingController,
                        style: const TextStyle(fontWeight: FontWeight.bold,
                        ),
                        decoration: const InputDecoration(
                          labelText: 'Title',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ),

                  // Body
                  Container(
                    height: 500,
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      controller: controler.bodyTextEditingController,
                      style: const TextStyle(fontSize: 20),
                      maxLines: 10,
                      decoration: const InputDecoration(
                        labelText: 'Body',
                        floatingLabelBehavior: FloatingLabelBehavior.always,
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            controler.isLoading()
                ? const Center(
              child: CircularProgressIndicator(),
            ) : const SizedBox.shrink(),
          ],
        ),
      ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed: () {
          controler.apiPostUpdate(context);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}