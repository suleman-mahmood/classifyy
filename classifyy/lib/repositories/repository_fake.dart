import 'package:classifyy/repositories/repository.dart';

class FakeRepository implements Repository {
  @override
  Future<void> loginUser(String email, String password) {
    return Future.delayed(
      const Duration(seconds: 1),
      () {},
    );
  }
}
