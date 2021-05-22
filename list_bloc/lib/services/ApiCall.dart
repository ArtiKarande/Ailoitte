/*
 *
 *  * Created by Arti Karande in the year of 2021.
 *  * Copyright (c) 2021 Arti Karande. All rights reserved.
 *
 */

import 'package:dio/dio.dart';
import 'package:list_bloc/common-component/urlConstant.dart';

/// API calls maintained here[dio] package used

class APICall {
  Dio dio = new Dio();

  getNewsList() async {
    try {
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.connectTimeout = 8000; //8s
      dio.options.receiveTimeout = 8000;
      //dio.options.headers = {"Authorization": 'Bearer ' +  '838a1ce4dab8926454w677gd82d7ff071de3270b579d0c'};

      var response = await dio.get(Constants.news);
      if (response.statusCode == 200 && response != null) {
        print(response.data);
        return response.data;
      }
    } on DioError catch (e) {
      print(e);
    }
  }
}
