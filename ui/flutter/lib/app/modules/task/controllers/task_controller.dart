import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../api/api.dart';
import '../../../../api/model/task.dart';

// import 'package:get/get.dart';
// class TaskController extends GetxController {
//   final tasks = <Task>[].obs;

//   late final Timer _timer;
//   var selectedTasks = <String>[].obs;

//   //sort tasks
//   final Rx<String> sortColumn = ''.obs;
//   final Rx<bool> sortAscending = true.obs;
  // List<Task> get sortedTasks {
  //   var tasksCopy = tasks.toList();
  //   tasksCopy.sort((a, b) {
  //     if (sortColumn.value == 'Task Name') {
  //       return sortAscending.value
  //           ? a.meta.res!.name.compareTo(b.meta.res!.name)
  //           : b.meta.res!.name.compareTo(a.meta.res!.name);
  //       //default sort by createdAt
  //     } else if (sortColumn.value == 'createdAt') {
  //       return sortAscending.value
  //           ? a.createdAt.compareTo(b.createdAt)
  //           : b.createdAt.compareTo(a.createdAt);
  //     }
  //     // Add more conditions here for other columns
  //     return 0;
  //   });
  //   return tasksCopy;
  // }

//   //TODO select tasks by status
//   getTasksState() async {
//     final tasks = await getTasks([
//       Status.ready,
//       Status.running,
//       Status.pause,
//       Status.wait,
//       Status.error,
//       Status.done
//     ]);
//     this.tasks.value = tasks;
//   }

//   @override
//   void onReady() async {
//     await getTasksState();
//     _timer = Timer.periodic(const Duration(milliseconds: 2000), (timer) async {
//       await getTasksState();
//     });
//     super.onReady();
//   }

//   @override
//   void onClose() {
//     if (_timer.isActive) {
//       _timer.cancel();
//     }
//     super.onClose();
//   }
// }



final taskProvider = StreamProvider<List<Task>>((ref) async* {
  // get tasks periodically
 while (true) {
    await Future.delayed(const Duration(seconds: 2));
    List<Task> tasks = await getTasks([
      Status.ready,
      Status.running,
      Status.pause,
      Status.wait,
      Status.error,
      Status.done
    ]);
     yield tasks;
  }
});


// final taskProvider = StreamProvider.autoDispose<List<String>>((ref) {
//   return Stream.periodic(const Duration(seconds: 2)).asyncMap((_) async {
//     // Replace this with your actual API call
//     List<Task> tasks = await getTasks([
//       Status.ready,
//       Status.running,
//       Status.pause,
//       Status.wait,
//       Status.error,
//       Status.done
//     ]);
//     return tasks.map((task) => task.meta.res!.name).toList();
//   });
// });

final sortColumnStateProvider = StateProvider((ref) => 'Task Name');
final sortAscendingStateProvider = StateProvider((ref) => true);



class SelectedTasksNotifier extends Notifier<List<String>> {
  @override
  List<String> build() {
    return [];
  }

  void addId(String id) {
    state = [...state, id];
  }

  bool selected(String id){
    return state.contains(id);
  }

  void add(id){
    state = [...state, id];
  }


  void remove(target){
    state = state.where((id)=>id!=target).toList();
  }

}


final selectedTasksProvider = NotifierProvider<SelectedTasksNotifier, List<String>>(() {
  return SelectedTasksNotifier();
});
// class TaskNotifier extends Notifier<List<Task>> {
//   @override
//   List<Task> build() {
//     return [];
//   }

//   List<String> sortedTasks(sortColumn,sortAscending){
//     final tasks =await ref.watch(taskProvider);
//    return tasks.sort((a, b) {
//       if (sortColumn.value == 'Task Name') {
//         return sortAscending.value
//             ? a.meta.res!.name.compareTo(b.meta.res!.name)
//             : b.meta.res!.name.compareTo(a.meta.res!.name);
//         //default sort by createdAt
//       } else if (sortColumn.value == 'createdAt') {
//         return sortAscending.value
//             ? a.createdAt.compareTo(b.createdAt)
//             : b.createdAt.compareTo(a.createdAt);
//       }
//       // Add more conditions here for other columns
 
//     });
//   }
// }