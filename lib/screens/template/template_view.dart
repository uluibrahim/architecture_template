import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../core/screen/screen.dart';
import 'template_data.dart';
import 'template_view_model.dart';

part 'template_view_mixin.dart';

@RoutePage()
class TemplateScreen extends Screen {
  const TemplateScreen({Key? key}) : super(key: key);

  @override
  TemplateScreenState createState() => TemplateScreenState();
}

class TemplateScreenState
    extends ScreenState<TemplateScreen, TemplateViewModel, TemplateData>
    with TemplateViewMixin {
  @override
  Widget buildScreen(BuildContext context) {
    return Scaffold(
      appBar: appbar,
      body: body,
    );
  }
}
