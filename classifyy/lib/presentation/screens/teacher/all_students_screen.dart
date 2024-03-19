import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/chat_cubit.dart';
import 'package:classifyy/cubits/class_student_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/models/user/class_student.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/layouts/primary_layout.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@RoutePage()
class AllStudentsScreen extends StatefulWidget {
  const AllStudentsScreen({super.key});

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {
  List<ClassStudent> students = [];

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final chatCubit = BlocProvider.of<ChatCubit>(context);

    Widget buildStudent(BuildContext context, ClassStudent student) {
      return Card(
        color: const Color(0xFFFEF7FF),
        child: ListTile(
          title: Text(student.studentName),
          trailing: const Icon(Icons.chevron_right),
          onTap: () {
            chatCubit.fetchChatMessages();
            context.router.push(StudentChatRoute(
              studentName: student.studentName,
              otherUserId: student.id,
            ));
          },
        ),
      );
    }

    return PrimaryLayout(
      appBarTitle: 'Class ${userCubit.state.selectedClass?.displayName} students',
      children: [
        SearchAnchor(
          builder: (
            BuildContext context,
            SearchController controller,
          ) {
            return SearchBar(
              controller: controller,
              padding: const MaterialStatePropertyAll<EdgeInsets>(
                EdgeInsets.symmetric(horizontal: 16.0),
              ),
              onTap: () {
                controller.openView();
              },
              onChanged: (_) {
                controller.openView();
              },
              leading: const Icon(Icons.search),
            );
          },
          suggestionsBuilder: (
            BuildContext context,
            SearchController controller,
          ) {
            final query = controller.value.text;
            return students
                .where((st) =>
                    st.studentName.toLowerCase().contains(query.toLowerCase()))
                .map(
                  (st) => ListTile(
                    title: Text(st.studentName),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      chatCubit.fetchChatMessages();
                      context.router.push(StudentChatRoute(
                        studentName: st.studentName,
                        otherUserId: st.id,
                      ),);
                    },
                  ),
                );
          },
        ),
        const SizedBox(height: ScreenSizes.slabTwo),
        BlocBuilder<ClassStudentCubit, ClassStudentState>(
          builder: (context, state) {
            if (state is ClassStudentSuccess) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                setState(() {
                  students = state.classStudents;
                });
              });

              return ListView.builder(
                itemCount: state.classStudents.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return buildStudent(context, state.classStudents[index]);
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
