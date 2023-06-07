import 'package:get/get.dart';
import 'package:keep_notes_using_getx/notes/modal/notes_modal.dart';

class NotesController extends GetxController {
  RxList<NotesModal> mainList = <NotesModal>[
    NotesModal(
        title: "Lecture",
        date: "06/06/2023",
        notes: "Submit Project on Classroom",
        priority: "Urgent",
        time: "18:00"),
    NotesModal(
        title: "Lecture",
        date: "06/06/2023",
        notes:
            "Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom",
        priority: "Urgent",
        time: "18:00"),
    NotesModal(
        title: "Lecture",
        date: "06/06/2023",
        notes:
            "Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom, Submit Project on Classroom",
        priority: "Urgent",
        time: "18:00")
  ].obs;
}
