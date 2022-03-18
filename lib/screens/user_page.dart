import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux_test/models/users_model.dart';
import 'package:redux_test/screens/widgets/user_item.dart';

class UserPage extends StatelessWidget {
  final List<UsersList> users;

  const UserPage({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 30.h),
        child: UserItem(users: users),
      ),
    );
  }
}
