import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:classifyy/presentation/widgets/dashboard_button.dart';
import 'package:classifyy/presentation/widgets/typography/title_large.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  late final AnimationController _fadeController;
  late final Animation<double> _fadeAnimation;

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
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Class II-B'),
      // ),
      body: SafeArea(
        child: SizedBox(
          width: ScreenSizes.widthSlabFourRel(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Card(
                  color: Color(0xFFFEF7FF),
                  child: Column(
                    children: [
                      ListTile(
                        leading: const Icon(Icons.person_2_outlined),
                        title: const Text('Current class'),
                        subtitle: const Text('II-B'),
                        trailing: showAdditionalClasses
                            ? const Icon(Icons.arrow_upward_outlined)
                            : const Icon(Icons.arrow_downward_outlined),
                        onTap: () {
                          setState(() {
                            showAdditionalClasses = !showAdditionalClasses;
                          });
                        },
                      ),
                      Visibility(
                          visible: showAdditionalClasses,
                          child: const Column(
                            children: [
                              ListTile(
                                title: Text('I-A'),
                              ),
                              ListTile(title: Text('I-B')),
                            ],
                          )),
                    ],
                  ),
                ),
                const SizedBox(height: ScreenSizes.heightSlabOneAbs),
                DashboardButton(
                  buttonText: 'Announcements',
                  iconData: Icons.chat_outlined,
                  onPressed: () {
                    context.router.push(const AnnouncementRoute());
                  },
                ),
                const SizedBox(height: ScreenSizes.heightSlabOneAbs),
                Row(
                  children: [
                    const TitleLarge(title: 'Students'),
                    const Expanded(child: SizedBox.shrink()),
                    IconButton(
                      onPressed: () {
                        context.router.push(const AllStudentsRoute());
                      },
                      icon: const Icon(Icons.search_outlined),
                    ),
                  ],
                ),
                const SizedBox(height: ScreenSizes.heightSlabOneAbs),
                Card(
                  color: const Color(0xFFFEF7FF),
                  child: ListTile(
                    title: const Text('Suleman Mahmood'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.router.push(const StudentChatRoute());
                    },
                  ),
                ),
                const Card(
                  color: Color(0xFFFEF7FF),
                  child: ListTile(
                    title: Text('Fawaz Ahmad'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                const Card(
                  color: Color(0xFFFEF7FF),
                  child: ListTile(
                    title: Text('Shah Faraz'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                const Card(
                  color: Color(0xFFFEF7FF),
                  child: ListTile(
                    title: Text('Abdullah Khan'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
                const Card(
                  color: Color(0xFFFEF7FF),
                  child: ListTile(
                    title: Text('Ahmed Karawita'),
                    trailing: Icon(Icons.chevron_right),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
