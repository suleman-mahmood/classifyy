import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/button_primary.dart';
import 'package:classifyy/presentation/widgets/text_field_primary.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildBottomSheet() {
      return SizedBox(
        width: ScreenSizes.widthSlabFourRel(context),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const TitleLarge(title: 'Select class', shouldAnimate: false),
                const ClassOptions(),
                ButtonPrimary(
                  buttonText: 'Choose class',
                  onPressed: () => context.router.push(const DashboardRoute()),
                  shouldAnimate: false,
                ),
                const SizedBox(height: ScreenSizes.heightSlabThreeAbs),
              ],
            ),
          ),
        ),
      );
    }

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
                  const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
                  const TextFieldPrimary(labelText: "Email"),
                  const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
                  const TextFieldPrimary(labelText: "Password"),
                  const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
                  ButtonPrimary(
                    buttonText: 'Proceed',
                    onPressed: () => showModalBottomSheet(
                      context: context,
                      builder: (_) => buildBottomSheet(),
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

enum ClassCharacter { first, second, third }

class ClassOptions extends StatefulWidget {
  const ClassOptions({super.key});

  @override
  State<ClassOptions> createState() => _ClassOptionsState();
}

class _ClassOptionsState extends State<ClassOptions> {
  ClassCharacter? _character = ClassCharacter.first;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: const Text('I-A'),
          leading: Radio<ClassCharacter>(
            value: ClassCharacter.first,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('I-B'),
          leading: Radio<ClassCharacter>(
            value: ClassCharacter.second,
            groupValue: _character,
            onChanged: (value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        ListTile(
          title: const Text('II-D'),
          leading: Radio<ClassCharacter>(
            value: ClassCharacter.third,
            groupValue: _character,
            onChanged: (value) {
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
