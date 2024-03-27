import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/chat_cubit.dart';
import 'package:classifyy/cubits/student_teacher_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/models/user/student_teacher.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/widgets/layouts/primary_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AllTeachersScreen extends StatefulWidget {
  const AllTeachersScreen({super.key});

  @override
  State<AllTeachersScreen> createState() => _AllTeachersScreenState();
}

class _AllTeachersScreenState extends State<AllTeachersScreen> {
  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final chatCubit = BlocProvider.of<ChatCubit>(context);

    Widget buildTeacher(BuildContext context, StudentTeacher student,
        {bool loading = false}) {
      return Opacity(
        opacity: loading ? 0.5 : 1,
        child: Card(
          color: const Color(0xFFFEF7FF),
          child: ListTile(
            title: Text(student.teacherName),
            trailing: const Icon(Icons.chevron_right),
            onTap: () {
              chatCubit.fetchChatMessages();
              context.router.push(StudentChatRoute(
                studentName: student.teacherName,
                otherUserId: student.id,
              ));
            },
          ),
        ),
      )
          .animate(onPlay: (controller) => controller.repeat())
          .shimmer(duration: loading ? 1.seconds : 0.seconds);
    }

    return PrimaryLayout(
      appBarTitle: "${userCubit.state.selectedChild?.displayName}'s teachers",
      children: [
        BlocBuilder<StudentTeacherCubit, StudentTeacherState>(
          builder: (context, state) {
            if (state is StudentTeacherLoading) {
              return buildTeacher(
                context,
                StudentTeacher(id: '1', teacherName: 'Someone'),
                loading: true,
              );
            }
            if (state is StudentTeacherSuccess) {
              return ListView.builder(
                itemCount: state.studentTeachers.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildTeacher(context, state.studentTeachers[index]);
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
      ],
    );
  }
}
