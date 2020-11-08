import 'package:equatable/equatable.dart';

abstract class SettingsState extends Equatable {
  const SettingsState();
}

class SettingsObtainedState extends SettingsState {
  final bool darkTheme;

  const SettingsObtainedState(this.darkTheme);

  @override
  List<Object> get props => [darkTheme];
}

