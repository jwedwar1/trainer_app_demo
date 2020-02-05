import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _title() {
    return Container(
      child: (Column(
        children: <Widget>[
          Image.asset('assets/images/BRlogo.png'),
          Text("Home Page")
        ],
      )),
    );
  }

  Widget _appBar() {
    return GFAppBar(
    backgroundColor: Color(0xff575366),
    title: Text('BR Physiques'),
    centerTitle: true,
    actions: <Widget>[
      GFIconButton(
        icon: Icon(Icons.filter_center_focus),
        color: Color(0xffffffff),
        onPressed: null,
      )
    ],
  );
 }

Widget _drawer() {
  return GFDrawer(
    color: Color(0xff575366),
    elevation: 3,
    child: ListView(
      padding: EdgeInsets.zero,
      children: <Widget>[
        GFDrawerHeader(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xff847f94), Color(0xff575366)]
            )),
          currentAccountPicture: GFAvatar(
            radius: 100.0,
            backgroundImage: NetworkImage("https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png"),  
          ),
          child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text('John D'),
              Text('johnd@email.com')
            ],
          )
        ),
        Card(
            color: Color(0xff9eacdd),
            child: ListTile(
            leading: Icon(Icons.account_circle),
            title: Text("Profile"),
            onTap: null
          ),
        ),
        Card(
            color: Color(0xff9eacdd),
            child: ListTile(
            leading: Icon(Icons.image),
            title: Text("Photos"),
            onTap: null
          ),
        ),
        Card(
            color: Color(0xff9eacdd),
            child: ListTile(
            leading: Icon(Icons.timeline),
            title: Text("Report"),
            onTap: null
          ),
        ),
          Card(
            color: Color(0xff9eacdd),
            child: ListTile(
            leading: Icon(Icons.perm_data_setting),
            title: Text("Settings"),
            onTap: null
          ),
        )
      ]
    ),

  );
}
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      drawer: _drawer(),
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
                color: Color(0xff575366),
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
