import 'package:flutter/material.dart';

import '../models/post.dart';

class PostTile extends StatelessWidget {
  const PostTile({super.key,this.onTap,required this.post});
  final Post post;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: post.isVisited?Colors.white:Colors.pink,
      margin: const EdgeInsets.all(5),
      child: ListTile(
        trailing: Container(
          padding: const EdgeInsets.all(5),
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue,
          ),
          child: Center(child: Text(post.tick.toString()??'0',style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),)),
        ) ,
        key : post.key,
        title: Text(post.title),
        //subtitle: Text(postProvider.posts[index].body),
        onTap: onTap
      ),
    );
  }
}

