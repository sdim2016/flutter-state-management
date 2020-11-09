// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SettingsViewModel on _SettingsViewModel, Store {
  final _$darkThemeAtom = Atom(name: '_SettingsViewModel.darkTheme');

  @override
  bool get darkTheme {
    _$darkThemeAtom.reportRead();
    return super.darkTheme;
  }

  @override
  set darkTheme(bool value) {
    _$darkThemeAtom.reportWrite(value, super.darkTheme, () {
      super.darkTheme = value;
    });
  }

  final _$_SettingsViewModelActionController =
      ActionController(name: '_SettingsViewModel');

  @override
  void getSettings() {
    final _$actionInfo = _$_SettingsViewModelActionController.startAction(
        name: '_SettingsViewModel.getSettings');
    try {
      return super.getSettings();
    } finally {
      _$_SettingsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSettings(bool darkMode) {
    final _$actionInfo = _$_SettingsViewModelActionController.startAction(
        name: '_SettingsViewModel.setSettings');
    try {
      return super.setSettings(darkMode);
    } finally {
      _$_SettingsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
darkTheme: ${darkTheme}
    ''';
  }
}
