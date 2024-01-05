part of 'home_view.dart';

mixin HomeViewMixin on ScreenState<MyHomeScreen, HomeViewModel, HomeData> {
  @override
  bool get wantKeepAlive => true;

  final String title = "Title";
  void _incrementCounter() {
    viewModel.incrementCounter();
  }

  ElevatedButton get goToTemplateButton {
    return ElevatedButton(
      onPressed: () {
        viewModel.goToTemplateScreen(context);
      },
      child: const Text("Auto route test"),
    );
  }

  ElevatedButton get goToSettingsButton {
    return ElevatedButton(
      onPressed: () {
        viewModel.goToSettingsScreen(context);
      },
      child: const Text("Settings"),
    );
  }

  FloatingActionButton get incementButton {
    return FloatingActionButton(
      onPressed: _incrementCounter,
      tooltip: 'Increment',
      child: const Icon(Icons.add),
    );
  }

  Widget get titleSelector {
    return Selector<HomeData, HomeData>(
      builder: (_, data, __) {
        return data.appState == AppState.busy
            ? const CircularProgressIndicator()
            : Text(
                '${data.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              );
      },
      selector: (_, p1) => p1,
    );
  }

  Text get descripton => const Text(
        'You have pushed the button this many times:',
      );

  AppBar get appbar => AppBar(
        title: Text(context.locale.title),
      );
}
