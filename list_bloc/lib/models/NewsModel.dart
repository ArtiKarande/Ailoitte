/*
 *
 *  * Created by Arti Karande in the year of 2021.
 *  * Copyright (c) 2021 Arti Karande. All rights reserved.
 *
 */

class NewsModel{

  var _id, _name, _userName, _email, _city, _mobile;

  NewsModel(this._id, this._name, this._userName, this._email, this._city, this._mobile);

  get city => _city;

  set city(value) {
    _city = value;
  }

  get email => _email;

  set email(value) {
    _email = value;
  }

  get userName => _userName;

  set userName(value) {
    _userName = value;
  }

  get name => _name;

  set name(value) {
    _name = value;
  }

  get id => _id;

  set id(value) {
    _id = value;
  }

  get mobile => _mobile;

  set mobile(value) {
    _mobile = value;
  }
}