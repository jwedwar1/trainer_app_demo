import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Team BR',
      home: MyWelcomePage(title: 'Welcome Page'),
    );
  }
}

class MyWelcomePage extends StatefulWidget {
  MyWelcomePage({Key key, this.title}) : super(key: key);

  final String title;
  
  @override
  _MyWelcomePageState createState() => _MyWelcomePageState();
}

class _MyWelcomePageState extends State<MyWelcomePage> {
  Widget _loginButton() {
    return InkWell(
      onTap: null,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Color(0xff2e2a3c).withAlpha(100),
                  offset: Offset(2, 4),
                  blurRadius: 8,
                  spreadRadius: 2)
            ],
            color: Color(0xff637dab)),
        child: Text(
          'Login',
          style: TextStyle(fontSize: 20, color: Color(0xff000000)),
        ),
      ),
    );
  }
  Widget _signUpButton() {
    return InkWell(
      onTap: null,
      child: Container(
         width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 13),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(color: Color(0xff6e7dab), width: 2),
            ),
          child: Text(
            'Sign Up',
            style: TextStyle(fontSize: 20, color: Color(0xff6e7dab)),
          ),
      ),
      );
  }
   Widget _title() {
    return Container(
      child: (Column(
        children: <Widget>[
            Image.asset('assets/images/BRlogo.png')
          ],
        )
      ),
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
              SizedBox(height: 20),
              _loginButton(),
              SizedBox(height: 20),
              _signUpButton(),
              SizedBox(height:20)
            ],)
          )
        ],
      ),
     );
  }
}
