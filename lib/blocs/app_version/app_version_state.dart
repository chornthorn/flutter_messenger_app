part of 'app_version_cubit.dart';

sealed class AppVersionState extends Equatable {
  const AppVersionState();
}

final class AppVersionInitial extends AppVersionState {
  @override
  List<Object> get props => [];
}

final class AppVersionLoading extends AppVersionState {
  @override
  List<Object> get props => [];
}

final class AppVersionLoaded extends AppVersionState {
  final AppVersionResponse data;
  final String currentVersion;

  const AppVersionLoaded(this.data, this.currentVersion);

  @override
  List<Object> get props => [data, currentVersion];
}

final class AppVersionError extends AppVersionState {
  final String message;

  const AppVersionError(this.message);

  @override
  List<Object> get props => [message];
}
