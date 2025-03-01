import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/styles.dart';

class EmptyView extends StatelessWidget {
  final String tittle;
  final String image;
  const EmptyView({super.key, required this.tittle, required this.image});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            tittle,
            style: Styles.textStyle700.copyWith(fontSize: 20.sp),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: MediaQuery.sizeOf(context).height*0.3,),
          SizedBox(
            height: MediaQuery.sizeOf(context).height*0.3,
            child: Image.asset(image,),
          ),
        ],
      ),
    );
  }
}
