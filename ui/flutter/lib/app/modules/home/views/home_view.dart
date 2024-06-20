import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../views/responsive_builder.dart';
import '../controllers/home_controller.dart';


class HomeView extends ConsumerWidget {
  final Widget child;
  const HomeView({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    // final homeState = ref.watch(currentIndexProvider);
    return Scaffold(
      // extendBody: true,
      body: SafeArea(
          child: Row(
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            !ResponsiveBuilder.isNarrow(context)
                ? Drawer(
                    width: 170,
                    child: ListView(
                      // padding: EdgeInsets.zero,
                      children: <Widget>[
                        //TODO profile
                        const DrawerHeader(
                          child: SizedBox.shrink(),
                          // decoration: BoxDecoration(
                          //   color: Colors.blue,
                          // ),
                        ),
                        ListTile(
                          leading: const Icon(Icons.downloading_outlined),
                          title: Text('task'.tr),
                          selected: 0 == ref.watch(currentIndexProvider),
                          onTap: () {
                            ref.read(currentIndexProvider.notifier).state = 0;
                            context.go('/');
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.extension),
                          title: Text('extensions'.tr),
                          selected: 1 == ref.watch(currentIndexProvider),
                          onTap: () {
                             ref.read(currentIndexProvider.notifier).state = 1;
                            context.go('/extension');
                          },
                        ),
                        ListTile(
                          leading: const Icon(Icons.settings),
                          title: Text('setting'.tr),
                          selected: 2 == ref.watch(currentIndexProvider),
                          onTap: () {
                             ref.read(currentIndexProvider.notifier).state = 2;
                            context.go('/setting');
                          },
                        ),
                      ],
                    ),
                  )
                : const SizedBox.shrink(),
            Expanded(
              child: child,
            ),
          ])),
      bottomNavigationBar: ResponsiveBuilder.isNarrow(context)
          ? BottomNavigationBar(
              backgroundColor: Colors.transparent,
              currentIndex: ref.watch(currentIndexProvider),
              onTap: (index) {
                switch (index) {
                  case 0:
                    ref.read(currentIndexProvider.notifier).state = 0;
                    context.go('/');

                  case 1:
                    ref.read(currentIndexProvider.notifier).state = 1;
                    context.go('/extension');
                  case 2:
                    ref.read(currentIndexProvider.notifier).state = 2;
                    context.go('/setting');
                }
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: const Icon(Icons.downloading_outlined),
                  label: 'task'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.extension),
                  label: 'extensions'.tr,
                ),
                BottomNavigationBarItem(
                  icon: const Icon(Icons.settings),
                  label: 'setting'.tr,
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
