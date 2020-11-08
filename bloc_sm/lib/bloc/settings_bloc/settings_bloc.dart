import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocsm/model/repositories/settings_repository.dart';
import 'package:flutter/cupertino.dart';
import './bloc.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {

  final SettingsRepository settingsRepository;

  SettingsBloc({
    @required SettingsState initialState,
    @required this.settingsRepository
  }) : super(initialState);

  @override
  Stream<SettingsState> mapEventToState(
    SettingsEvent event,
  ) async* {
    if (event is GetSettingsEvent) {
      bool darkTheme = await settingsRepository.getSettings();
      yield SettingsObtainedState(darkTheme);
    }
    if (event is SetSettingsEvent) {
      yield SettingsObtainedState(event.darkTheme);
      await settingsRepository.saveSettings(event.darkTheme);
    }
  }
}
