/*
 *
 *  * Created by Arti Karande in the year of 2021.
 *  * Copyright (c) 2021 Arti Karande. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:list_bloc/News/NewsView.dart';
import 'package:list_bloc/models/NewsModel.dart';
import 'package:list_bloc/services/ApiCall.dart';

class News extends StatefulWidget {
  @override
  NewsView createState() => NewsView();
}

abstract class NewsState extends State<News> {
  APICall apiCall = APICall();
  List<NewsModel> userList = <NewsModel>[];

  @override
  void initState() {
    getNews();
    super.initState();
  }

  /// API call [dio] library used
  getNews() async {
    apiCall.getNewsList().then((response) {
      //  if(response['status'] == 200){}

      setState(() {
        for (var user in response) {
          userList.add(NewsModel(user['id'], user['name'], user['website'],
              user['email'], user['city'], user['phone']));
        }
      });
    });
  }
}
