class Note {
  int _id;
  String _title;
  String _text;

  Note(this._title, this._text);

  Note.withId(this._id, this._title, this._text);

  Note.clone(Note note): this.withId(note.id, note.title, note.text);

  int get id => _id;
  String get title => _title;
  String get text => _text;

  set title(String newTitle) {
    this._title = newTitle;
  }

  set text(String newText) {
    this._text = newText;
  }

  @override
  bool operator ==(other) {
    return (other is Note)
        && other.id == id
        && other.title == title
        && other.text == text;
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

  factory Note.fromJsonMap(Map<String, dynamic> map) =>
      Note.withId(
          map['id'],
          map['title'],
          map['text']
      );

}