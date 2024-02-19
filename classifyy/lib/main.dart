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
      ],
      child: MaterialApp.router(
        routerConfig: appRouter.config(),
      ),
    );
  }
}
