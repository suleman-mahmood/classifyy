import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/widgets/button_primary.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const TitleLarge(title: 'Login'),
                  const TextField(
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  const TextField(
                    decoration: InputDecoration(labelText: "Password"),
                  ),
                  const SizedBox(height: 16),
                  ButtonPrimary(
                    buttonText: 'Login',
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              TitleLarge(title: 'Select class'),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
