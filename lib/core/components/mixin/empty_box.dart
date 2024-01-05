import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

mixin EmptyBoxes {
  static Widget customEmptyBox({double? height, double? width}) => SizedBox(
        height: height != null ? (height.h) : null,
        width: width != null ? (width.w) : null,
      );

  static Widget get emptyBox4Vert => 4.verticalSpace;
  static Widget get emptyBox4Horz => 4.horizontalSpace;

  static Widget get emptyBox8Horz => 8.horizontalSpace;
  static Widget get emptyBox8Vert => 8.verticalSpace;

  static Widget get emptyBox10Vert => 10.0.verticalSpace;
  static Widget get emptyBox10Horz => 10.0.horizontalSpace;

  static Widget get emptyBox15Vert => 15.verticalSpace;
  static Widget get emptyBox15Horz => 15.horizontalSpace;

  static Widget get emptyBox20Vert => 20.0.verticalSpace;
  static Widget get emptyBox20Horz => 20.0.horizontalSpace;

  static Widget get emptyBox25Horz => 25.0.horizontalSpace;
  static Widget get emptyBox25Vert => 25.0.verticalSpace;

  static Widget get emptyBox30Horz => 30.0.horizontalSpace;
  static Widget get emptyBox30Vert => 30.0.verticalSpace;
}
