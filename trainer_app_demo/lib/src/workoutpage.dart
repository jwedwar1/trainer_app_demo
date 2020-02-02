import 'package:flutter/material.dart';

class WorkoutPage extends StatefulWidget {
  WorkoutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _WorkoutPageState createState() => _WorkoutPageState();
}

class _WorkoutPageState extends State<WorkoutPage> {

  Widget _title() {
    return Container(
      child: (Column(
        children: <Widget>[
          Image.asset('assets/images/BRlogo.png'),
          Text("Workout Page")
        ],
      )),
    );
  }

  Widget build(BuildContext context) {
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  _title(),
                ],
              )),
        ],
      ),
    );
  }
}
