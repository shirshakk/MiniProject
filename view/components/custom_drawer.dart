import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../modelview/firebase/user/userController.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({Key? key}) : super(key: key);

  final UserController _userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text(_userController.user?.displayName ?? ''),
            accountEmail: Text(_userController.user?.email ?? ''),
            currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Text(
                  _userController.user?.email?.isNotEmpty == true
                      ? _userController.user!.email![0]
                      : 'C',
                  style: TextStyle(fontSize: 40.0),
                )),
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home page'),
            onTap: () {
              Get.toNamed('/signed');
            },
          ),
          ListTile(
            leading: Icon(Icons.bookmarks),
            title: Text('Available Books'),
            onTap: () {
              Get.toNamed('/listAllUsersBooks');
            },
          ),
          ListTile(
            leading: Icon(Icons.update),
            title: Text('Update User Profile'),
            onTap: () {
              Get.toNamed('/userUpdate');
            },
          ),
          ListTile(
            leading: Icon(Icons.book),
            title: Text('Register My Read Book'),
            onTap: () {
              Get.toNamed('/registerBook');
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('List My Read Books'),
            onTap: () {
              Get.toNamed('/listBooks');
            },
          ),
        ],
      ),
    );
  }
}
