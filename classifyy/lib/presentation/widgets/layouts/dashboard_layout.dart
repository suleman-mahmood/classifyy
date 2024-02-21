import 'package:classifyy/cubits/children_cubit.dart';
import 'package:classifyy/cubits/class_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/models/user/class.dart';
import 'package:classifyy/models/user/student.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/layouts/root_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardLayout extends StatelessWidget {
  final List<Widget> children;

  const DashboardLayout({super.key, this.children = const []});

  @override
  Widget build(BuildContext context) {
    return RootLayout(
      child: Scaffold(
        body: SafeArea(
          child: SizedBox(
            width: ScreenSizes.widthSlabFourRel(context),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: [
                  const DropdownAppBar(),
                  ...children,
                ],
              ),
            ),
          ),
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
  Student? _selectedChild;
  Class? _selectedClass;

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final classCubit = BlocProvider.of<ClassCubit>(context);
    final childrenCubit = BlocProvider.of<ChildrenCubit>(context);

    Widget buildOptions() {
      if (userCubit.state.user?.userType == UserType.parent) {
        final children = childrenCubit.state.children
            .where((st) =>
                st.studentName != userCubit.state.selectedChild!.studentName)
            .map((st) => ListTile(
                  title: Text(st.studentName),
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
          .where(
              (cl) => cl.className != userCubit.state.selectedClass!.className)
          .map(
            (cl) => ListTile(
              title: Text(cl.className),
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
              'Current ${userCubit.state.user?.userTypeToSelectTitle()}',
            ),
            subtitle: Text(
              userCubit.state.user?.userType == UserType.parent
                  ? userCubit.state.selectedChild!.studentName
                  : userCubit.state.selectedClass!.className,
            ),
            trailing: showAdditionalClasses
                ? const Icon(Icons.arrow_upward_outlined)
                : const Icon(Icons.arrow_downward_outlined),
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
