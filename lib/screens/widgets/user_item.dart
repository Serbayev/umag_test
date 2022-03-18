import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:redux_test/models/users_model.dart';
import 'package:redux_test/screens/user_detail_page.dart';

class UserItem extends StatefulWidget {
  final List<UsersList> users;

  const UserItem({
    Key? key,
    required this.users,
  }) : super(key: key);

  @override
  _UserItemState createState() => _UserItemState();
}

class _UserItemState extends State<UserItem> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.users.length,
      itemBuilder: (ctx, i) => InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => UserDetailPage(id: widget.users[i].id!),
            ),
          );
        },
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w),
          decoration: BoxDecoration(
              color: Colors.orange, borderRadius: BorderRadius.circular(20)),
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            _buildText(title: 'Имя', value: widget.users[i].name!),
            _buildText(title: 'Никнейм', value: widget.users[i].username!),
            _buildText(title: 'Email', value: widget.users[i].email!),
            _buildText(title: 'website', value: widget.users[i].website!),
            _buildText(
                title: 'Место работы', value: widget.users[i].company!.name!),
            const Expanded(child: SizedBox()),
            Container(
              height: 40.h,
              width: 40.w,
              margin: EdgeInsets.only(bottom: 20.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(100)),
              alignment: Alignment.center,
              child: Text(
                widget.users[i].id.toString(),
                style: TextStyle(fontSize: 34.h),
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buildText({
    required String title,
    required String value,
  }) {
    return Container(
      margin: const EdgeInsets.all(5),
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(
          title,
        ),
        Text(value),
      ]),
    );
  }
}
