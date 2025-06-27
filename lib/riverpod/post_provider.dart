

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../model/postModel.dart';
import '../services/postService.dart';

final postServiceProvider = Provider<PostService>((ref)=>PostService());


 final postsProvider=FutureProvider<List<PostModel>>((ref) async
 {
 final service=ref.read(postServiceProvider);
 return service.getPost();

 });