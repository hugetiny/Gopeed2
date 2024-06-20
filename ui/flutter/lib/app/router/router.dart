import 'package:go_router/go_router.dart';
import '../modules/home/views/home_view.dart';
import '../modules/create/views/create_view.dart';
import '../modules/extension/views/extension_view.dart';
import '../modules/setting/views/setting_view.dart';
import '../modules/task/views/task_view.dart';
// import '../modules/task/views/task_files_view.dart';


final router = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state,child) => HomeView(child:child), 
      
      routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => TaskView(),
      ),
      GoRoute(
        path: '/create',
        builder: (context, state) =>
            CreateView(filePath: state.uri.queryParameters['filePath'] ?? ''),
      ),

      // GoRoute(
      //   path: 'taskfiles',
      //   builder: (context, state) =>
      //       TaskFilesView(id: state.uri.queryParameters['id']),
      // ),
      GoRoute(
        path: '/extension',
        builder: (context, state) => ExtensionView(),
      ),
      GoRoute(
        path: '/setting',
        builder: (context, state) => SettingView(),
      )
    ]),
  ],
);
