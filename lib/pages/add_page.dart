
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:patterns_getx/controllers/add_controllers.dart';


class AddPage extends StatefulWidget {
  static const String id = 'add_page';
  const AddPage({Key? key}) : super(key: key);
  @override
  AddPageState createState() => AddPageState();
}


class AddPageState extends State<AddPage> {

  final controler=Get.put(AddController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create'),
      ),
      body:Obx(()=> Stack(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                // Title
                Container(
                  height: 50,
                  child: Center(
                    child: TextField(
                      controller: controler.titleTextEditingController,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      decoration: const InputDecoration(
                        labelText: 'Title',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),

                const SizedBox(
                  height: 10,
                ),

                // Body
                Container(
                  height: 200,
                  padding: const EdgeInsets.all(5),
                  child: TextField(
                    controller: controler.bodyTextEditingController,
                    style: const TextStyle(fontSize: 18),
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
              ?const Center(
            child: CircularProgressIndicator(),
          )
              : const SizedBox.shrink(),
        ],
      ),),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onPressed:() {
          controler.apiPostCreate(context);
        },
        child:Icon(Icons.done),
      ),
    );
  }
}