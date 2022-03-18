import 'package:redux_test/models/albums_model.dart';
import 'package:redux_test/models/comments_model.dart';
import 'package:redux_test/models/photo_model.dart';
import 'package:redux_test/models/posts_model.dart';
import 'package:redux_test/models/users_model.dart';

class GetUsersAction {}

class LoadUsersAction {
  final List<UsersList> users;

  LoadUsersAction({required this.users});
}

class SaveIdAction {
  int id;

  SaveIdAction({required this.id});
}

class GetPostAction {
  final int id;

  GetPostAction({required this.id});
}

class LoadPostAction {
  final List<Post> post;

  LoadPostAction({required this.post});
}

class GetCommentsAction {
  final int id;

  GetCommentsAction({required this.id});
}

class LoadCommentsAction {
  final List<Comments> comments;

  LoadCommentsAction({required this.comments});
}

class GetAlbumsAction {
  final int id;

  GetAlbumsAction({required this.id});
}

class LoadAlbumsAction {
  final List<Albums> albums;

  LoadAlbumsAction({required this.albums});
}

class GetPhotoAction {
  final int id;

  GetPhotoAction({required this.id});
}

class LoadPhotoAction {
  final List<Photos> photos;

  LoadPhotoAction({required this.photos});
}
