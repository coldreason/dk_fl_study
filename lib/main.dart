import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(Home());
}

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selected = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: TrenbeAppbar(),
          body: TrenbeBody(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _selected,
            selectedFontSize: 12.0,
            showSelectedLabels: true,
            selectedItemColor: Colors.purple,
            selectedLabelStyle: TextStyle(color: Colors.black),
            onTap: (index) {
              setState(() {
                _selected = index;
              });
            },
            items: [
              _bottomNavigationBarItem(
                  Icons.category_outlined, Icons.category, '카테고리'),
              _bottomNavigationBarItem(
                  Icons.gif_box_outlined, Icons.gif_box, '동네생활'),
              _bottomNavigationBarItem(Icons.home_outlined, Icons.home, '홈'),
              _bottomNavigationBarItem(
                  Icons.shopping_bag_outlined, Icons.shopping_bag, '뉴시즌'),
              _bottomNavigationBarItem(
                  Icons.account_circle_outlined, Icons.account_circle, '마이'),
            ],
          ),
          floatingActionButton: FloatingButtonCustom()),
    );
  }
}

class TrenbeBody extends StatefulWidget {
  const TrenbeBody({Key? key}) : super(key: key);

  @override
  State<TrenbeBody> createState() => _TrenbeBodyState();
}

class _TrenbeBodyState extends State<TrenbeBody> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 6, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        children: [
          Expanded(child: TextField()),
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 22,
          )
        ],
      ),
      SizedBox(height: 20,),
      Container(
        child: TabBar(
          tabs: [
            TabBarTab(name: '홈'),
            TabBarTab(name: '기획전'),
            TabBarTab(name: '랭킹'),
            TabBarTab(name: '브랜드'),
            TabBarTab(name: 'IT:EM'),
            TabBarTab(name: '매거진'),
          ],
          labelColor: Colors.black,
          unselectedLabelColor: Colors.grey,
          controller: _tabController,
          indicatorWeight: 0.1,
        ),
      ),
      SizedBox(height: 20,),
      Expanded(
        child: TabBarView(
          controller: _tabController,
          children: [
            Container(
                color: Colors.white,
                alignment: Alignment.center,
                child: Column(
                  children: [
                    Container(
                        width: double.infinity,
                        height: 200,
                        child: Image.asset(
                          'assets/images/home_img_1.jpg',
                          fit: BoxFit.fill,
                        )),
                    SizedBox(height: 30,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                      ],
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                        MainButton(imagesrc: 'assets/images/images.jpg',text: '여성',),
                      ],
                    ),
                  ],
                )),
            Container(
              color: Colors.green[200],
              alignment: Alignment.center,
              child: Text(
                'Tab2 View',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              color: Colors.red[200],
              alignment: Alignment.center,
              child: Text(
                'Tab3 View',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              color: Colors.yellow[200],
              alignment: Alignment.center,
              child: Text(
                'Tab4 View',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              color: Colors.purple[200],
              alignment: Alignment.center,
              child: Text(
                'Tab5 View',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
            Container(
              color: Colors.cyan[200],
              alignment: Alignment.center,
              child: Text(
                'Tab6 View',
                style: TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ],
        ),
      ),
    ]);
  }

}

class MainButton extends StatelessWidget {
  const MainButton({Key? key, required this.text, required this.imagesrc}) : super(key: key);


  final String text;
  final String imagesrc;
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: () {},
        child: Column(
          children: [
            Container(
                width: 50,
                height: 50,
                child: Image.asset(
                  imagesrc,
                  fit: BoxFit.fill,
                )),
            Text(text)
          ],
        ));
  }
}


class TabBarTab extends StatelessWidget {
  const TabBarTab({Key? key, required this.name}) : super(key: key);
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,
      alignment: Alignment.center,
      child: Text(
        name,
      ),
    );
  }
}

class TrenbeAppbar extends StatelessWidget with PreferredSizeWidget {
  const TrenbeAppbar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      automaticallyImplyLeading: false,
      title: SvgPicture.asset(
        'assets/svg/header_logo.svg',
        width: 100,
      ),
      elevation: 1.0,
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/svg/heart-svgrepo-com.svg',
            width: 22,
            color: Colors.black,
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.shopping_bag_outlined,
            color: Colors.black,
          ),
        ),
      ],
    );
    ;
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

BottomNavigationBarItem _bottomNavigationBarItem(
    IconData iconStatic, IconData iconActive, String label) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Icon(iconStatic),
    ),
    activeIcon: Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: Icon(iconActive),
    ),
    label: label,
  );
}

class FloatingButtonCustom extends StatelessWidget {
  const FloatingButtonCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      backgroundColor: Colors.white,
      child: Icon(
        Icons.keyboard_arrow_up_sharp,
        size: 30,
        color: Colors.grey,
      ),
    );
  }
}
