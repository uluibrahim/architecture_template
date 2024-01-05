import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/state_data.dart';
import '../view_model/view_model.dart';
import '../view_model/view_model_factory.dart';

abstract class Screen extends StatefulWidget {
  const Screen({Key? key}) : super(key: key);

  @override
  ScreenState createState();
}

abstract class ScreenState<T extends Screen, T2 extends ViewModel<T3>,
    T3 extends StateData> extends State<T> with AutomaticKeepAliveClientMixin {
  ScreenState();
  late final T2 viewModel;

  Widget buildScreen(BuildContext context);
  void autoKeep() {}

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return MultiProvider(
      providers: [
        ValueListenableProvider<T3>.value(value: viewModel),
      ],
      builder: (context, _) => buildScreen(context),
    );
  }

  @override
  @mustCallSuper
  void initState() {
    super.initState();
    viewModel = context.read<ViewModelFactory>().create<T2>();
  }

  @override
  @mustCallSuper
  void dispose() {
    viewModel.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => false;
}
