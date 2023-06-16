import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HttpRequestDemo extends StatefulWidget {
  const HttpRequestDemo({super.key});

  @override
  State<HttpRequestDemo> createState() {
    return _HttpReqeustDemoState();
  }
}

class _HttpReqeustDemoState extends State<HttpRequestDemo> {
  late Future<Album> futureAlbum;

  Future<Album> fetchAlbum() async {
    final response =
        await http.get(Uri.parse('http://127.0.0.1:12140/api/personalized/'));
    if (response.statusCode == 200) {
      return Album(userId: 12, id: 12, title: 's');

      // return Album.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

  _load() {
    futureAlbum = fetchAlbum();
    const album = Album(userId: 123, id: 456, title: '123');

    print(json.encode(album));
    print(defaultTargetPlatform);
  }

  @override
  void initState() {
    super.initState();
    futureAlbum = fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Http Request')),
        body: Center(
          child: Column(children: [
            ElevatedButton(onPressed: _load, child: const Text('load data')),
            const SizedBox(height: 10),
            FutureBuilder(
                future: futureAlbum,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Text(snapshot.data!.title);
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  // By default, show a loading spinner.
                  return const CircularProgressIndicator();
                })
          ]),
        ));
  }
}

class Album {
  final int userId;
  final int id;
  final String title;
  const Album({
    required this.userId,
    required this.id,
    required this.title,
  });
  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() => <String, dynamic>{
        'userId': userId,
        'id': id,
        'title': title,
      };
}
