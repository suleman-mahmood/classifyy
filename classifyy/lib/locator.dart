import 'package:classifyy/presentation/config/listeners.dart';
import 'package:classifyy/repositories/api_repository_imp.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;

@Deprecated("Migrated out of Supabase")
final supabase = Supabase.instance.client;

Future<void> initializeDependencies() async {
  // await Supabase.initialize(
  //   url: const String.fromEnvironment('SUPABASE_URL'),
  //   anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  // );

  locator.registerSingleton<Repository>(
    kDebugMode ? ApiImpRepository() : ApiImpRepository(),
  );

  locator.registerSingleton<Listeners>(Listeners());
}
