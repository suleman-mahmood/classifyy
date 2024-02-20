import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/children_cubit.dart';
import 'package:classifyy/cubits/class_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/models/user/class.dart';
import 'package:classifyy/models/user/student.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/button_primary.dart';
import 'package:classifyy/presentation/widgets/layouts/root_layout.dart';
import 'package:classifyy/presentation/widgets/inputs/text_field_primary.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final classCubit = BlocProvider.of<ClassCubit>(context);
    final childrenCubit = BlocProvider.of<ChildrenCubit>(context);

    Widget buildBottomSheet(BuildContext context) {
      return SizedBox(
        width: ScreenSizes.widthSlabFourRel(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TitleLarge(
                    title:
                        'Select ${userCubit.state.user?.userTypeToSelectTitle()}',
                    shouldAnimate: false),
                const ClassOptions(),
                const ChildrenOptions(),
                const ActionButton(),
                const SizedBox(height: ScreenSizes.heightSlabThreeAbs),
              ],
            ),
          ),
        ),
      );
    }

    Future<void> handleLogin() async {
      await userCubit.loginUser('email', 'password');
    }

    return RootLayout(
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const TitleLarge(title: 'Login'),
                    const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
                    const TextFieldPrimary(labelText: "Email"),
                    const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
                    const TextFieldPrimary(labelText: "Password"),
                    const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
                    ButtonPrimary(
                      buttonText: 'Proceed',
                      onPressed: handleLogin,
                    ),
                    BlocListener<UserCubit, UserState>(
                      listener: (context, state) {
                        switch (state.runtimeType) {
                          case UserSuccess:
                            if (state.user!.userType == UserType.Teacher) {
                              classCubit.fetchClasses();
                            } else if (state.user!.userType ==
                                UserType.Parent) {
                              childrenCubit.fetchChildren();
                            }
                            showModalBottomSheet(
                              context: context,
                              builder: buildBottomSheet,
                            );
                        }
                      },
                      child: const SizedBox.shrink(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ActionButton extends StatelessWidget {
  const ActionButton({super.key});

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);

    return BlocBuilder<ClassCubit, ClassState>(
      builder: (context, classState) {
        return BlocBuilder<ChildrenCubit, ChildrenState>(
          builder: (context, childrenState) {
            final enabled =
                classState is ClassSuccess || childrenState is ChildrenSuccess;

            return ButtonPrimary(
              disabled: !enabled,
              buttonText: 'Choose ${userCubit.state.user?.userTypeToSelectTitle()}',
              onPressed: () => enabled
                  ? context.router.push(
                      const DashboardRoute(),
                    )
                  : () {},
              shouldAnimate: false,
            );
          },
        );
      },
    );
  }
}

class ClassOptions extends StatefulWidget {
  const ClassOptions({super.key});

  @override
  State<ClassOptions> createState() => _ClassOptionsState();
}

class _ClassOptionsState extends State<ClassOptions> {
  Class? _selectedClass;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ClassCubit, ClassState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ClassSuccess:
            if (state.classes.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text("Sorry couldn't find any classes for you"),
                  ],
                ),
              );
            }

            final children = state.classes
                .map(
                  (cl) => ListTile(
                    title: Text(cl.className),
                    leading: Radio<Class>(
                      value: cl,
                      groupValue: _selectedClass,
                      onChanged: (value) {
                        setState(() {
                          _selectedClass = value;
                        });
                      },
                    ),
                  ),
                )
                .toList();
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: ScreenSizes.heightQuarterRel(context),
              ),
              child: ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: children,
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}

class ChildrenOptions extends StatefulWidget {
  const ChildrenOptions({super.key});

  @override
  State<ChildrenOptions> createState() => _ChildrenOptionsState();
}

class _ChildrenOptionsState extends State<ChildrenOptions> {
  Student? _selectedChild;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChildrenCubit, ChildrenState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ChildrenSuccess:
            if (state.children.isEmpty) {
              return const Padding(
                padding: EdgeInsets.all(32),
                child: Column(
                  children: [
                    Icon(Icons.question_mark_outlined),
                    Text("Sorry couldn't fetch your children"),
                  ],
                ),
              );
            }

            final children = state.children
                .map(
                  (st) => ListTile(
                    title: Text(st.studentName),
                    leading: Radio<Student>(
                      value: st,
                      groupValue: _selectedChild,
                      onChanged: (value) {
                        setState(() {
                          _selectedChild = value;
                        });
                      },
                    ),
                  ),
                )
                .toList();
            return ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: ScreenSizes.heightQuarterRel(context),
              ),
              child: ListView(
                padding: const EdgeInsets.all(0),
                shrinkWrap: true,
                children: children,
              ),
            );
          default:
            return const SizedBox.shrink();
        }
      },
    );
  }
}
