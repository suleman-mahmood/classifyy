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
  void initState() {
    super.initState();

    // locator<Listeners>().registerAuthListener(context);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        widget.child,
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case const (UserLoading):
                return PageLoader();
              default:
                return const SizedBox.shrink();
            }
          },
        ),
      ],
    );
  }
}

class PageLoader extends StatelessWidget {
  const PageLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.withValues(alpha: 0.5),
      width: ScreenSizes.heightFullRel(context),
    );
  }
}
