import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

 final countNo=StateProvider<int>((ref)=> 0);

class Counterpage  extends ConsumerWidget{
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   final count=ref.watch(countNo);
   return Scaffold(
    appBar: AppBar(
      title: Text("Count"),
    ),
    body: Column(
      children: <Widget>[
      Text(count.toString()),
      ElevatedButton(onPressed: (){
        ref.read(countNo.notifier).state++;
      }, child: Text("count"))
      ],
    ),
   );
  }
  

}