/*
 *
 *  * Created by Arti Karande in the year of 2021.
 *  * Copyright (c) 2021 Arti Karande. All rights reserved.
 *
 */

import 'package:flutter/material.dart';
import 'package:list_bloc/News/Details/NewsDetailsView.dart';
import 'package:list_bloc/common-component/app_theme.dart';

class NewsDetails extends StatefulWidget {
  // const NewsDetails({Key key}) : super(key: key);

  String name, mobile;

  NewsDetails(this.name, this.mobile);

  @override
  NewsDetailsView createState() => NewsDetailsView();
}

abstract class NewsDetailsState extends State<NewsDetails> {
  /// variable declaration
  AppTheme utils = new AppTheme();
}
