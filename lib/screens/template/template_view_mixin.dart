part of 'template_view.dart';

mixin TemplateViewMixin
    on ScreenState<TemplateScreen, TemplateViewModel, TemplateData> {
  AppBar get appbar => AppBar(
        title: const Text("Template Screen"),
      );

  Widget get body => const Center(child: Text("Template Screen"));
}
