import 'package:auto_route/auto_route.dart';
import 'package:classifyy/cubits/announcement_cubit.dart';
import 'package:classifyy/cubits/user_cubit.dart';
import 'package:classifyy/models/announcement/announcement.dart';
import 'package:classifyy/models/user/user.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/buttons/button_primary.dart';
import 'package:classifyy/presentation/widgets/inputs/text_area.dart';
import 'package:classifyy/presentation/widgets/layouts/primary_layout.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_time_ago/get_time_ago.dart';

enum AnnouncementType {
  myAnnouncement,
  classAnnouncement,
  schoolAdminAnnouncement,
}

@RoutePage()
class AnnouncementScreen extends StatefulWidget {
  final UserRole userRole;

  const AnnouncementScreen({super.key, required this.userRole});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen>
    with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();

  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  late AnnouncementType selectedannouncementType;

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

    selectedannouncementType = widget.userRole == UserRole.teacher
        ? AnnouncementType.myAnnouncement
        : AnnouncementType.classAnnouncement;
  }

  @override
  void dispose() {
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userCubit = BlocProvider.of<UserCubit>(context);

    List<Announcement> filterAnnouncements(List<Announcement> announcements) {
      if (selectedannouncementType == AnnouncementType.myAnnouncement) {
        return announcements
            .where((ann) => ann.announcerId == userCubit.state.user!.id)
            .toList();
      } else if (selectedannouncementType ==
          AnnouncementType.classAnnouncement) {
        return announcements
            .where(
              (ann) =>
                  (widget.userRole == UserRole.teacher
                      ? ann.announcerId != userCubit.state.user!.id
                      : true) &&
                  ann.announcerRole == UserRole.teacher,
            )
            .toList();
      } else if (selectedannouncementType ==
          AnnouncementType.schoolAdminAnnouncement) {
        return announcements
            .where(
              (ann) =>
                  (widget.userRole == UserRole.teacher
                      ? ann.announcerId != userCubit.state.user!.id
                      : true) &&
                  ann.announcerRole == UserRole.school_admin,
            )
            .toList();
      } else {
        return [];
      }
    }

    return PrimaryLayout(
      appBarTitle: 'Announcements',
      // floatingActionButton: widget.userRole == UserRole.teacher
      //     ? FloatingActionButton(
      //         onPressed: () {
      //           context.router.push(const NewAnnouncementRoute());
      //         },
      //         child: const Icon(Icons.add_outlined),
      //       )
      //     : null,
      children: [
        SegmentedButton<AnnouncementType>(
          segments: [
            if (widget.userRole == UserRole.teacher)
              const ButtonSegment(
                value: AnnouncementType.myAnnouncement,
                label: Text('My'),
              ),
            const ButtonSegment(
              value: AnnouncementType.classAnnouncement,
              label: Text('Class'),
            ),
            const ButtonSegment(
              value: AnnouncementType.schoolAdminAnnouncement,
              label: Text('School admin'),
            ),
          ],
          showSelectedIcon: false,
          selected: <AnnouncementType>{selectedannouncementType},
          onSelectionChanged: (Set<AnnouncementType> newSelection) {
            setState(() {
              selectedannouncementType = newSelection.first;
            });
          },
        ),
        const SizedBox(height: ScreenSizes.slabOne),
        BlocBuilder<AnnouncementCubit, AnnouncementState>(
          builder: (context, state) {
            if (state is AnnouncementLoading) {
              return Opacity(
                opacity: 0.5,
                child: SizedBox(
                  height: ScreenSizes.widthSlabOneRel(context),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 16,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Some important announcement'),
                          const Expanded(child: SizedBox.shrink()),
                          Row(
                            children: [
                              const Text('From: Someone else'),
                              const Expanded(child: SizedBox.shrink()),
                              Text(GetTimeAgo.parse(
                                  DateTime.now().subtract(1.minutes)))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
                    .animate(onPlay: (controller) => controller.repeat())
                    .shimmer(duration: 1.seconds),
              );
            }
            if (state is AnnouncementSuccess) {
              final ann = filterAnnouncements(state.announcements);

              return ListView.builder(
                shrinkWrap: true,
                itemCount: ann.length,
                itemBuilder: (context, index) {
                  final item = ann[index];

                  return SizedBox(
                    height: ScreenSizes.widthSlabOneRel(context),
                    child: Card(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 16,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(item.text),
                            const Expanded(child: SizedBox.shrink()),
                            Row(
                              children: [
                                if (item.announcerDisplayName != null &&
                                    selectedannouncementType !=
                                        AnnouncementType.myAnnouncement)
                                  Text('From: ${item.announcerDisplayName!}'),
                                const Expanded(child: SizedBox.shrink()),
                                Text(GetTimeAgo.parse(item.createdAt))
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }
            return const SizedBox.shrink();
          },
        ),
        const Expanded(child: SizedBox.shrink()),
        if (selectedannouncementType == AnnouncementType.myAnnouncement &&
            widget.userRole == UserRole.teacher)
          Column(
            children: [
              TitleLarge(
                title:
                    'Send an announcement to ${userCubit.state.selectedClass!.displayName}',
              ),
              const SizedBox(height: ScreenSizes.slabTwo),
              TextArea(
                controller: _textController,
                labelText: "Write something here...",
              ),
              const SizedBox(height: ScreenSizes.slabOne),
              ButtonPrimary(buttonText: 'Send', onPressed: () {}),
              // BlocListener<AnnouncementCubit, AnnouncementState>(
              //   listener: (context, state) {
              //     if (state is AnnouncementSuccess) {
              //       context.router.pop();
              //     }
              //   },
              //   child: const SizedBox.shrink(),
              // )
            ],
          )
      ],
    );
  }
}
