import 'package:flutter/material.dart';
import 'package:room_finances/services/auth.dart';
import 'package:room_finances/screens/home/group_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  AuthService _auth = AuthService();

  //temporary group names
  List<String> groups = [
    'Group 1',
    'Group 2',
    'Group 3',
    'Group 1',
    'Group 2',
    'Group 3',
    'Group 1',
    'Group 2',
    'Group 3',
    'Group 1',
    'Group 2',
    'Group 3',
    'Group 1',
    'Group 2',
    'Group 3',
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          
          SliverAppBar(
            pinned: true,
            expandedHeight: 200,
            flexibleSpace: FlexibleSpaceBar(
              title: Text('Main Menu'),
              background: Image(
                image: AssetImage('assets/sliver_bg.jpg'),
                fit: BoxFit.cover,
              ),
            ),
            leading: IconButton(
              icon: Icon(Icons.person),
              onPressed: () async {

                dynamic result = _auth.signOut();
                print(result);

              },
            )
          ),

          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GroupTile(groupName: groups[index]);
              },
              childCount: groups.length,
            ),
          )
          
        ],
      )
    );
  }
}