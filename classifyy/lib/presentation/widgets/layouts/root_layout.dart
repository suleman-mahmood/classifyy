import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RootLayout extends StatefulWidget {
  final Widget child;

  const RootLayout({super.key, required this.child});

  @override
  State<RootLayout> createState() => _RootLayoutState();
}

class _RootLayoutState extends State<RootLayout> {
  @override
  Widget build(BuildContext context) {
    Widget buildLoader() {
      return Container(
        color: Colors.grey.withOpacity(0.5),
        width: ScreenSizes.heightFullRel(context),
      );
    }

    return Stack(
      children: [
        widget.child,
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case UserLoading:
                return buildLoader();
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}
