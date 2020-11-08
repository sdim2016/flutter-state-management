import 'package:equatable/equatable.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();

  @override
  List<Object> get props => [];
}

class GetSettingsEvent extends SettingsEvent { }

class SetSettingsEvent extends SettingsEvent {
  final bool darkTheme;

  const SetSettingsEvent(this.darkTheme);

  @override
  List<Object> get props => [darkTheme];
}

