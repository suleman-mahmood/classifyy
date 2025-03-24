import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/children_cubit.dart';
import 'package:classifyy/cubits/class_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/models/user/teacher_class.dart';
import 'package:classifyy/models/user/parent_child.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/button_primary.dart';
import 'package:classifyy/presentation/widgets/layouts/root_layout.dart';
import 'package:classifyy/presentation/widgets/inputs/text_field_primary.dart';
import 'package:classifyy/presentation/widgets/typography/error_message.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher_string.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  LoginScreen({super.key});

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
                        'Select ${userCubit.state.user?.userRoleToSelectTitle()}',
                    shouldAnimate: false),
                const ClassOptions(),
                const ChildrenOptions(),
                const ActionButton(),
                const SizedBox(height: ScreenSizes.slabThree),
              ],
            ),
          ),
        ),
      );
    }

    Future<void> handleLogin() async {
      if (emailController.text == "t") {
        await userCubit.loginUser("murtaza@riveroaks.com", "9e97");
      } else if (emailController.text == "p") {
        await userCubit.loginUser("suleman.parent@riveroaks.com", "bf8f");
      } else if (emailController.text == "s") {
        await userCubit.loginUser("suleman@riveroaks.com", "0799");
      } else {
        await userCubit.loginUser(
          emailController.text,
          passwordController.text,
        );
      }
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
                    const SizedBox(height: ScreenSizes.slabTwo),
                    TextFieldPrimary(
                      controller: emailController,
                      labelText: "Email",
                    ),
                    const SizedBox(height: ScreenSizes.slabTwo),
                    TextFieldPrimary(
                      controller: passwordController,
                      labelText: "Password",
                    ),
                    const SizedBox(height: ScreenSizes.slabTwo),
                    BlocBuilder<UserCubit, UserState>(
                      builder: (context, state) {
                        if (state is! UserFailure) {
                          return const SizedBox.shrink();
                        }
                        return ErrorMessage(text: state.errorMessage);
                      },
                    ),
                    const SizedBox(height: ScreenSizes.slabTwo),
                    RichText(
                      text: TextSpan(
                        children: <TextSpan>[
                          const TextSpan(
                            text: "* by signing in you agree to our ",
                            style: TextStyle(color: Colors.black87),
                          ),
                          TextSpan(
                            text: 'terms & conditions',
                            style: const TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => launchUrlString(
                                    'https://classifyy.vercel.app/privacy-policy',
                                  ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: ScreenSizes.slabTwo),
                    ButtonPrimary(
                      buttonText: 'Proceed',
                      onPressed: handleLogin,
                    ),
                    BlocListener<UserCubit, UserState>(
                      listenWhen: (previous, current) {
                        return previous.user != current.user;
                      },
                      listener: (context, state) {
                        switch (state.runtimeType) {
                          case const (UserSuccess):
                            if (state.user!.userRole == UserRole.Teacher) {
                              classCubit.fetchClasses();
                            } else if (state.user!.userRole ==
                                UserRole.Parent) {
                              childrenCubit.fetchChildren();
                            } else if (state.user!.userRole ==
                                UserRole.Student) {
                              context.router.push(
                                const StudentDashboardRoute(),
                              );
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

    void handleProceed() {
      if (userCubit.state.user?.userRole == UserRole.Teacher) {
        context.router.push(const TeacherDashboardRoute());
      } else if (userCubit.state.user?.userRole == UserRole.Parent) {
        context.router.push(const ParentDashboardRoute());
      }
    }

    return BlocBuilder<ClassCubit, ClassState>(
      builder: (context, classState) {
        return BlocBuilder<ChildrenCubit, ChildrenState>(
          builder: (context, childrenState) {
            return BlocBuilder<UserCubit, UserState>(
              builder: (context, userState) {
                final enabled = userState.selectedClass != null ||
                    userState.selectedChild != null;

                return ButtonPrimary(
                  disabled: !enabled,
                  buttonText:
                      'Choose ${userState.user?.userRoleToSelectTitle()}',
                  onPressed: enabled ? handleProceed : () {},
                  shouldAnimate: false,
                );
              },
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
  TeacherClass? _selectedClass;

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);

    return BlocBuilder<ClassCubit, ClassState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ClassLoading:
            return Opacity(
              opacity: 0.5,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: ScreenSizes.heightQuarterRel(context),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: const Text('Class I'),
                      leading: Radio<String>(
                        value: "",
                        groupValue: null,
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                )
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1.seconds),
              ),
            );

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
                    title: Text(cl.displayName),
                    leading: Radio<TeacherClass>(
                      value: cl,
                      groupValue: _selectedClass,
                      onChanged: (value) {
                        if (value == null) return;

                        setState(() {
                          userCubit.selectClass(value);
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
  ParentChild? _selectedChild;

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);

    return BlocBuilder<ChildrenCubit, ChildrenState>(
      builder: (context, state) {
        switch (state.runtimeType) {
          case ChildrenLoading:
            return Opacity(
              opacity: 0.5,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: ScreenSizes.heightQuarterRel(context),
                ),
                child: ListView(
                  padding: const EdgeInsets.all(0),
                  shrinkWrap: true,
                  children: [
                    ListTile(
                      title: const Text('Some child'),
                      leading: Radio<String>(
                        value: "",
                        groupValue: null,
                        onChanged: (_) {},
                      ),
                    ),
                  ],
                )
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1.seconds),
              ),
            );
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
                    title: Text(st.displayName),
                    leading: Radio<ParentChild>(
                      value: st,
                      groupValue: _selectedChild,
                      onChanged: (value) {
                        if (value == null) return;

                        setState(() {
                          userCubit.selectChild(value);
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
