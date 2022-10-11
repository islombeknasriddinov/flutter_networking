import 'package:flutter/material.dart';
import 'package:flutter_networking/model/post_model.dart';
import 'package:flutter_networking/services/http_service.dart';

class HomePage extends StatefulWidget {
 static final String id = "home_page";

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var post = new Post(id: 1, title: "Islom", body: "lalal", userID: 1);

    _apiPostList();
    //_apiPostCreate(post);
    //_apiPostUpdate(post);
    //_apiPostDelete(post);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(data != null ? data! : "No Data"),
      ),
    );
  }

  void _apiPostList() {
    Network.GET(Network.API_LIST, Network.paramsEmpty()).then((response) => {
          print(response),
          _showResponse(response!),
        });
  }

  void _apiPostCreate(Post post) {
    Network.POST(Network.API_CREATE, Network.paramsCreate(post))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiPostUpdate(Post post) {
    Network.PUT(
            Network.API_UPDATE + post.id.toString(), Network.paramsUpdate(post))
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _apiPostDelete(Post post) {
    Network.DEL(Network.API_DELETE + post.id.toString(), Network.paramsEmpty())
        .then((response) => {
              print(response),
              _showResponse(response!),
            });
  }

  void _showResponse(String response) {
    setState(() {
      data = response;
    });
  }
}
