/*
 *
 *  * Created by Arti Karande in the year of 2021.
 *  * Copyright (c) 2021 Arti Karande. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:list_bloc/Drawer/SideDrawerNavgation.dart';
import 'package:list_bloc/News/Details/NewsDetails.dart';
import 'package:list_bloc/News/News.dart';
import 'package:list_bloc/common-component/app_theme.dart';
import 'package:shimmer/shimmer.dart';

class NewsView extends NewsState {
  AppTheme utils = new AppTheme();
  int indexRefer = 0;
  int currentTabIndex = 0;
  bool _enabled = true;

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Scaffold(
        backgroundColor: AppTheme.background,

        /// Appbar
        appBar: AppBar(
          backgroundColor: Color(0xFFFAFAFA),
          iconTheme: new IconThemeData(color: AppTheme.buttonBackgroundColor),
          elevation: 0,
          title: Text("Dashboard",
              style: utils.textStyleRegular(
                  context, 38, Colors.orange.shade400, FontWeight.w400, 0.0, '')),
          brightness: Brightness.light,
        ),
        drawer: SideDrawer(),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getUsersList(w, h),
            ],
          ),
        ),
      ),
    );
  }

  /// UI - Users vertical listview
  getUsersList(double w, double h) {
    return Flexible(
      child: userList.length > 0
          ? ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: userList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => NewsDetails(
                                userList[index].name, userList[index].mobile)));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Card(
                      elevation: 0,
                      color: Colors.transparent,
                      child: Container(
                        height: h / 5,
                        width: w / 1.1,
                        decoration: BoxDecoration(
                          color: AppTheme.white,
                          border: Border.all(
                            color: Colors.orange.shade200,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  18.0) //                 <--- border radius here
                              ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            /// pending button widget
                            Padding(
                              padding: EdgeInsets.only(
                                  left: w / 20.0, top: h / 50, bottom: h / 90),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(userList[index].name,
                                      overflow: TextOverflow.ellipsis,
                                      style: utils.textStyleRegular(
                                          context,
                                          54,
                                          AppTheme.text1,
                                          FontWeight.w400,
                                          0.0,
                                          '')),
                                  Padding(
                                    padding: EdgeInsets.only(right: w / 30.0),
                                    child: Container(
                                      alignment: Alignment.center,
                                      height: h / 35,
                                      width: w / 5,
                                      //  padding: const EdgeInsets.symmetric(vertical: 10.0),
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(colors: [
                                          AppTheme.buttonBackgroundColor,
                                          AppTheme.red
                                        ]),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text("PENDING",
                                          style: utils.textStyleRegular(
                                              context,
                                              68,
                                              AppTheme.white,
                                              FontWeight.w400,
                                              0.0,
                                              '')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w / 20.0, bottom: h / 90),
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Text('Email :',
                                        style: utils.textStyleRegular1(
                                            context, FontWeight.w400)),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 3,
                                    child: Text(userList[index].email,
                                        style: utils.textStyleRegular1(
                                            context, FontWeight.w400)),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: w / 20.0),
                              child: Row(
                                children: [
                                  Flexible(
                                    fit: FlexFit.tight,
                                    flex: 1,
                                    child: Text('Website :',
                                        style: utils.textStyleRegular1(
                                            context, FontWeight.w400)),
                                  ),
                                  Flexible(
                                      fit: FlexFit.tight,
                                      flex: 3,
                                      child: Text(userList[index].userName,
                                          style: utils.textStyleRegular1(
                                              context, FontWeight.w400))),
                                ],
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: h / 45.0),
                              child: Divider(
                                height: 2.0,
                                color: Colors.grey[400],
                              ),
                            ),

                            /// bottom 2 widgets
                            Expanded(
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Padding(
                                  padding: EdgeInsets.all(w / 70),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      Text('View',
                                          style: utils.textStyleRegular1(
                                              context, FontWeight.w400)),
                                      VerticalDivider(),
                                      Text('End Service',
                                          style: utils.textStyleRegular1(
                                              context, FontWeight.w400)),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              })
          : _enabled == true

              /// before loading data show shimmer effect with listview
              ? Shimmer.fromColors(
                  baseColor: Colors.grey[300],
                  highlightColor: Colors.grey[100],
                  enabled: _enabled,
                  child: Stack(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: w / 20, right: w / 20),
                        child: SizedBox(
                          height: h / 9.5,
                        ),
                      ),
                      ListView.builder(
                        itemCount: 9,
                        itemBuilder: (context, index) {
                          return ListTile(
                            leading: Icon(Icons.image, size: h / 10),
                            title: SizedBox(
                              height: h / 10,
                              child: Container(
                                color: Colors.green,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                )
              : Center(
                  child: Image.asset(
                  'images/noDataFound.png',
                  height: h / 3,
                )),
    );
  }

  /// on press of android back button action
  Future<bool> _onWillPop() {
    return showDialog(
      context: context,
      builder: (context) => new AlertDialog(

        content: new Text('Do you want to exit an App'),
        actions: <Widget>[
          new FlatButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: new Text('No'),
          ),
          new FlatButton(
            onPressed: (){
              SystemNavigator.pop();
            },
            child: new Text('Yes'),
          ),
        ],
      ),
    ) ??
        false;
  }
}
