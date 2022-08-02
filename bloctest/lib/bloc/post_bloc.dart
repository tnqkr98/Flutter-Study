import 'package:bloctest/repository/posts_repository.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:bloctest/repository/model/post.dart';

part 'post_event.dart';

part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository postRepository;

  PostBloc({required this.postRepository}) : super(const PostState()) {
    on<GetPostEvent>(_onGetPost);
    on<CreatePostEvent>(_onCreatePost);
    on<DeletePostEvent>(_onDeletePost);
    on<EditPostEvent>(_onEditPost);
  }

  Future<void> _onGetPost(GetPostEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: () => PostStatus.loading));

    await postRepository.getPostList().then((value) => emit(state.copyWith(
          status: () => PostStatus.success,
          posts: () => value,
        )));

  }

  Future<void> _onCreatePost(
      CreatePostEvent event, Emitter<PostState> emit) async {
    emit(state.copyWith(status: () => PostStatus.loading));

    await postRepository
        .addPost(post: event.post)
        .then((value) => emit(state.copyWith(
              status: () => PostStatus.success,
            )));
  }

  Future<void> _onDeletePost(
      DeletePostEvent event, Emitter<PostState> emit) async {
    //
  }

  Future<void> _onEditPost(EditPostEvent event, Emitter<PostState> emit) async {
    //
  }
}
