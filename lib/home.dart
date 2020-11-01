import 'package:flutter/material.dart';

import 'tab_button.dart';
import 'tab_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedPage = 0;
  PageController _pageController;

  void _changePage(int page) {
    setState(() {
      _selectedPage = page;
      _pageController.animateToPage(page,
          duration: Duration(milliseconds: 500),
          curve: Curves.fastLinearToSlowEaseIn);
    });
  }

  @override
  void initState() {
    _pageController = PageController();
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('تب بار سفارشی'),
          centerTitle: true,
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TabButton(
                      name: 'تب اول',
                      pageNumber: 0,
                      selectedPage: _selectedPage,
                      onTap: () => _changePage(0),
                    ),
                    TabButton(
                      name: 'تب دوم',
                      pageNumber: 1,
                      selectedPage: _selectedPage,
                      onTap: () => _changePage(1),
                    ),
                    TabButton(
                      name: 'تب سوم',
                      pageNumber: 2,
                      selectedPage: _selectedPage,
                      onTap: () => _changePage(2),
                    ),
                  ],
                ),
              ),
              Expanded(
                  child: PageView(
                controller: _pageController,
                onPageChanged: (int page) {
                  setState(() {
                    _selectedPage = page;
                  });
                },
                children: [
                  TabPage(txt: 'صفحه اول'),
                  TabPage(txt: 'صفحه دوم'),
                  TabPage(txt: 'صفحه سوم'),
                ],
              ))
            ],
          ),
        ),
      ),
    );
  }
}
