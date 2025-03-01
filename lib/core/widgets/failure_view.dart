import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';


class FailureView extends StatelessWidget {
  final String onError;
  const FailureView({super.key, required this.onError});

  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Center(child: Text(onError,style: Styles.textStyle500.copyWith(fontSize: 14.sp),maxLines: 10,)),
      ],
    );
  }
}
