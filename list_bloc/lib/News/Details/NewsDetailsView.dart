/*
 *
 *  * Created by Arti Karande in the year of 2021.
 *  * Copyright (c) 2021 Arti Karande. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:list_bloc/News/Details/NewsDetails.dart';
import 'package:list_bloc/common-component/app_theme.dart';

class NewsDetailsView extends NewsDetailsState {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFFAFAFA),
        iconTheme: new IconThemeData(color: AppTheme.buttonBackgroundColor),
        elevation: 0,
        title: Text("News Details",
            style: utils.textStyleRegular(
                context, 38, Colors.orange.shade400, FontWeight.w400, 0.0, '')),
        brightness: Brightness.light,
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.all(w / 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight, flex: 1, child: Text('Req ID:')),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Text('#SREQ2546')),
                      Flexible(
                        fit: FlexFit.tight,
                        flex: 0,
                        child: Text('PENDING',
                            style: utils.textStyleRegular(
                                context,
                                54,
                                Colors.orange.shade400,
                                FontWeight.w400,
                                0.0,
                                '')),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h / 45.0),
                    child: Divider(
                      height: 2.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Text('Billing'),
                  Padding(
                    padding: EdgeInsets.only(top: w / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Visiting fee',
                            style: utils.textStyleRegular(context, 54,
                                AppTheme.text1, FontWeight.w400, 0.0, '')),
                        Text('Rs. 200',
                            style: utils.textStyleRegular(context, 54,
                                AppTheme.text1, FontWeight.w400, 0.0, '')),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Service fee',
                          style: utils.textStyleRegular(context, 54,
                              AppTheme.text1, FontWeight.w400, 0.0, '')),
                      Text('Rs. 0',
                          style: utils.textStyleRegular(context, 54,
                              AppTheme.text1, FontWeight.w400, 0.0, '')),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: h / 45.0),
                    child: Divider(
                      height: 2.0,
                      color: Colors.grey[400],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: w / 20, bottom: w / 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Total Amount',
                            style: utils.textStyleRegular(context, 54,
                                AppTheme.text1, FontWeight.w400, 0.0, '')),
                        Text('Rs. 200',
                            style: utils.textStyleRegular(context, 54,
                                AppTheme.text1, FontWeight.w400, 0.0, '')),
                      ],
                    ),
                  ),
                  Divider(
                    height: 2.0,
                    color: Colors.grey[400],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Text('Customer Details :',
                      style: utils.textStyleRegular(context, 50, AppTheme.text1,
                          FontWeight.w400, 0.0, '')),
                  SizedBox(
                    height: h / 50,
                  ),
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight, flex: 1, child: Text('Name :')),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Text(widget.name)),
                    ],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text('Mobile Number :')),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Text(widget.mobile)),
                    ],
                  ),
                  SizedBox(
                    height: h / 50,
                  ),
                  Row(
                    children: [
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 1,
                          child: Text('Address :')),
                      Flexible(
                          fit: FlexFit.tight,
                          flex: 2,
                          child: Text(
                              'C - 301 Ellora Residency Vikasnagar Dehuroad Pune 412101')),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          alignment: Alignment.center,
                          height: h / 15,
                          width: w / 2.5,
                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(colors: [
                              AppTheme.buttonBackgroundColor,
                              AppTheme.red
                            ]),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Text(
                            "Start Service",
                            style: TextStyle(
                                fontSize: h / 45, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
