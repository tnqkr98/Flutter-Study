part of 'post_bloc.dart';

enum PostStatus { initial, loading, success, failure }

class PostState extends Equatable {
  const PostState({
    this.status = PostStatus.initial,
    this.posts = const []
  });

  final PostStatus status;
  final List<Post> posts;

  PostState copyWith({
    PostStatus Function()? status,
    List<Post> Function()? posts,
  }) {
    return PostState(
      status: status != null ? status(): this.status,
      posts: posts != null ? posts(): this.posts,
    );
}

  @override
  List<Object> get props => [
    status,
    posts
  ];
}
