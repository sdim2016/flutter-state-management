import 'package:flutter/material.dart';
import 'package:getxsm/controller/news_controller.dart';
import 'package:getxsm/utils/note_mode.dart';
import 'package:getxsm/view/pages/news_page.dart';
import 'package:getxsm/view/pages/note_view_page.dart';
import 'package:getxsm/view/pages/notes_page.dart';
import 'package:getxsm/view/pages/settings_page.dart';
import 'package:get/get.dart';

class MainScreen extends StatefulWidget {
  MainScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {

  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    NotesPage(),
    NewsPage(),
    SettingsPage()
  ];

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
            Get.to(NoteViewPage(viewType: NoteMode.Add,));
          })
        ],
      ),
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
    );
  }
}