import 'package:flutter/material.dart';
import 'package:flutter_api/presentation/dog/dog_list_screen.dart';
import 'package:flutter_api/presentation/dog/dog_sub_breed_screen.dart';
import 'package:flutter_api/presentation/setting/setting_screen.dart';

class ListApp extends StatefulWidget {
  const ListApp({ Key key }) : super(key: key);

  @override
  State<ListApp> createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {

  int _currentPage = 0;
  final List _pages = [DogListScreen(), SettingScreen()];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(title: Center(child: Text('Cute Dogs')),),
          body: _pages[_currentPage],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: _currentPage,
            items: [
            BottomNavigationBarItem(
              label: 'Dogs',
              icon: Icon(Icons.list_alt)),
            BottomNavigationBarItem(
              label: 'Setting',
              icon: Icon(Icons.settings)),
          ],
          onTap: (int index){
            setState(() {
                          _currentPage = index;
                        });
          },
          ),
        )),
        theme: ThemeData(
          primarySwatch: Colors.lime
        ),
        routes: {
          '/subBreed': (context) => DogSubBreedScreen()
        },
    );
  }
}