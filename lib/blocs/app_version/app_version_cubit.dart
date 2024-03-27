import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_messenger_app/repository/app_version_repository.dart';

import '../../models/app_version_res.dart';
import '../../shared/package_info.dart';

part 'app_version_state.dart';

class AppVersionCubit extends Cubit<AppVersionState> {
  AppVersionCubit() : super(AppVersionInitial());

  void onAppStarted() async {
    try {
      final appVersion = await checkDeviceInfo();
      final response = await checkAppVersion(appVersion.$3, 'ios');
      emit(AppVersionLoaded(response, appVersion.$3));
    } catch (e) {
      emit(AppVersionError(e.toString()));
    }
  }
}
