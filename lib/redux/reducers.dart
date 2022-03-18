import 'package:redux_test/redux/actions.dart';
import 'package:redux_test/redux/app_state.dart';

AppState reducer(AppState state, dynamic action) {
  if (action is LoadUsersAction) {
    return state.copyWith(
      usersState: UsersState(users: action.users),
    );
  } else if (action is LoadPostAction) {
    return state.copyWith(
      postState: PostState(posts: action.post),
    );
  } else if (action is LoadCommentsAction) {
    return state.copyWith(
        commentsState: CommentsState(comments: action.comments));
  } else if (action is LoadAlbumsAction) {
    return state.copyWith(
      albumState: AlbumState(albums: action.albums),
    );
  } else if (action is LoadPhotoAction) {
    return state.copyWith(photoState: PhotoState(photos: action.photos));
  }
  return state;
}
