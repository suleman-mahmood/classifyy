import 'package:classifyy/cubits/announcement_cubit.dart';
import 'package:classifyy/cubits/chat_cubit.dart';
import 'package:classifyy/cubits/children_cubit.dart';
import 'package:classifyy/cubits/class_cubit.dart';
import 'package:classifyy/cubits/class_student_cubit.dart';
import 'package:classifyy/cubits/storage_cubit.dart';
import 'package:classifyy/cubits/student_teacher_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/locator.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MultiBlocProvider(
      providers: [
        BlocProvider<UserCubit>(
          create: (_) => UserCubit(locator<Repository>()),
        ),
        BlocProvider<ClassCubit>(
          create: (_) => ClassCubit(locator<Repository>()),
        ),
        BlocProvider<ChildrenCubit>(
          create: (_) => ChildrenCubit(locator<Repository>()),
        ),
        BlocProvider<AnnouncementCubit>(
          create: (_) => AnnouncementCubit(locator<Repository>()),
        ),
        BlocProvider<ClassStudentCubit>(
          create: (_) => ClassStudentCubit(locator<Repository>()),
        ),
        BlocProvider<ChatCubit>(
          create: (_) => ChatCubit(locator<Repository>()),
        ),
        BlocProvider<StudentTeacherCubit>(
          create: (_) => StudentTeacherCubit(locator<Repository>()),
        ),
        BlocProvider<StorageCubit>(
          create: (_) => StorageCubit(locator<Repository>()),
        ),
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }
}
