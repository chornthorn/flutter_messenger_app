import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:upgrader/upgrader.dart';

import 'blocs/app_version/app_version_cubit.dart';
import 'pages/home_page.dart';
import 'provider.dart';
import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Upgrader.clearSavedSettings();
  await Upgrader.sharedInstance.initialize();
  Bloc.observer = SimpleBlocObserver();
  runApp(const Provider(child: RootApp()));
}

class RootApp extends StatefulWidget {
  const RootApp({super.key});

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocListener<AppVersionCubit, AppVersionState>(
        listener: (context, state) async {
          if (state is AppVersionLoaded) {
            if (state.data.priority == 2) {
              await Upgrader.clearSavedSettings();
            }
          }
        },
        child: BlocBuilder<AppVersionCubit, AppVersionState>(
          builder: (context, state) {
            if (state is AppVersionLoading) {
              return const Scaffold(
                body: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            } else if (state is AppVersionLoaded) {
              return UpgradeAlert(
                showLater: false,
                showIgnore: state.data.priority == 1,
                upgrader: Upgrader(
                  durationUntilAlertAgain: const Duration(seconds: 0),
                  debugLogging: true,
                  storeController: UpgraderStoreController(
                    oniOS: () => UpgraderAppcastStore(
                      appcastURL: state.data.appCastUrl!,
                    ),
                    onAndroid: () => UpgraderAppcastStore(
                      appcastURL:
                          'http://192.168.1.162:3000/app-versions/xml/android/appcast',
                    ),
                  ),
                  minAppVersion: state.data.minAppVersion,
                ),
                dialogStyle: switch (Platform.operatingSystem) {
                  'android' => UpgradeDialogStyle.material,
                  _ => UpgradeDialogStyle.cupertino,
                },
                child: HomePage(
                  data: state.data,
                  currentVersion: state.currentVersion,
                ),
              );
            } else {
              return const HomePage();
            }
          },
        ),
      ),
    );
  }
}
