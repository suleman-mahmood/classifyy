import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/announcement_cubit.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/button_primary.dart';
import 'package:classifyy/presentation/widgets/layouts/primary_layout.dart';
import 'package:classifyy/presentation/widgets/inputs/text_area.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

  final TextEditingController _textController = TextEditingController();

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
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final announcementCubit = BlocProvider.of<AnnouncementCubit>(context);

    Future<void> handleProceed() async {
      await announcementCubit.createAnnouncement(_textController.text);
    }

    return PrimaryLayout(
      appBarTitle: 'New Announcement',
      children: [
        const TitleLarge(
          title: 'Send an announcement to an entire class',
        ),
        const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
        TextArea(
          controller: _textController,
          labelText: "Write something here...",
        ),
        const SizedBox(height: ScreenSizes.heightSlabOneAbs),
        ButtonPrimary(buttonText: 'Send', onPressed: handleProceed),
        BlocListener<AnnouncementCubit, AnnouncementState>(
          listener: (context, state) {
            if (state is AnnouncementSuccess) {
              context.router.popUntil(
                (route) => route.data!.name.contains('Dashboard'),
              );
            }
          },
          child: const SizedBox.shrink(),
        )
      ],
    );
  }
}
