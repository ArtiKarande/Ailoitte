/*
 *
 *  * Created by Arti Karande in the year of 2021.
 *  * Copyright (c) 2021 Arti Karande. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:list_bloc/common-component/app_theme.dart';

class SideDrawer extends StatefulWidget {
  SideDrawer();

  @override
  _SideDrawerState createState() => _SideDrawerState();
}

class _SideDrawerState extends State<SideDrawer> {
  AppTheme utils = AppTheme();

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
          ),
          child: drawerList(10),
        ),
      ],
    );
  }

  drawerList(double topDividerHeight) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          Material(
            color: Colors.transparent,
            child: InkWell(
              splashColor: Colors.grey.withOpacity(0.1),
              highlightColor: Colors.transparent,
              child: DrawerHeader(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                          width: w / 5,
                          height: w / 5, //changes
                          decoration: new BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                                width: 0.3, color: Colors.orangeAccent),
                          )),
                    ),

                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text('Arti Karande'),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: Text(
                              'karandearti2@gmail.com',
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          ListTile(
            leading: Icon(Icons.event_note, color: Colors.lightBlue[300]),
            title: Text(
              'My Request',
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.info_outline, color: Colors.orange[300]),
            title: Text('FAQ'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Padding(
            padding: EdgeInsets.only(top: topDividerHeight),
            child: Divider(
              height: 2.0,
              color: Colors.grey[400],
            ),
          ),
          ListTile(
            leading: Icon(Icons.add_call, color: Colors.green[300]),
            title: Text('Support (24 x 7)'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.brown[300]),
            title: Text('Logout'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
