import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_test/redux/actions.dart';
import 'package:redux_test/redux/app_state.dart';
import 'package:redux_test/screens/album_page/photos_page.dart';
import 'package:redux_test/widgets/custom_listview.dart';

class AlbumPage extends StatelessWidget {
  final int id;

  const AlbumPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Альбомы'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: StoreConnector<AppState, AppState>(
        onInit: (store) {
          store.dispatch(GetAlbumsAction(id: id));
        },
        converter: (store) => store.state,
        builder: (context, vm) => ListView.builder(
            itemCount: store.state.albumState!.albums.length,
            itemBuilder: (ctx, i) => CustomListView(
                body: store.state.albumState!.albums[i].title!,
                title: store.state.albumState!.albums[i].id!.toString(),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => PhotosPage(
                            id: store.state.albumState!.albums[i].id!,
                          )));
                })),
      ),
    );
  }
}
