
import 'dart:convert';

import 'package:flutter_networking/model/emplist_model.dart';
import 'package:flutter_networking/model/employee_model.dart';
import 'package:http/http.dart';

class HttpEmployee {
  static String BASE = "dummy.restapiexample.com";

  /* Http Apis */
  static String API_LIST = "/api/v1/employees";
  static String API_ITEM = "/api/v1/employee/"; //{id}
  static String API_CREATE = "/api/v1/create";
  static String API_UPDATE = "/api/v1/update/"; //{id}
  static String API_DELETE = "/api/v1/delete/"; //{id}

   /* Http Requests */

  static Future<String?> GET(String api) async{
      var uri = Uri.https(BASE, api);
      var response = await get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      return null;
  }

  static Future<String?> GETSIngle(String api) async{
    var uri = Uri.https(BASE, api);
    var response = await get(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> POST(String api, Map<String, dynamic> params) async{
    var uri = Uri.https(BASE, api);
    var response = await post(uri, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> PUT(String api, Map<String, dynamic> params) async{
    var uri = Uri.https(BASE, api);
    var response = await put(uri, body: jsonEncode(params));
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

  static Future<String?> DELETE(String api) async{
    var uri = Uri.https(BASE, api);
    var response = await delete(uri);
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.body;
    }
    return null;
  }

    /*  Http Params  */

  static Map<String, String> paramsCreate(Employee employee) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': employee.employee_name!,
      'salary': employee.employee_salary!.toString(),
      'age': employee.employee_age!.toString(),
    });
    return params;
  }

  static Map<String, String> paramsUpdate(Employee employee) {
    Map<String, String> params = new Map();
    params.addAll({
      'name': employee.employee_name,
      'salary': employee.employee_salary.toString(),
      'age': employee.employee_age.toString(),
    });
    return params;
  }

  /* Http parsing */
  static EmpList parseEmpList(String response){
    dynamic json = jsonDecode(response);
    var data = EmpList.fromJson(json);
    return data;
  }
}
