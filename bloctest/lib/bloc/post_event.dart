
part of 'post_bloc.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();
}

class GetPostEvent extends PostEvent{
  const GetPostEvent();
  @override
  List<Object?> get props => [];
}

class CreatePostEvent extends PostEvent {
  final Post post;  // 추가하는 대상을 가지고 있는 이벤트

  const CreatePostEvent({required this.post});

  @override
  List<Object?> get props => [post];
}

class DeletePostEvent extends PostEvent {
  final Post post;  // 지울 대상을 가지고 있는 이벤트

  const DeletePostEvent({required this.post});

  @override
  List<Object?> get props => [post];
}

class EditPostEvent extends PostEvent {
  final Post post;  // 수정할 대상을 가지고 있는 이벤트

  const EditPostEvent({required this.post});

  @override
  List<Object?> get props => [post];
}
