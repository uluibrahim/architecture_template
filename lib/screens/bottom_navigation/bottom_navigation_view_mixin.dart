part of 'bottom_navigation_view.dart';

mixin BottomNavigationViewMixin on ScreenState<BottomNavigationScreen,
    BottomNavigationViewModel, BottomNavigationData> {
  late final TabController _tabController;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    viewModel.createPages(context);
  }

  Widget bottomBar(BottomNavigationData data) {
    return DefaultTabController(
      initialIndex: data.currentIndex,
      length: data.tabs.length,
      child: TabBar(
        indicatorColor: Colors.transparent,
        isScrollable: false,
        controller: _tabController,
        onTap: (value) {
          viewModel.changeCurrentIndex(value);
        },
        tabs: data.tabs.map((e) => e.tab).toList(),
      ),
    );
  }

  Widget tabBarView(List<Widget> screens) => TabBarView(
        controller: _tabController,
        children: screens,
      );
}
