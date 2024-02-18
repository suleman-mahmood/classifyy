import 'package:auto_route/auto_route.dart';
import 'package:classifyy/presentation/config/app_router.dart';
import 'package:classifyy/presentation/config/utils.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AllStudentsScreen extends StatefulWidget {
  const AllStudentsScreen({super.key});

  @override
  State<AllStudentsScreen> createState() => _AllStudentsScreenState();
}

class _AllStudentsScreenState extends State<AllStudentsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Class I-A students"),
      ),
      body: SafeArea(
        child: SizedBox(
          width: ScreenSizes.widthSlabFourRel(context),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                SearchAnchor(
                  builder: (
                    BuildContext context,
                    SearchController controller,
                  ) {
                    return SearchBar(
                      controller: controller,
                      padding: const MaterialStatePropertyAll<EdgeInsets>(
                        EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      onTap: () {
                        controller.openView();
                      },
                      leading: const Icon(Icons.search),
                    );
                  },
                  suggestionsBuilder: (
                    BuildContext context,
                    SearchController controller,
                  ) {
                    return [
                      ListTile(
                        title: const Text('Fawaz Ahmad'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          context.router.push(const StudentChatRoute());
                        },
                      ),
                      ListTile(
                        title: const Text('Shah Faraz'),
                        trailing: const Icon(Icons.chevron_right),
                        onTap: () {
                          context.router.push(const StudentChatRoute());
                        },
                      ),
                    ];
                  },
                ),
                const SizedBox(height: ScreenSizes.heightSlabTwoAbs),
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
                Card(
                  color: const Color(0xFFFEF7FF),
                  child: ListTile(
                    title: const Text('Fawaz Ahmad'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.router.push(const StudentChatRoute());
                    },
                  ),
                ),
                Card(
                  color: const Color(0xFFFEF7FF),
                  child: ListTile(
                    title: const Text('Shah Faraz'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.router.push(const StudentChatRoute());
                    },
                  ),
                ),
                Card(
                  color: const Color(0xFFFEF7FF),
                  child: ListTile(
                    title: const Text('Abdullah Khan'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.router.push(const StudentChatRoute());
                    },
                  ),
                ),
                Card(
                  color: const Color(0xFFFEF7FF),
                  child: ListTile(
                    title: const Text('Ahmed Karawita'),
                    trailing: const Icon(Icons.chevron_right),
                    onTap: () {
                      context.router.push(const StudentChatRoute());
                    },
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
