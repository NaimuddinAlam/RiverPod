import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../riverpod/post_provider.dart';

class PostListPage extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final postsAsync=ref.watch(postsProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text("Post"),
      ),
      body: Column(
        children: [
          ElevatedButton(onPressed: (){
 testAPI();
          }, child: Text("click")),
          postsAsync.when(
            data: (posts)=> ListView.builder(
              itemCount: posts.length,
          
              itemBuilder: (_,index){
                  final post = posts[index];
                return ListTile(
            title: Text(post.title),
                  subtitle: Text(post.body),
                );
              }),
             loading: () => const Center(child: CircularProgressIndicator()),
            error: (err, stack) => Center(child: Text('Error: $err'))),
        ],
      ),
    );
  }
  void testAPI() async {
  try {
    final dio = Dio();
    final response = await dio.get('https://jsonplaceholder.typicode.com/posts');

    print("Status: ${response.statusCode}");
    print("Data: ${response.data}");
  } catch (e) {
    print("Error: $e");
  }
}

}