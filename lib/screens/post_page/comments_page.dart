import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_test/redux/actions.dart';
import 'package:redux_test/redux/app_state.dart';
import 'package:redux_test/widgets/custom_listview.dart';

class CommentsPage extends StatelessWidget {
  final int id;

  const CommentsPage({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Комментарии'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: StoreConnector<AppState, AppState>(
        onInit: (store) {
          store.dispatch(GetCommentsAction(id: id));
        },
        converter: (store) => store.state,
        builder: (context, vm) => ListView.builder(
            itemCount: store.state.commentsState!.comments.length,
            itemBuilder: (ctx, i) => CustomListView(
                body: store.state.commentsState!.comments[i].body!,
                title: store.state.commentsState!.comments[i].name!,
                onTap: () {})),
      ),
    );
  }
}
