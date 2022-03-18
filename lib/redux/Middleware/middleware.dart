import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:redux/redux.dart';
import 'package:redux_test/models/albums_model.dart';
import 'package:redux_test/models/comments_model.dart';
import 'package:redux_test/models/photo_model.dart';
import 'package:redux_test/models/posts_model.dart';
import 'package:redux_test/models/users_model.dart';
import 'package:redux_test/redux/actions.dart';
import 'package:redux_test/redux/app_state.dart';

class UsersMiddleware extends MiddlewareClass<AppState> {
  @override
  call(Store<AppState> store, action, next) {
    if (action is GetUsersAction) {
      getUser().then((value) => store.dispatch(LoadUsersAction(users: value)));
    } else if (action is GetPostAction) {
      getPost(id: action.id).then(
        (value) => store.dispatch(LoadPostAction(post: value)),
      );
    } else if (action is GetCommentsAction) {
      getComments(id: action.id)
          .then((value) => store.dispatch(LoadCommentsAction(comments: value)));
    } else if (action is GetAlbumsAction) {
      getAlbums(id: action.id)
          .then((value) => store.dispatch(LoadAlbumsAction(albums: value)));
    } else if (action is GetPhotoAction) {
      getPhotos(id: action.id)
          .then((value) => store.dispatch(LoadPhotoAction(photos: value)));
    }
    next(action);
  }

  Future getUser() async {
    const url = 'https://jsonplaceholder.typicode.com/users';
    final response = await http.get(Uri.parse(url));
    final decodedData = jsonDecode(response.body) as List<dynamic>;
    final List<UsersList> decodedResponse =
        decodedData.map((e) => UsersList.fromJson(e)).toList();
    return decodedResponse;
  }

  Future getPost({required int id}) async {
    var url = 'https://jsonplaceholder.typicode.com/posts?userId=$id';
    final response = await http.get(Uri.parse(url));
    final decodedData = jsonDecode(response.body) as List<dynamic>;
    final List<Post> decodedResponse =
        decodedData.map((e) => Post.fromJson(e)).toList();
    return decodedResponse;
  }

  Future getComments({required int id}) async {
    var url = 'https://jsonplaceholder.typicode.com/comments?postId=$id';
    final response = await http.get(Uri.parse(url));
    final decodedData = jsonDecode(response.body) as List<dynamic>;
    final List<Comments> decodedResponse =
        decodedData.map((e) => Comments.fromJson(e)).toList();
    return decodedResponse;
  }

  Future getAlbums({required int id}) async {
    var url = 'https://jsonplaceholder.typicode.com/albums?userId=$id';
    final response = await http.get(Uri.parse(url));
    final decodedData = jsonDecode(response.body) as List<dynamic>;
    final List<Albums> decodedResponse =
        decodedData.map((e) => Albums.fromJson(e)).toList();
    return decodedResponse;
  }

  Future getPhotos({required int id}) async {
    var url = 'https://jsonplaceholder.typicode.com/photos?albumId=$id';
    final response = await http.get(Uri.parse(url));
    final decodedData = jsonDecode(response.body) as List<dynamic>;
    final List<Photos> decodedResponse =
        decodedData.map((e) => Photos.fromJson(e)).toList();
    return decodedResponse;
  }
}
