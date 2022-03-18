import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux/redux.dart';
import 'package:redux_test/redux/Middleware/middleware.dart';
import 'package:redux_test/redux/actions.dart';
import 'package:redux_test/redux/app_state.dart';
import 'package:redux_test/redux/reducers.dart';
import 'package:redux_test/screens/user_page.dart';

void main() {
  final Store<AppState> store = Store(
    reducer,
    middleware: [UsersMiddleware()],
    initialState: AppState.initial(),
  );
  runApp(
    StoreProvider(
      store: store,
      child: ScreenUtilInit(
        designSize: const Size(360, 640),
        builder: () => MaterialApp(
          home: StoreConnector<AppState, AppState>(
            converter: (store) => store.state,
            onInit: (store) {
              store.dispatch(GetUsersAction());
            },
            builder: (context, state) => Scaffold(
              body: UserPage(users: store.state.usersState!.users!),
            ),
          ),
        ),
      ),
    ),
  );
}
