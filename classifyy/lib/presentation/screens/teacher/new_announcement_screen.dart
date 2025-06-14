import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/announcement_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/button_primary.dart';
import 'package:classifyy/presentation/widgets/inputs/file_picker.dart';
import 'package:classifyy/presentation/widgets/inputs/text_field_primary.dart';
import 'package:classifyy/presentation/widgets/layouts/dashboard_layout.dart';
import 'package:classifyy/presentation/widgets/layouts/primary_layout.dart';
import 'package:classifyy/presentation/widgets/inputs/text_area.dart';
import 'package:classifyy/presentation/widgets/typography/sub_title.dart';
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

  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController titleController = TextEditingController();

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
    descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);
    final announcementCubit = BlocProvider.of<AnnouncementCubit>(context);

    Future<void> handleProceed() async {
      await announcementCubit.createAnnouncement(
        descriptionController.text,
        userCubit.state.selectedClass!.id,
        userCubit.state.user!.id,
      );
    }

    return PrimaryLayout(
      appBarTitle: 'New Announcement',
      children: [
        const TitleLarge(title: 'Send an announcement to an entire class'),
        const SizedBox(height: ScreenSizes.slabTwo),
        const SubTitle(text: 'Enter Announcement Details'),
        const SizedBox(height: ScreenSizes.slabTwo),
        DropdownAppBar(),
        const SizedBox(height: ScreenSizes.slabTwo),
        TextFieldPrimary(
          labelText: "Title*",
          controller: titleController,
        ),
        // const SizedBox(height: ScreenSizes.slabTwo),
        // TextArea(
        //   controller: descriptionController,
        //   labelText: "Description*",
        // ),
        const Text("Describe your message in detail"),
        const SizedBox(height: ScreenSizes.slabOne),
        const Text("Upload relevant documents and pictures"),
        FileUploadWidget(),
        const Expanded(child: SizedBox.shrink()),
        ButtonPrimary(
          buttonText: 'Submit',
          onPressed: handleProceed,
        ),
        BlocListener<AnnouncementCubit, AnnouncementState>(
          listener: (context, state) {
            if (state is AnnouncementSuccess) {
              context.router.pop();
            }
          },
          child: const SizedBox.shrink(),
        )
      ],
    );
  }
}
