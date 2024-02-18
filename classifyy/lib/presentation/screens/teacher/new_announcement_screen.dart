import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/button_primary.dart';
import 'package:classifyy/presentation/widgets/text_area.dart';
import 'package:classifyy/presentation/widgets/text_field_primary.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NewAnnouncementScreen extends StatefulWidget {
  const NewAnnouncementScreen({super.key});

  @override
  State<NewAnnouncementScreen> createState() => _NewAnnouncementScreenState();
}

class _NewAnnouncementScreenState extends State<NewAnnouncementScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _fadeController = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    )..forward();

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Announcement'),
      ),
      body: SafeArea(
        child: SizedBox(
          width: ScreenSizes.widthSlabFourRel(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                const TitleLarge(
                  title: 'Send an announcement to an entire class',
                ),
                const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
                const TextArea(labelText: "Write something here..."),
                const SizedBox(height: ScreenSizes.heightSlabOneAbs),
                ButtonPrimary(buttonText: 'Send', onPressed: () {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
