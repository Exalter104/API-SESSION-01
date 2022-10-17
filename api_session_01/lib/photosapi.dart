import 'dart:convert';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PhotosApi extends StatefulWidget {
  const PhotosApi({super.key});

  @override
  State<PhotosApi> createState() => _PhotosApiState();
}

class _PhotosApiState extends State<PhotosApi> {
  List<Photos> emptyPhoto = [];
  Future<List<Photos>> getPhotos() async {
    final respons = await http
        .get(Uri.parse("https://jsonplaceholder.typicode.com/photos"));
    var data = jsonDecode(respons.body.toString());
    if (respons.statusCode == 200) {
      for (var i in data) {
        Photos photos = Photos(title: i["title"], url: i["url"], id: i["id"]);
      }
      return emptyPhoto;
    } else {
      return emptyPhoto;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Photos {
  int id;
  String title, url;
  // ignore: empty_constructor_bodies
  Photos({required this.id, required this.title, required this.url});
}
