import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/layouts/primary_layout.dart';
import 'package:flutter/material.dart';

enum AnnouncementType {
  myAnnouncement,
  classAnnouncement,
  schoolAdminAnnouncement,
}

@RoutePage()
class AnnouncementScreen extends StatefulWidget {
  const AnnouncementScreen({super.key});

  @override
  State<AnnouncementScreen> createState() => _AnnouncementScreenState();
}

class _AnnouncementScreenState extends State<AnnouncementScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

  AnnouncementType selectedannouncementType = AnnouncementType.myAnnouncement;

  bool showAdditionalClasses = false;

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
    return PrimaryLayout(
      appBarTitle: 'Announcements',
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.router.push(const NewAnnouncementRoute());
        },
        child: const Icon(Icons.add_outlined),
      ),
      children: [
        SegmentedButton<AnnouncementType>(
          segments: const [
            ButtonSegment(
              value: AnnouncementType.myAnnouncement,
              label: Text('My'),
            ),
            ButtonSegment(
              value: AnnouncementType.classAnnouncement,
              label: Text('Class'),
            ),
            ButtonSegment(
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
        const SizedBox(height: ScreenSizes.heightSlabOneAbs),
        SizedBox(
          height: ScreenSizes.widthSlabOneRel(context),
          child: const Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('A very important announcement'),
                  Expanded(child: SizedBox.shrink()),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [Text('11:00 am Monday')],
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(
          height: ScreenSizes.widthSlabOneRel(context),
          child: const Card(
            child: Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 8,
                vertical: 16,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('A very important announcement'),
                  Expanded(child: SizedBox.shrink()),
                  Row(
                    children: [
                      Text('From: Muhammad Amir'),
                      Expanded(child: SizedBox.shrink()),
                      Text('11:00 am Monday'),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
