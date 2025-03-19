import 'package:classifyy/presentation/config/listeners.dart';
import 'package:classifyy/repositories/repository.dart';
import 'package:classifyy/repositories/repository_fake.dart';
import 'package:classifyy/repositories/repository_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final locator = GetIt.instance;
final supabase = Supabase.instance.client;

Future<void> initializeDependencies() async {
  await Supabase.initialize(
    url: const String.fromEnvironment('SUPABASE_URL'),
    anonKey: const String.fromEnvironment('SUPABASE_ANON_KEY'),
  );

  locator.registerSingleton<Repository>(
    kDebugMode ? FakeRepository() : ImpRepository(),
  );

  locator.registerSingleton<Listeners>(Listeners());
}
