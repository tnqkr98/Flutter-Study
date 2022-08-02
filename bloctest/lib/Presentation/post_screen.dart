import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/post_bloc.dart';
import '../repository/posts_repository.dart';

class PostReviewPage extends StatelessWidget {
  const PostReviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PostBloc(
        postRepository: context.read<PostRepository>(),
      )..add(const GetPostEvent()),
      child: const PostView(),
    );
  }
}

class PostView extends StatelessWidget {
  const PostView({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
        listeners: [
          BlocListener<PostBloc, PostState>(
            listenWhen: (previous, current) =>
                previous.status != current.status,
            listener: (context, state) {
              if (state.status == PostStatus.failure) {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    const SnackBar(
                      content: Text("Loading Fail"),
                    ),
                  );
              }
            },
          ),
        ],
        child: BlocBuilder<PostBloc, PostState>(
          builder: (context, state) {
            return CupertinoScrollbar(
                child: ListView(
              children: [
                for (final post in state.posts)
                  ListTile(
                    title: Text(post.title),
                    subtitle: Text(post.body),
                  )
              ],
            ));
          },
        ));
  }
}
