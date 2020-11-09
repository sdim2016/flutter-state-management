import 'package:flutter/material.dart';
import 'package:mobxsm/model/repositories/news_repository.dart';
import 'package:mobxsm/model/repositories/note_repository.dart';
import 'package:mobxsm/model/repositories/settings_repository.dart';
import 'package:mobxsm/utils/note_mode.dart';
import 'package:mobxsm/view/pages/news_page.dart';
import 'package:mobxsm/view/pages/note_view_page.dart';
import 'package:mobxsm/view/pages/notes_page.dart';
import 'package:mobxsm/view/pages/settings_page.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title, this.noteRepository, this.newsRepository, this.settingsRepository, this.setDarkTheme}) : super(key: key);

  final String title;
  final NoteRepository noteRepository;
  final NewsRepository newsRepository;
  final SettingsRepository settingsRepository;
  final Function setDarkTheme;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;
  UniqueKey _notesPageKey = UniqueKey();

//  static List<Widget> _widgetOptions = <Widget>[
//    NotesPage(),
//    NewsPage(),
//    SettingsPage()
//  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.note),
              label: 'Notes'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.web),
              label: 'News'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: 'Settings'
          )
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          if (_selectedIndex == 0) IconButton(icon: Icon(Icons.add), onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                  return NoteViewPage(viewType: NoteMode.Add, noteRepository: widget.noteRepository,);
                })
              ).then((value) {
                setState(() {
                  _notesPageKey = UniqueKey();
                });
              });
          })
        ],
      ),
      body: Container(
        child: Builder(
          builder: (BuildContext context) {
            switch(_selectedIndex) {
              case 0: return NotesPage(key: _notesPageKey, noteRepository: widget.noteRepository,); break;
              case 1: return NewsPage(newsRepository: widget.newsRepository,); break;
              case 2: return SettingsPage(settingsRepository: widget.settingsRepository, setDarkTheme: widget.setDarkTheme,); break;
              default: return Container(); break;
            }
        },),
      ),
    );
  }
}