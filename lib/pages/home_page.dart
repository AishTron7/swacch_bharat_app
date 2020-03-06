import 'package:flutter/material.dart';
import '../services/authentication.dart';
import '../model/garbage.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.auth, this.userId, this.logoutCallback})
      : super(key: key);

  final BaseAuth auth;
  final VoidCallback logoutCallback;
  final String userId;

  @override
  State<StatefulWidget> createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {

final List<Garbage> _allGarbage = Garbage.allGarbage();

  signOut() async {
    try {
      await widget.auth.signOut();
      widget.logoutCallback();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('Uploaded Images'),
          actions: <Widget>[
            new FlatButton(
                child: new Text('Logout',
                    style: new TextStyle(fontSize: 17.0, color: Colors.white)),
                onPressed: signOut)
          ],
        ),
        body: new Padding(
            padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 0.0),
            child: getHomePageBody(context))
    );
  }

    getHomePageBody(BuildContext context) {
    return ListView.builder(
      itemCount: _allGarbage.length,
      itemBuilder: _getItemUI,
      shrinkWrap: true,
      padding: EdgeInsets.all(10.10),
    );
  }

  Widget _getItemUI(BuildContext context, int index) {
    return new Card(
        child: new Column(
      
      children: <Widget>[
         new Container( 
          padding: const EdgeInsets.all(8.0),
          child:
          new Image.asset(
            "assets/" + _allGarbage[index].image,
            fit: BoxFit.cover,
            width: 200.0,
          ),
        ),

    new Container( 
      padding: const EdgeInsets.all(10.10),
      child:                    
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
        Text(
          _allGarbage[index].name,
          style: new TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        ],
        ),
    ),
    ],
    ),
    );}
}
