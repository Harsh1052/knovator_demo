import 'package:flutter/material.dart';
import 'package:knovator_task/custom_widgets/post_tile.dart';
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
                  return PostTile(post: post,onTap: () {
                    postProvider.startTimer(index,force: true);
                    Navigator.pushNamed(context, '/detail',
                        arguments: {
                          'postId': post.id,
                          'provider': postProvider,
                        }).whenComplete((){ postProvider.markAsVisited(index);});
                  },);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
