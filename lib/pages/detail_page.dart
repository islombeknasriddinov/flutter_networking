import 'package:flutter/material.dart';
import 'package:flutter_networking/model/emplist_model.dart';
import 'package:flutter_networking/model/employee_model.dart';
import 'package:flutter_networking/services/employee_service.dart';
import 'package:flutter_networking/services/http_service.dart';

class DetailPage extends StatefulWidget {
  static final String id = "detail_page";

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  List<Employee> items = [];

  void _apiEmpList() {
    HttpEmployee.GET(HttpEmployee.API_LIST)
        .then((response) => {
      print(response),
      _showResponse(response!),
    });
  }

  void _showResponse(String response) {
    EmpList empList = HttpEmployee.parseEmpList(response);
    setState(() {
      items = empList.data;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _apiEmpList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Employee List"),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, i) {
          return itemOfList(items[i]);
        },
      ),
    );
  }

  Widget itemOfList(Employee emp) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.only(bottom: 1),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(emp.employee_name+"("+emp.employee_age.toString()+")",style: TextStyle(color: Colors.black,fontSize: 20),),
          SizedBox(height: 10,),
          Text(emp.employee_salary.toString()+"\$",style: TextStyle(color: Colors.black,fontSize: 18),),
        ],
      ),
    );
  }

/*  void _apiGetSingle(Employee employee){
    HttpEmployee.GETSIngle(HttpEmployee.API_ITEM + employee.id.toString()).then((response) => {
      print(response!),
      _showResponse(response)
    });
  }

  void _apiCreate(Employee employee){
    HttpEmployee.POST(HttpEmployee.API_CREATE, HttpEmployee.paramsCreate(employee)).then((response) => {
      print(response!),
      _showResponse(response)
    });
  }

  void _apiUpdate(Employee employee){
    HttpEmployee.PUT(HttpEmployee.API_UPDATE + employee.id.toString(), HttpEmployee.paramsUpdate(employee)).then((response) => {
      print(response!),
      _showResponse(response)
    });
  }

  void _apiDelete(Employee employee){
    HttpEmployee.DELETE(HttpEmployee.API_ITEM + employee.id.toString()).then((response) => {
      print(response!),
      _showResponse(response)
    });
  }*/
}
