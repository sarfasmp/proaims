import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:proaims/apiModel/ApiModel.dart';

class DetailListProvider extends ChangeNotifier {
  TextEditingController _text1 = TextEditingController();
  TextEditingController get text1 => _text1;

  Response? response;
  Dio dio = Dio();

  UserDetailsModel? _userDetailsModel;
  UserDetailsModel? get userDetailsModel => _userDetailsModel;

  Future<List<Publiccard>?> fetchData({String? serviceName}) async {
    final params = {
      "servicename": serviceName,
    };
    try {
      response = await dio.get(
        "http://139.59.41.94:4000/dashboard/userpubliccardssearch",
        queryParameters: params,
      );
      _userDetailsModel = UserDetailsModel.fromJson(response!.data);
      return _userDetailsModel!.publiccards;
    } on DioError catch (e) {
      print(e);
    }
  }

  void onTextChange(String val) {
    //_text1.text=val;
    notifyListeners();
  }
}
