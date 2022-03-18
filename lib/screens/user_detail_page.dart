import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_test/redux/actions.dart';
import 'package:redux_test/redux/app_state.dart';
import 'package:redux_test/screens/album_page/album_page.dart';
import 'package:redux_test/screens/post_page/post_page.dart';

class UserDetailPage extends StatelessWidget {
  final int id;

  const UserDetailPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Выберите что-то'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Center(
        child: StoreConnector<AppState, AppState>(
          // onInit: (store) => ,
          converter: (store) => store.state,
          builder: (context, vm) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              button(
                  title: 'Посты',
                  onTap: () {
                    store.dispatch(
                      GetPostAction(id: id),
                    );
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => PostPage(id: id),
                      ),
                    );
                  }),
              button(
                  title: 'Альбомы',
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AlbumPage(id: id)));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

Widget button({
  required String title,
  required VoidCallback onTap,
}) {
  return ElevatedButton(
    onPressed: onTap,
    child: Text(
      title,
    ),
    style: ElevatedButton.styleFrom(primary: Colors.orange),
  );
}
