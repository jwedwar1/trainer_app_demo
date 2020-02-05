import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:trainer_app_demo/src/wikipage.dart';
import 'package:trainer_app_demo/src/workoutpage.dart';
import 'package:trainer_app_demo/src/nutritionpage.dart';
import 'package:trainer_app_demo/src/inboxpage.dart';
import 'package:trainer_app_demo/src/homepage.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _RootPageState createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int selectedPos = 0;

  double bottomNavBarHeight = 60;

  List<TabItem> tabItems = List.of([
    new TabItem(Icons.home, " ", Color(0xff9eacdd)),
    new TabItem(Icons.library_books, " ", Color(0xff9eacdd)),
    new TabItem(Icons.directions_run, " ",Color(0xff9eacdd)),
    new TabItem(Icons.fastfood,  " ", Color(0xff9eacdd)),
    new TabItem(Icons.mail, " ", Color(0xff9eacdd)),
  ]);

  CircularBottomNavigationController _navigationController;

  @override
  void initState() {
    super.initState();
    _navigationController = new CircularBottomNavigationController(selectedPos);
  }

  Widget bodyContainer() {
    switch (selectedPos) {
      case 0:
        return HomePage();
        break;
      case 1:
        return WikiPage();
        break;
      case 2:
        return WorkoutPage();
        break;
      case 3:
        return NutritionPage();
        break;
      case 4:
        return InboxPage();
        break;
      default:
        return HomePage();
        break;
    }
  }

  Widget bottomNav() {
    return CircularBottomNavigation(
      tabItems,
      controller: _navigationController,
      barHeight: bottomNavBarHeight,
      barBackgroundColor: Color(0xff575366),
      animationDuration: Duration(milliseconds: 300),
      selectedCallback: (int selectedPos) {
        setState(() {
          this.selectedPos = selectedPos;
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

  @override
  void dispose() {
    super.dispose();
    _navigationController.dispose();
  }
}
