import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:redux_test/redux/actions.dart';
import 'package:redux_test/redux/app_state.dart';
import 'package:redux_test/screens/album_page/photo_view.dart';

class PhotosPage extends StatelessWidget {
  final int id;

  const PhotosPage({
    Key? key,
    required this.id,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Store<AppState> store = StoreProvider.of<AppState>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text('Фотографии'),
      ),
      backgroundColor: Colors.orangeAccent,
      body: StoreConnector<AppState, AppState>(
        converter: (store) => store.state,
        onInit: (store) {
          store.dispatch(GetPhotoAction(id: id));
        },
        builder: (context, vm) => GridView.builder(
            itemCount: store.state.photoState!.photos.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              childAspectRatio: 1 / 1,
              // mainAxisExtent: 5,
              // crossAxisSpacing: 5,
            ),
            itemBuilder: (ctx, i) => InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => PhotoView(
                          image: store.state.photoState!.photos[i].url!)));
                },
                child:
                    _buildGrid(image: store.state.photoState!.photos[i].url!))),
      ),
    );
  }

  Widget _buildGrid({
    required String image,
  }) {
    return Container(
      margin: const EdgeInsets.all(5),
      child: Image.network(
        image,
      ),
    );
  }
}
