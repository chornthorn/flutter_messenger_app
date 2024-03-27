import 'package:flutter/material.dart';

import '../models/app_version_res.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key, required this.data, required this.currentVersion});

  final AppVersionResponse data;
  final String currentVersion;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Version: ${data.version}'),
      ),
      body: Column(
        children: [
          Center(
            child: Text('currentVersion: $currentVersion'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const SecondPage(),
                ),
              );
            },
            child: const Text('Go to Second Page'),
          ),
        ],
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Page'),
      ),
      body: Column(
        children: [
          const Center(
            child: Text('Hello, Second Page!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Go Back'),
          ),
        ],
      ),
    );
  }
}
