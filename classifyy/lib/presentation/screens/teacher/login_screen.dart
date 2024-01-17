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
                      builder: (context) => SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                const TitleLarge(
                                  title: 'Select class',
                                  shouldAnimate: false,
                                ),
                                const RadioExample(),
                                ButtonPrimary(
                                  buttonText: 'Choose class',
                                  onPressed: () {},
                                  shouldAnimate: false,
                                ),
                                const SizedBox(height: 24),
                                // MenuAnchor(
                                //   menuChildren: [
                                //     SizedBox(
                                //       width:
                                //           MediaQuery.of(context).size.width / 4,
                                //     ),
                                //     MenuItemButton(child: Text('I-A')),
                                //     MenuItemButton(child: Text('II-B')),
                                //     MenuItemButton(child: Text('II-C')),
                                //     MenuItemButton(child: Text('II-D')),
                                //   ],
                                //   builder: (_, controller, __) {
                                //     return TextButton(
                                //       onPressed: () {
                                //         if (controller.isOpen) {
                                //           controller.close();
                                //         } else {
                                //           controller.open();
                                //         }
                                //       },
                                //       child: const Text('OPEN MENU'),
                                //     );
                                //   },
                                // ),
                              ],
                            ),
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

enum SingingCharacter { first, second, third }

class RadioExample extends StatefulWidget {
  const RadioExample({super.key});

  @override
  State<RadioExample> createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  SingingCharacter? _character = SingingCharacter.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('I-A'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.first,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('I-B'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.second,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('II-D'),
          leading: Radio<SingingCharacter>(
            value: SingingCharacter.third,
            groupValue: _character,
            onChanged: (SingingCharacter? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}
