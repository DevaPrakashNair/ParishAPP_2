import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parish_app/data/model/ChangeModel.dart';
import 'package:parish_app/data/model/EditModel.dart';
import 'package:parish_app/data/model/WardModel.dart';
import 'package:parish_app/data/model/NewsModel.dart';
import 'package:parish_app/data/model/ProfileModel.dart';
import 'package:parish_app/data/model/WithoutLoginModel.dart';
import 'package:parish_app/data/webclient.dart';

import 'model/AddMember.dart';
import 'model/AllUserModel.dart';
import 'model/DirectoryModel.dart';
import 'model/JobModel.dart';
import 'model/LoginModel.dart';

class Repository{
  Future<WithoutLoginModel> wlogin({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final WithoutLoginModel disModel = WithoutLoginModel.fromJson(response);
    return disModel;
  }
  Future<LoginModel> login({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final LoginModel directoryModel = LoginModel.fromJson(response);
    return directoryModel;
  }
  Future<EditModel> edit({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final EditModel editModel = EditModel.fromJson(response);
    return editModel;
  }
  Future<AddMember> addfamily({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final AddMember addModel = AddMember.fromJson(response);
    return addModel;
  }
  Future<ChangeModel> change({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final ChangeModel changeModel = ChangeModel.fromJson(response);
    return changeModel;
  }


  Future<JobModel> job({required String url, dynamic data}) async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);

    final JobModel job_Model = JobModel.fromJson(response);
    return job_Model;
  }
  Future<NewsModel> news({required String url, dynamic data}) async {

    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);

    final NewsModel news_Model = NewsModel.fromJson(response);
    return news_Model;
  }
  Future<ProfileModel> profile({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final ProfileModel disModel = ProfileModel.fromJson(response);
    return disModel;
  }

  Future<AllUserModel> all({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final AllUserModel allModel = AllUserModel.fromJson(response);
    return allModel;
  }
  
  Future<WardModel> ward({required String url}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.get(url);
    final WardModel wardModel = WardModel.fromJson(response);
    return wardModel;
  }
  Future<DirectoryModel> directory({required String url, dynamic data}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      Fluttertoast.showToast(
        msg: "No internet connection",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
      );
    }
    final dynamic response = await WebClient.post(url, data);
    final DirectoryModel directoryModel = DirectoryModel.fromJson(response);
    return directoryModel;
  }
}