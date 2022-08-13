import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl=
        "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80";
    return Drawer(
      child: Container(
        color: Colors.deepPurpleAccent,
        child: ListView(
          // padding: EdgeInsets.fromLTRB(0, 15, 0, 0),

          children: [
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: DrawerHeader(
                
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  decoration: BoxDecoration(color: Colors.deepPurpleAccent,),
                  accountName: Text("Sohom Saha",style: TextStyle(color: Colors.white,fontSize: 18)),
                  accountEmail: Text("sohom@gamil.com",style: TextStyle(color: Colors.white,fontSize: 18),),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(CupertinoIcons.home,color: Colors.white,),
                title: Text("Home",textScaleFactor: 1.5,style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(CupertinoIcons.profile_circled,color: Colors.white,),
                title: Text("Profile",textScaleFactor: 1.5,style: TextStyle(color: Colors.white)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                leading: Icon(CupertinoIcons.mail,color: Colors.white,),
                title: Text("Email me",textScaleFactor: 1.5,style: TextStyle(color: Colors.white)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
