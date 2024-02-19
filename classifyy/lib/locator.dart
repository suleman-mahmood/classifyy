import 'package:classifyy/repositories/repository.dart';
import 'package:classifyy/repositories/repository_fake.dart';
import 'package:classifyy/repositories/repository_imp.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';

final locator = GetIt.instance;

Future<void> initializeDependencies() async {
  locator.registerSingleton<Repository>(
    kDebugMode ? FakeRepository() : ImpRepository(),
  );
}
