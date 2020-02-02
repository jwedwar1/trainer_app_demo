import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, "Home2", Color.fromRGBO(46, 42, 60, 1)),
    new TabItem(Icons.library_books, "Wiki", Color.fromRGBO(132, 127, 148, 1)),
    new TabItem(Icons.directions_run, "Workouts", Color.fromRGBO(158, 172, 221, 1)),
    new TabItem(Icons.fastfood, "Nutrition", Color.fromRGBO(64, 81, 124, 1)),
    new TabItem(Icons.mail, "Inbox", Color.fromRGBO(132, 127, 148, 1)),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }


  Widget bodyContainer() {
    Color selectedColor = tabItems[selectedPos].circleColor;
    String title;
    switch (selectedPos) {
      case 0:
        title = "Home Page";
        break;
      case 1:
        title = "Wiki Page";
        break;
      case 2:
        title = "Workout Page";
        break;
      case 3:
        title = "Nutrition Page";
        break;
      case 4:
        title = "Trainer Chat Page";
        break;
    }

    return GestureDetector(
      child: Container(
        width: double.infinity,
        height: double.infinity,
        color: selectedColor,
        child: Center(
          child: Text(
            title,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          ),
        ),
      ),
      onTap: () {
        if (_navigationController.value == tabItems.length - 1) {
          _navigationController.value = 0;
        } else {
          _navigationController.value++;
        }
      },
    );
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Colors.white,
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
          print(_navigationController.value);
        });
      },
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
          Align(alignment: Alignment.bottomCenter, child: bottomNav())
        ],
      ),
    );
  }

  /* Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
           padding: EdgeInsets.symmetric(horizontal: 20),
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(5)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(2, 4),
                      blurRadius: 5,
                      spreadRadius: 2)
                ],
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Color(0xff847f94), Color(0xff575366)]),
            ),
            child: Row(
              children: <Widget>[
              //  tab bar here
              Padding(child: bodyContainer(), padding: EdgeInsets.only(bottom: bottomNavBarHeight),),
              Align(alignment: Alignment.bottomCenter, child: bottomNav())
              ],
            ),
          ),
        ],
      )
    );
  } */
  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}