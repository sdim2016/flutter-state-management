// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$NewsViewModel on _NewsViewModel, Store {
  final _$newsAtom = Atom(name: '_NewsViewModel.news');

  @override
  List<NewsItem> get news {
    _$newsAtom.reportRead();
    return super.news;
  }

  @override
  set news(List<NewsItem> value) {
    _$newsAtom.reportWrite(value, super.news, () {
      super.news = value;
    });
  }

  final _$_NewsViewModelActionController =
      ActionController(name: '_NewsViewModel');

  @override
  void getNews() {
    final _$actionInfo = _$_NewsViewModelActionController.startAction(
        name: '_NewsViewModel.getNews');
    try {
      return super.getNews();
    } finally {
      _$_NewsViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
news: ${news}
    ''';
  }
}
