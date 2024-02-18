import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/text_field_primary.dart';
import 'package:flutter/material.dart';

@RoutePage()
class StudentChatScreen extends StatefulWidget {
  const StudentChatScreen({super.key});

  @override
  State<StudentChatScreen> createState() => _StudentChatScreenState();
}

class _StudentChatScreenState extends State<StudentChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suleman's chat"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: ScreenSizes.widthSlabFourRel(context),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SizedBox(
                  width: ScreenSizes.widthSlabFourRel(context),
                  child: const Text('Aoa', textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: ScreenSizes.widthSlabFourRel(context),
                  child: const Text('Woa', textAlign: TextAlign.right),
                ),
                SizedBox(
                  width: ScreenSizes.widthSlabFourRel(context),
                  child: const Text('Apka bacha time pe nahi aya', textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: ScreenSizes.widthSlabFourRel(context),
                  child: const Text('Wops', textAlign: TextAlign.right),
                ),
                SizedBox(
                  width: ScreenSizes.widthSlabFourRel(context),
                  child: const Text('Tang kheechta hun main uski', textAlign: TextAlign.right),
                ),
                SizedBox(
                  width: ScreenSizes.widthSlabFourRel(context),
                  child: const Text('Theek hai', textAlign: TextAlign.left),
                ),
                SizedBox(
                  width: ScreenSizes.widthSlabFourRel(context),
                  child: const Text('Thank you miss!', textAlign: TextAlign.right),
                ),
                const Expanded(child: SizedBox.shrink()),
                const TextFieldPrimary(labelText: 'New message...'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
