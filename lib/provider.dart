import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_messenger_app/blocs/app_version/app_version_cubit.dart';

class Provider extends StatelessWidget {
  const Provider({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        // Add your Blocs here
        BlocProvider(
          lazy: false,
          create: (context) => AppVersionCubit()..onAppStarted(),
        ),
      ],
      child: child,
    );
  }
}
