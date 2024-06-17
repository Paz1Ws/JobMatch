import 'package:flutter/material.dart';

class TabsPage extends StatefulWidget {
  const TabsPage({super.key, required this.title});
  final String title;
  @override
  _TabsPageState createState() => _TabsPageState();
}

class _TabsPageState extends State<TabsPage>
    with SingleTickerProviderStateMixin {
  final List<Widget> _tabs = [
    const Center(child: Icon(Icons.chat_bubble_outline)),
    const Center(
      child: Icon(Icons.location_searching_sharp),
    ),
  ];

  late TabController _controller;
  int _newIndex = 0;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 3, vsync: this);
    _controller.addListener(() {
      _newIndex = _controller.index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          TabBarView(
            controller: _controller,
            children: _tabs,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 56,
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 0,
                    blurRadius: 4,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: TabBar(
                  indicatorColor: Colors.transparent,
                  tabs: [
                    _newIndex == 0
                        ? Container(
                            height: 46,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Text(
                                'Discover',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          )
                        : const Tab(
                            icon: Icon(
                              Icons.location_searching_sharp,
                              color: Colors.grey,
                            ),
                          ),
                    _newIndex == 1
                        ? Container(
                            height: 46,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Text(
                                'Chat',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          )
                        : const Tab(
                            icon: Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.grey,
                            ),
                          ),
                    _newIndex == 2
                        ? Container(
                            height: 46,
                            width: 100,
                            decoration: BoxDecoration(
                              color: Colors.deepOrange.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: const Center(
                              child: Text(
                                'User',
                                style: TextStyle(
                                  color: Colors.deepOrange,
                                ),
                              ),
                            ),
                          )
                        : const Tab(
                            icon: Icon(
                              Icons.person,
                              color: Colors.grey,
                            ),
                          ),
                  ],
                  onTap: (index) {
                    setState(() {
                      _newIndex = index;
                    });
                  },
                  controller: _controller,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
