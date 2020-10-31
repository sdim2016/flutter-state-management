class News {
  int _id;
  String _title;
  String _text;

  News(this._title, this._text);

  News.withId(this._id, this._title, this._text);

  News.clone(News news): this.withId(news.id, news.title, news.text);

  int get id => _id;
  String get title => _title;
  String get text => _text;

  set title(String newTitle) {
    this._title = newTitle;
  }

  set text(String newText) {
    this._text = newText;
  }

  Map<String, dynamic> toDatabaseJson()  =>
      {
        "id": this._id,
        "title": this._title,
        "text": this._text
      };

  Map<String, dynamic> toDatabaseJsonNoId() =>
      {
        "title": this._title,
        "text": this._text
      };

  factory News.fromJsonMap(Map<String, dynamic> map) =>
      News.withId(
          map['id'],
          map['title'],
          map['text']
      );

}