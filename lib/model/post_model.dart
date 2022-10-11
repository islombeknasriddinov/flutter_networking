class Post{
  int? id;
  String? title;
  String? body;
  int? userID;

  Post({this.id, this.title, this.body, this.userID});

  Post.fromJson(Map<String, dynamic>? json)
      : id = json!['id'],
        title = json['title'],
        body = json['body'],
        userID = json['userID'];

  Map<String, dynamic>? toJson() => {
    'id' : id,
    'title' : title,
    'body' : body,
    'userID' : userID
  };
}