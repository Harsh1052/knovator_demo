import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/post_provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => PostProvider(context),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home Screen'),
        ),
        body: Consumer<PostProvider>(
          builder: (context, postProvider, child) {
            if (postProvider.isLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return ListView.separated(
                controller:postProvider.scrollController,
                separatorBuilder: (context, index) => const Divider(),
                itemCount: postProvider.posts.length,
                itemBuilder: (context, index) {

                  final post = postProvider.posts[index];
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
                      onTap: () {
                        postProvider.startTimer(index,force: true);
                        Navigator.pushNamed(context, '/detail',
                            arguments: {
                          'postId': post.id,
                            'provider': postProvider,
                            }).whenComplete((){ postProvider.markAsVisited(index);});
                      },
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
