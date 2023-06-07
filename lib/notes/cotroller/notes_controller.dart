import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:keep_notes_using_getx/notes/modal/notes_modal.dart';

class NotesController extends GetxController {
  RxList<NotesModal> mainList = <NotesModal>[
    NotesModal(
        title: "Lecture",
        date: "06/06/2023",
        notes: "Submit Project on Classroom",
        priority: "Low",
        time: "18:00"),
    NotesModal(
        title: "Lecture",
        date: "06/06/2023",
        notes:
            "Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom",
        priority: "Medium",
        time: "18:00"),
    NotesModal(
        title: "Lecture",
        date: "06/06/2023",
        notes:
            "Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom",
        priority: "Urgent",
        time: "18:00")
  ].obs;

  RxList dropdownList = [
    'Low',
    'Medium',
    'Urgent',
  ].obs;

  RxInt managedailog=0.obs;
  RxString selectDrop = "Low".obs;

  RxString selectdate = "".obs;
  RxString selectTime = "".obs;

  String chnageDate(DateTime dt) {
    var format = DateFormat('dd-MM-yyyy');
    return format.format(dt) as String;
  }

  String chnagetime(DateTime tt) {
    var format = DateFormat('HH:mm');

    return format.format(tt);
  }

  RxDouble lat =0.0.obs;
  RxDouble log =0.0.obs;

  Rx<Placemark> currentLoc =Placemark().obs;
}
