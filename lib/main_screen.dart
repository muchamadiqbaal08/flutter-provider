import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/api_service.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    Provider.of<ApiService>(context, listen: false).getPostsData();
    return Consumer<ApiService>(
      builder: (_, list, value) => Scaffold(
        body: SafeArea(
          child: ListView.builder(
              padding: const EdgeInsets.all(5),
              itemCount: list.listPosts.length,
              itemBuilder: (ctx, i) {
                return Card(
                  child: ListTile(
                    minLeadingWidth: 5.0,
                    leading: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${i + 1}"),
                      ],
                    ),
                    title: Text(list.listPosts[i]["title"]),
                    subtitle: Text(list.listPosts[i]["body"]),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
