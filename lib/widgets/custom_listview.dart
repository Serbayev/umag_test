import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomListView extends StatelessWidget {
  final String body;
  final String title;
  final VoidCallback onTap;

  const CustomListView({
    Key? key,
    required this.body,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: 100.h,
        padding: const EdgeInsets.all(5),
        margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        width: double.maxFinite,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.orange),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const Text(
                  'Название поста: ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.h),
            Flexible(
                child: Text(
              body,
              overflow: TextOverflow.fade,
            ))
          ],
        ),
      ),
    );
  }
}
