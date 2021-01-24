import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(MaterialApp(home: App()));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Post Fetch App'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<Post>>(
        future: fetchPosts(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.data == null) return Text('Loading..');
          return ListView.builder(
            itemBuilder: (context, index) => Card(
              color: Colors.grey[700],
              margin: EdgeInsets.all(5),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${snapshot.data[index].id}',style: TextStyle(color: Colors.white54),),
                    SizedBox(height: 5,),
                    Text('${snapshot.data[index].title}',style: TextStyle(color: Colors.lightBlue),),
                    SizedBox(height: 10,),
                    Text('${snapshot.data[index].body}}',style: TextStyle(color: Colors.white70),)
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

Future<List<Post>> fetchPosts(http.Client client) async {
  final response = await client.get('https://jsonplaceholder.typicode.com/posts');

  final parsed = jsonDecode(response.body);

  return parsed
      .map<Post>((json) => Post(
            userId: json['userId'] as int,
            id: json['id'] as int,
            title: json['title'] as String,
            body: json['body'] as String,
          ))
      .toList();
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});
}
