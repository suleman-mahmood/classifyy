import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/children_cubit.dart';
import 'package:classifyy/cubits/class_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/locator.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/button_primary.dart';
import 'package:classifyy/presentation/widgets/layouts/root_layout.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardLayout extends StatefulWidget {
  final List<Widget> children;

  const DashboardLayout({super.key, this.children = const []});

  @override
  State<DashboardLayout> createState() => _DashboardLayoutState();
}

class _DashboardLayoutState extends State<DashboardLayout> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final classCubit = BlocProvider.of<ClassCubit>(context);
    final childrenCubit = BlocProvider.of<ChildrenCubit>(context);

    Widget buildBottomSheet(BuildContext context) {
      return SizedBox(
        width: ScreenSizes.widthSlabFourRel(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TitleLarge(
                  title:
                      'Are you sure you want to delete your account and its associated data?',
                  shouldAnimate: false,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: ScreenSizes.slabThree),
                ButtonPrimary(
                  buttonText: 'Yes!',
                  onPressed: userCubit.logoutUser,
                ),
                const SizedBox(height: ScreenSizes.slabThree),
              ],
            ),
          ),
        ),
      );
    }

    return RootLayout(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: ScreenSizes.widthSlabFourRel(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  if (currentPageIndex == 0) ...[
                    if (userCubit.state.user?.userRole == UserRole.parent ||
                        userCubit.state.user?.userRole == UserRole.teacher)
                      const DropdownAppBar(),
                    ...widget.children,
                  ],
                  if (currentPageIndex == 1) ...[
                    Card(
                      color: const Color(0xFFFEF7FF),
                      child: ListTile(
                        title: const Text('Logout'),
                        trailing: const Icon(Icons.logout_outlined),
                        onTap: userCubit.logoutUser,
                      ),
                    ),
                    Card(
                      color: const Color(0xFFFEF7FF),
                      child: ListTile(
                        title: const Text('Delete account'),
                        trailing: const Icon(Icons.delete_outlined),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: buildBottomSheet,
                          );
                        },
                      ),
                    ),
                  ]
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (int index) {
            setState(() {
              currentPageIndex = index;
            });
          },
          indicatorColor: Colors.purpleAccent,
          selectedIndex: currentPageIndex,
          destinations: const <Widget>[
            NavigationDestination(
              selectedIcon: Icon(Icons.home),
              icon: Icon(Icons.home_outlined),
              label: 'Dashboard',
            ),
            NavigationDestination(
              icon: Icon(Icons.person_outlined),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

class DropdownAppBar extends StatefulWidget {
  const DropdownAppBar({super.key});

  @override
  State<DropdownAppBar> createState() => _DropdownAppBarState();
}

class _DropdownAppBarState extends State<DropdownAppBar> {
  bool showAdditionalClasses = false;
  ParentChild? _selectedChild;
  TeacherClass? _selectedClass;

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final classCubit = BlocProvider.of<ClassCubit>(context);
    final childrenCubit = BlocProvider.of<ChildrenCubit>(context);

    Widget buildOptions() {
      if (userCubit.state.user?.userRole == UserRole.parent) {
        final children = childrenCubit.state.children
            .where((st) =>
                st.displayName != userCubit.state.selectedChild!.displayName)
            .map((st) => ListTile(
                  title: Text(st.displayName),
                  onTap: () {
                    setState(() {
                      userCubit.selectChild(st);
                      showAdditionalClasses = false;
                      _selectedChild = st;
                    });
                  },
                ))
            .toList();
        return ListView(
          padding: const EdgeInsets.all(0),
          shrinkWrap: true,
          children: children,
        );
      }

      final classes = classCubit.state.classes
          .where((cl) =>
              cl.displayName != userCubit.state.selectedClass!.displayName)
          .map(
            (cl) => ListTile(
              title: Text(cl.displayName),
              onTap: () {
                setState(() {
                  userCubit.selectClass(cl);
                  showAdditionalClasses = false;
                  _selectedClass = cl;
                });
              },
            ),
          )
          .toList();
      return ListView(
        padding: const EdgeInsets.all(0),
        shrinkWrap: true,
        children: classes,
      );
    }

    return Card(
      color: const Color(0xFFFEF7FF),
      child: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person_2_outlined),
            title: Text(
              'Current ${userCubit.state.user?.userRoleToSelectTitle()}',
            ),
            subtitle: Text(
              userCubit.state.user?.userRole == UserRole.parent
                  ? userCubit.state.selectedChild!.displayName
                  : userCubit.state.selectedClass!.displayName,
            ),
            trailing: classCubit.state.classes.length > 1 ||
                    childrenCubit.state.children.length > 1
                ? showAdditionalClasses
                    ? const Icon(Icons.arrow_upward_outlined)
                    : const Icon(Icons.arrow_downward_outlined)
                : null,
            onTap: () {
              setState(() {
                showAdditionalClasses = !showAdditionalClasses;
              });
            },
          ),
          Visibility(
            visible: showAdditionalClasses,
            child: buildOptions(),
          ),
        ],
      ),
    );
  }
}
