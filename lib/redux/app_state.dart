import 'package:redux_test/models/albums_model.dart';
import 'package:redux_test/models/comments_model.dart';
import 'package:redux_test/models/photo_model.dart';
import 'package:redux_test/models/posts_model.dart';
import 'package:redux_test/models/users_model.dart';

class AppState {
  UsersState? usersState;
  PostState? postState;
  CommentsState? commentsState;
  AlbumState? albumState;
  PhotoState? photoState;

  AppState({
    this.usersState,
    this.postState,
    this.commentsState,
    this.albumState,
    this.photoState,
  });

  factory AppState.initial() => AppState(
        usersState: UsersState.initial(),
        postState: PostState.initial(),
        commentsState: CommentsState.initial(),
        albumState: AlbumState.initial(),
        photoState: PhotoState.initial(),
      );

  AppState copyWith({
    UsersState? usersState,
    PostState? postState,
    CommentsState? commentsState,
    AlbumState? albumState,
    PhotoState? photoState,
  }) {
    return AppState(
      usersState: usersState ?? this.usersState,
      postState: postState ?? this.postState,
      commentsState: commentsState ?? this.commentsState,
      albumState: albumState ?? this.albumState,
      photoState: photoState ?? this.photoState,
    );
  }
}

class UsersState {
  List<UsersList>? users;

  // int? userId;

  UsersState({
    this.users,
    // this.userId,
  });

  factory UsersState.initial() => UsersState(
        users: [],
      );

  UsersState copyWith({List<UsersList>? users, int? userId}) {
    return UsersState(
      users: users ?? this.users,
      // userId: userId ?? this.userId,
    );
  }
}

class PostState {
  List<Post> posts;

  PostState({required this.posts});

  factory PostState.initial() => PostState(posts: []);

  PostState copyWith({List<Post>? posts}) {
    return PostState(posts: posts ?? this.posts);
  }
}

class CommentsState {
  List<Comments> comments;

  CommentsState({required this.comments});

  factory CommentsState.initial() => CommentsState(comments: []);

  CommentsState copyWith({List<Comments>? comments}) {
    return CommentsState(comments: comments ?? this.comments);
  }
}

class AlbumState {
  final List<Albums> albums;

  AlbumState({required this.albums});

  factory AlbumState.initial() => AlbumState(albums: []);

  AlbumState copyWith({List<Albums>? albums}) {
    return AlbumState(albums: albums ?? this.albums);
  }
}

class PhotoState {
  final List<Photos> photos;

  PhotoState({required this.photos});

  factory PhotoState.initial() => PhotoState(photos: []);

  PhotoState copyWith({List<Photos>? photos}) {
    return PhotoState(photos: photos ?? this.photos);
  }
}
