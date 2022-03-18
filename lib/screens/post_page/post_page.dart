import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_test/redux/actions.dart';
import 'package:redux_test/redux/app_state.dart';
import 'package:redux_test/screens/post_page/comments_page.dart';
import 'package:redux_test/widgets/custom_listview.dart';

class PostPage extends StatelessWidget {
  final int id;

  const PostPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Посты'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: StoreConnector<AppState, AppState>(
        onInit: (store) {
          store.dispatch(GetPostAction(id: id));
        },
        converter: (store) => store.state,
        builder: (context, vm) => ListView.builder(
          itemCount: store.state.postState!.posts.length,
          itemBuilder: (ctx, i) => CustomListView(
              title: store.state.postState!.posts[i].title!,
              body: store.state.postState!.posts[i].body!,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => CommentsPage(
                      id: store.state.postState!.posts[i].id!,
                    ),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
