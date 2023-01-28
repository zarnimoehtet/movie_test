import 'package:flutter/material.dart';

class TabBarWidget extends StatefulWidget {
  const TabBarWidget({
    super.key,
    required this.tabs,
  });
  final List<String> tabs;
  @override
  State<TabBarWidget> createState() => _TabBarWidgetState();
}

class _TabBarWidgetState extends State<TabBarWidget> {
  int index = 0;
  List<Color> colorList = [
    Colors.red,
    Colors.green,
    Colors.blue,
    Colors.blueGrey
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        DefaultTabController(
            length: widget.tabs.length,
            child: Container(
              width: double.infinity,
              color: Colors.red,
              child: Column(
                children: [
                  TabBar(
                    onTap: (i) {
                      setState(() {
                        index = i;
                      });
                    },
                    labelColor: Colors.white,
                    indicatorColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    isScrollable: true,
                    tabs: widget.tabs
                        .map((tabsName) => Tab(
                              text: tabsName,
                            ))
                        .toList(),
                  ),
                  Container(
                    height: 130,
                    color: colorList[index],
                  ),
                ],
              ),
            )),
      ],
    );
  }
}
