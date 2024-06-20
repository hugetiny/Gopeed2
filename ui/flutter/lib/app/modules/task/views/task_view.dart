import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:gopeed/app/modules/task/controllers/task_controller.dart';
import 'package:gopeed/app/router/router.dart';
import 'package:gopeed/constants.dart';
import 'package:open_filex/open_filex.dart';
import 'package:path/path.dart' as path;
import 'package:get/get.dart';
import '../../../../api/api.dart';
import '../../../../api/model/meta.dart';
import '../../../../api/model/task.dart';
import '../../../../util/file_explorer.dart';
import '../../../../util/file_icon.dart';
import '../../../../util/icons.dart';
import '../../../../util/message.dart';
import '../../../../util/util.dart';
import '../../../modules/app/controllers/app_controller.dart';

class TaskView extends ConsumerWidget {
  const TaskView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //TODO Grid view
    String filter = '';
    String sortColumn = ref.watch(sortColumnStateProvider);
    bool sortAscending = ref.watch(sortAscendingStateProvider);
    // final selectedTasks = ref.watch(selectedTasksProvider);
    final selectedTasksNotifier = ref.read(selectedTasksProvider.notifier);
    bool isDone(task) {
      return task.status == Status.done;
    }

    bool isRunning(task) {
      return task.status == Status.running;
    }

    bool isFolderTask(task) {
      return task.meta.res?.name.isNotEmpty ?? false;
    }

    List<Task> sortTasks(sortColumn, sortAscending, List<Task> tasks) {
      List<Task> sortedTasks = List.from(tasks);
      sortedTasks.sort((a, b) {
        if (sortColumn == 'Task Name') {
          return sortAscending
              ? a.meta.res!.name.compareTo(b.meta.res!.name)
              : b.meta.res!.name.compareTo(a.meta.res!.name);
        } else if (sortColumn.value == 'createdAt') {
          return sortAscending.value
              ? a.createdAt.compareTo(b.createdAt)
              : b.createdAt.compareTo(a.createdAt);
        }
        return 0; // Add a default return value
      });
      return sortedTasks;
    }

    String fileName(Meta meta) {
      if (meta.opts.name.isNotEmpty) {
        return meta.opts.name;
      }
      if (meta.res == null) {
        final u = Uri.parse(meta.req.url);
        if (u.scheme.startsWith("http")) {
          return u.path.isNotEmpty
              ? u.path.substring(u.path.lastIndexOf("/") + 1)
              : u.host;
        } else {
          final params = u.queryParameters;
          if (params.containsKey("dn")) {
            return params["dn"]!;
          } else {
            return params["xt"]!.split(":").last;
          }
        }
      }
      if (meta.res!.name.isNotEmpty) {
        return meta.res!.name;
      }
      return meta.res!.files[0].name;
    }

    String buildExplorerUrl(Task task) {
      if (!isFolderTask(task)) {
        return path.join(Util.safeDir(task.meta.opts.path),
            Util.safeDir(task.meta.res!.files[0].path), fileName(task.meta));
      } else {
        return path.join(Util.safeDir(task.meta.opts.path),
            Util.safeDir(fileName(task.meta)));
      }
    }

    toTaskFilesView(task) {
      if (Util.isDesktop()) {
        FileExplorer.openAndSelectFile(buildExplorerUrl(task));
      } else {
        router.go('/taskfiles?id=${task.id}');
        // Get.rootDelegate
        //     .toNamed(Routes.TASK_FILES, parameters: {'id': task.id});
      }
    }

    double getProgress(task) {
      final totalSize = task.meta.res?.size ?? 0;
      return totalSize <= 0 ? 0 : task.progress.downloaded / totalSize;
    }

    getProgressIndicatorColor(task) {
      return task.status == Status.done
          ? Theme.of(context).colorScheme.tertiary
          : task.status == Status.running
              ? Theme.of(context).colorScheme.primary
              : task.status == Status.error
                  ? Theme.of(context).colorScheme.error
                  : Theme.of(context).colorScheme.secondary;
    }

    String getProgressText(task) {
      if (isDone(task)) {
        return Util.fmtByte(task.meta.res!.size);
      }
      if (task.meta.res == null) {
        return "";
      }
      final total = task.meta.res!.size;
      return Util.fmtByte(task.progress.downloaded) +
          (total > 0 ? " / ${Util.fmtByte(total)}" : "");
    }

    Future<void> showDeleteDialog(String id, BuildContext context) {
      final appController = Get.find<AppController>();

      return showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
                title: Text('deleteTask'.tr),
                content: CheckboxListTile(
                    value: appController
                        .downloaderConfig.value.extra.lastDeleteTaskKeep,
                    title: Text('deleteTaskTip'.tr),
                    onChanged: (v) {
                      appController.downloaderConfig.update((val) {
                        val!.extra.lastDeleteTaskKeep = v!;
                      });
                    }),
                actions: [
                  TextButton(
                    child: Text('cancel'.tr),
                    onPressed: () => Get.back(),
                  ),
                  TextButton(
                    child: Text(
                      'confirm'.tr,
                      style: const TextStyle(color: Colors.redAccent),
                    ),
                    onPressed: () async {
                      try {
                        final force = !appController
                            .downloaderConfig.value.extra.lastDeleteTaskKeep;
                        await appController.saveConfig();
                        await deleteTask(id, force);
                        Get.back();
                      } catch (e) {
                        showErrorMessage(e);
                      }
                    },
                  ),
                ],
              ));
    }

    Widget singleActions(task, context) {
      List<Widget> list = [];

      if (isDone(task)) {
        list.add(IconButton(
          icon: const Icon(Icons.folder_open),
          onPressed: () => toTaskFilesView(task),
        ));
      } else if (isRunning(task)) {
        list.add(IconButton(
          icon: const Icon(Icons.pause),
          onPressed: () async =>
              await pauseTask(task.id).catchError(showErrorMessage),
        ));
      } else {
        list.add(IconButton(
          icon: const Icon(Icons.play_arrow),
          onPressed: () async =>
              await continueTask(task.id).catchError(showErrorMessage),
        ));
      }

      list.add(IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () => showDeleteDialog(task.id, context),
      ));

      return ListView(
        scrollDirection: Axis.horizontal,
        children: list,
      );
    }

    List<Widget> header = [
      Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: TextField(
          onChanged: (value) {
            filter = value;
          },
          decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20.0),
              ),
              suffixIcon: const Icon(Icons.search)),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              icon: const Icon(Icons.add),
              tooltip: 'add',
              onPressed: () {
                context.push('/create');
              },
            ),
            const VerticalDivider(),
            IconButton(
              icon: const Icon(Icons.stop),
              tooltip: 'stop all',
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.fast_forward),
              tooltip: 'resume all',
              onPressed: () {
                // Handle the action
              },
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              tooltip: 'delete all',
              onPressed: () {
                // Handle the action
              },
            ),
          ],
        ),
      ),
    ];
    return Scaffold(
      body: Column(children: [
        Wrap(
          // direction: Axis.horizontal,
          children: header,
        ),
        Expanded(
          child: Stack(children: [
              //progress ui hack
              DataTable(
                horizontalMargin: 0,
                columns: const [
                  DataColumn(
                    label: Text(''),
                  ),
                ],
                rows: ref.watch(taskProvider).when(
                    data: (tasks) {
                      final sortedTasks = sortTasks(sortColumn, sortAscending, tasks);
                      return List<DataRow>.generate(
                        sortedTasks.length,
                        (int index) {
                          final task = sortedTasks[index];
                          return DataRow(
                            cells: <DataCell>[
                              DataCell(Opacity(
                                  opacity: 0.5,
                                  child: LinearProgressIndicator(
                                    minHeight: double.infinity,
                                    value: getProgress(task),
                                    color: getProgressIndicatorColor(task),
                                  ))),
                            ],
                          );
                        },
                      );
                    },
                    loading: () => const <DataRow>[],
                    error: (e, s) => const <DataRow>[]),

              ),
              //progress ui hack end

              //real data
              DataTable2(
                columnSpacing: 10,
                showHeadingCheckBox: false,
                showCheckboxColumn: false,
                // sortColumnIndex:0,
                sortAscending: sortAscending,
                // sortArrowIcon:Icons.arrow_upward_sharp,
                // fixedTopRows: 1,
                minWidth: 200,
                // headingRowColor: WidgetStateProperty.all(Theme.of(context).colorScheme.surfaceContainer),
                empty: const SizedBox.shrink(),
                columns: <DataColumn>[
                  DataColumn2(
                    label: const Text(
                      'Task Name',
                    ),
                    size: ColumnSize.L,
                    onSort: (columnIndex, ascending) {
                      if (sortColumn == 'Task Name') {
                        sortAscending = !sortAscending;
                      } else {
                        sortColumn = 'Task Name';
                        sortAscending = true;
                      }
                    },
                  ),
                  const DataColumn2(
                    label: Text(
                      'Progress',
                    ),
                    size: ColumnSize.S,
                  ),
                  const DataColumn2(
                    label: Text(
                      'Speed',
                    ),
                    size: ColumnSize.S,
                  ),
                  const DataColumn2(
                    label: Text(
                      'Actions',
                    ),
                    size: ColumnSize.S,
                  ),
                ],
                rows: ref.watch(taskProvider).when(
                  data: (tasks) {
                    final sortedTasks = sortTasks(sortColumn, sortAscending, tasks);
                    return List<DataRow>.generate(
                      sortedTasks.length,
                      (int index) {
                        final task = sortedTasks[index];

                        return DataRow(
                          selected: selectedTasksNotifier.selected(task.id),
                          onSelectChanged: (bool? selected) {
                            if (selected != null && selected) {
                              if (!selectedTasksNotifier.selected(task.id)) {
                                selectedTasksNotifier.add(task.id);
                              }
                            } else {
                              selectedTasksNotifier.remove(task.id);
                            }
                          },
                          cells: <DataCell>[
                            DataCell(Row(
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  isFolderTask(task)
                                      ? const Icon(FaIcons.folder)
                                      : Icon(FaIcons.allIcons[
                                          findIcon(fileName(task.meta))]),
                                  const SizedBox(width: 8.0),
                                  Expanded(
                                    child: Text(
                                      fileName(task.meta),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  )
                                ])),
                            DataCell(FittedBox(
                              child: Text(
                                getProgressText(task),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                  letterSpacing: 0,
                                  wordSpacing: 0,
                                ),
                              ),
                            )),
                            DataCell(Text(
                              isRunning(task)
                                  ? '${Util.fmtByte(task.progress.speed)} / s'
                                  : '',
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                letterSpacing: 0,
                                wordSpacing: 0,
                              ),
                            )),
                            DataCell(singleActions(task, context))
                          ],
                        );
                      },
                    );
                  },
                  loading: () => const <DataRow>[],
                  error: (e, s) => const <DataRow>[],
                ),
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
               
        )
              //real data end
      ]),
    )]));
  }
}


