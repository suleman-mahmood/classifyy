import 'package:classifyy/cubits/user_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

@Deprecated("We don't listen to auth events now")
class Listeners {
  bool didSetup = false;
  late final BuildContext context;
  late final UserCubit userCubit;

  registerAuthListener(BuildContext ctx) {
    if (didSetup) return;
    didSetup = true;
    context = ctx;

    userCubit = BlocProvider.of<UserCubit>(context);

    // supabase.auth.onAuthStateChange.listen((data) {
    //   final AuthChangeEvent event = data.event;
    //   final Session? session = data.session;
    //
    //   if (event == AuthChangeEvent.initialSession ||
    //       event == AuthChangeEvent.signedIn) {
    //     if (session == null) return;
    //
    //     userCubit.fetchUser(session.user.id);
    //   }
    //   else if (event == AuthChangeEvent.signedOut) {
    //     context.router.push(LoginRoute());
    //   }
    // });
  }
}
