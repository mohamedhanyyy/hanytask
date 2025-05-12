import 'package:flutter/material.dart';

class CustomTabBarExample extends StatefulWidget {
  @override
  _CustomTabBarExampleState createState() => _CustomTabBarExampleState();
}

class _CustomTabBarExampleState extends State<CustomTabBarExample>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final tabs = ['Items', 'Pricing', 'Info', 'Tasks', 'Analytics'];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: 500,
      height: 150,
      child: Column(


          children: [
            Container(
              color: Colors.black,
              child: Row(
                children: [
                  Expanded(
                    child: TabBar(
                      dividerColor: Colors.transparent,
                      controller: _tabController,
                      isScrollable: true,
                      indicator: UnderlineTabIndicator(
                        borderSide: BorderSide(width: 1,color:  Color(0xffFFC268) ),
                        insets: EdgeInsets.symmetric(horizontal: 16.0),
                      ),
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.grey,
                      automaticIndicatorColorAdjustment: true,indicatorPadding: EdgeInsets.zero,
                      indicatorSize: TabBarIndicatorSize.tab,
                      labelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Colors.white),
                      unselectedLabelStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w500,color: Color(0xff999999)),
                      tabs: tabs.map((tab) => Tab(text: tab)).toList(),
                    ),
                  ),
                  VerticalDivider(color: Colors.grey, width: 1),

                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: tabs.map((tab) => Center(child: Text(tab))).toList(),
              ),
            ),

          ]),
    )
      ;
  }
}
