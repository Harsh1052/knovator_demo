import 'package:flutter/material.dart';
import 'package:knovator_task/providers/post_provider.dart';
import 'package:provider/provider.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final  post = ModalRoute.of(context)!.settings.arguments as Map<String,dynamic>;
    return ChangeNotifierProvider.value(
value: (post['provider'] as PostProvider)..getPostDetail(post['postId']),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Detail Screen'),
        ),
        body: Consumer<PostProvider>(
          builder: (context, postProvider, child) {
            if (postProvider.isDescriptionsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if(postProvider.error!=null){
              return Center(
                child: Text(postProvider.error!),
              );

            }else {
              return Column(
                children: [
                  Text(postProvider.selectedPost!.title),
                  Text(postProvider.selectedPost!.body),
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
