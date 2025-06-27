import 'package:dio/dio.dart';
import 'package:flutter_river_pod/model/postModel.dart';

class PostService{
  final Dio _dio= Dio();
  Future<List<PostModel>> getPost() async
  {
    final response= await _dio.get('https://jsonplaceholder.typicode.com/posts');
    if(response.statusCode==200)
    {
      return (response.data as List).map((e)=> PostModel.jsonFrom(e)).toList();
    }
    throw Exception('Failed to load posts');
  }
  }