import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:keep_notes_using_getx/notes/cotroller/notes_controller.dart';
import 'package:permission_handler/permission_handler.dart';

class DashScreen extends StatefulWidget {
  const DashScreen({Key? key}) : super(key: key);

  @override
  State<DashScreen> createState() => _DashScreenState();
}

class _DashScreenState extends State<DashScreen> {
  NotesController controller = Get.put(NotesController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NotesController>(
      init: NotesController(),
      builder: (controller) => SafeArea(
          child: Scaffold(
              floatingActionButton: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed('location');
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Icon(
                          Icons.location_on,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                     Get.toNamed('add',arguments: {"mood":"add"});
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () async {
                      Map<Permission, PermissionStatus> statuses = await [
                      Permission.location,
                      Permission.storage,
                        Permission.camera
                      ].request();
                    },
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: Icon(
                          Icons.folder_shared,
                          size: 20,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              backgroundColor: Colors.black,
              appBar: AppBar(
                elevation: 0,
                backgroundColor: Colors.black,
                title: Container(
                  height: 55,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white38),
                  child: Row(
                    children: [
                      SizedBox(width: 10),
                      Icon(
                        Icons.format_list_bulleted_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Text(
                        "Search your notes",
                        style: TextStyle(
                            letterSpacing: 1,
                            fontSize: 20,
                            color: Colors.white),
                      ),
                      Spacer(),
                      Icon(
                        Icons.filter_list_outlined,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 25,
                      ),
                      SizedBox(width: 10),
                    ],
                  ),
                ),
              ),
              body: Padding(
                padding: EdgeInsets.all(10.0),
                child: Obx(
                  () => MasonryGridView.builder(
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) => show(index),
                    itemCount: controller.mainList.length,
                  ),
                ),
              ))),
    );
  }
  Widget show(int index) {
    return GestureDetector(
      onDoubleTap: () {
        Get.toNamed("add",arguments: {"mood":"edit","index":index});
      },
      onLongPress: () {
        controller.mainList.removeAt(index);
      },
      child: Container(
        height: 190,
        width: 300,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white54),
            borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      "${controller.mainList[index].title}",
                      style: TextStyle(
                          letterSpacing: 1.5,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 18),
                    ),
                    Spacer(),
                    Container(
                      decoration: BoxDecoration(
                          color: controller.mainList[index].priority == 'Low'
                              ? Colors.green
                              : controller.mainList[index].priority == 'Medium'
                                  ? Colors.orange
                                  : Colors.red,
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          "${controller.mainList[index].priority}",
                          style: TextStyle(
                              letterSpacing: 1,
                              color: Colors.white,
                              fontSize: 15),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Container(
                  height: 100,
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "${controller.mainList[index].notes}",
                          style:
                              TextStyle(letterSpacing: 1, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      "${controller.mainList[index].date}",
                      style: TextStyle(
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontSize: 15),
                    ),
                    Spacer(),
                    Text(
                      "${controller.mainList[index].time}",
                      style: TextStyle(
                          letterSpacing: 1, color: Colors.white, fontSize: 15),
                    )
                  ],
                ),
                SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
