import 'package:flutter/material.dart';

class GroupTile extends StatelessWidget {
  
  final String groupName;

  GroupTile({this.groupName});
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Card(
        margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25.0,
            backgroundColor: Colors.lightBlue,
          ),

          title: Text(groupName),
        ),
      ),
    );
  }
}