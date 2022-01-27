import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:patterns_getx/controllers/hom_controllers.dart';
import 'package:patterns_getx/views/item_of_post.dart';

import 'add_page.dart';

class HomePage extends StatefulWidget {
  static const String id="hom_page";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

    final _controller=Get.put(HomController());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("GetX"),
          centerTitle:true,
        ),
        body:Obx(()=> Stack(
          children: [
            ListView.builder(
              itemCount: _controller.items.length,
              itemBuilder: (ctx, index) {
                return itemOfPost(_controller,_controller.items[index],context);
              },
            ),
            _controller.isLoading()
                ? const Center(
                child: CircularProgressIndicator(),
            )
                : const SizedBox.shrink(),
          ],
        )),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            Navigator.pushNamed(context,AddPage.id);
          },
          child: const Icon(Icons.add),
        ));
  }
}

