import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../enums/tab_enums.dart';

class TabModel extends Equatable {
  final String title;
  final Tab tab;
  final Widget screen;
  final TabPages tabId;

  const TabModel({
    required this.title,
    required this.tab,
    required this.screen,
    required this.tabId,
  });

  @override
  List<Object?> get props => [
        title,
        tab,
        screen,
        tabId,
      ];
}
