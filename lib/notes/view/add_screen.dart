import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:keep_notes_using_getx/notes/cotroller/notes_controller.dart';

import '../modal/notes_modal.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({super.key});

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  NotesController controller = Get.put(NotesController());
  TextEditingController? txtTitle;
  TextEditingController? txtNotes;
  Map m1 = Get.arguments;

  @override
  void initState() {
    super.initState();
    controller.selectdate.value = controller.chnageDate(DateTime.now());
    controller.selectTime.value = controller.chnagetime(DateTime.now());
    txtTitle = TextEditingController(
        text:
            m1['mood'] == 'edit' ? controller.mainList[m1['index']].title : "");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: m1['mood'] == 'edit'
            ? Text(
                "Edit Notes",
                style: TextStyle(
                    letterSpacing: 1, color: Colors.white, fontSize: 20),
              )
            : Text(
                "Add Notes",
                style: TextStyle(
                    letterSpacing: 1, color: Colors.white, fontSize: 20),
              ),
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 20,
              color: Colors.white,
            )),
        actions: [
          IconButton(
              onPressed: () {
                NotesModal n1 = NotesModal();
                n1 = NotesModal(
                    title: txtTitle!.text,
                    date: controller.selectdate.value,
                    notes: txtNotes!.text,
                    priority: controller.selectDrop.value,
                    time: controller.selectTime.value);
                controller.mainList.add(n1);
                Get.back();
              },
              icon: Icon(
                Icons.done,
                size: 20,
                color: Colors.white,
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
                maxLines: 2,
                style: TextStyle(color: Colors.white),
                controller: txtTitle,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  label: Text(
                    "Title",
                    style: TextStyle(letterSpacing: 1, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                )),
            SizedBox(height: 10),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.white)),
              child: Obx(
                () => DropdownButton(
                    value: controller.selectDrop.value,
                    isExpanded: true,
                    style: TextStyle(color: Colors.white),
                    items: controller.dropdownList.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                    onChanged: (change) {
                      controller.selectDrop.value = change as String;
                    },
                    dropdownColor: Colors.black,
                    focusColor: Colors.black),
              ),
            ),
            SizedBox(height: 10),
            Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          DateTime? select = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2001),
                            lastDate: DateTime(2050),
                          );
                          controller.selectdate.value =
                              controller.chnageDate(select!);
                        },
                        icon: Icon(
                          Icons.calendar_month_outlined,
                          size: 20,
                          color: Colors.white,
                        )),
                    SizedBox(width: 10),
                    Obx(() => Text(
                          "${controller.selectdate}",
                          style:
                              TextStyle(letterSpacing: 1, color: Colors.white),
                        ))
                  ],
                )),
            SizedBox(height: 10),
            Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white)),
                child: Row(
                  children: [
                    IconButton(
                        onPressed: () async {
                          TimeOfDay? select = await showTimePicker(
                              context: context, initialTime: TimeOfDay.now());
                          controller.chnagetime(select! as DateTime);
                        },
                        icon: Icon(
                          Icons.watch_later_outlined,
                          size: 20,
                          color: Colors.white,
                        )),
                    SizedBox(width: 10),
                    Obx(
                      () => Text(
                        "${controller.selectTime}",
                        style: TextStyle(letterSpacing: 1, color: Colors.white),
                      ),
                    )
                  ],
                )),
            SizedBox(height: 10),
            TextField(
                maxLines: 5,
                controller: txtNotes,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.black,
                  label: Text(
                    "Notes",
                    style: TextStyle(letterSpacing: 1, color: Colors.white),
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.circular(20)),
                )),
          ],
        ),
      ),
    ));
  }
}
