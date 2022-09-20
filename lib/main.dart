import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(Home());
}

List<Map<String, dynamic>> datas = [
  {
    'pid': '0',
    'location': '신공학관',
    'image': 'assets/images/ara-1.jpg',
    'title': '신발',
    'likes': '0'
  },
  {
    'pid': '0',
    'location': '제2 공학관',
    'image': 'assets/images/ara-2.jpg',
    'title': '고기',
    'likes': '3'
  },
  {
    'pid': '0',
    'location': '신공학관',
    'image': 'assets/images/ara-3.jpg',
    'title': '치약',
    'likes': '2'
  },
  {
    'pid': '0',
    'location': '신공학관',
    'image': 'assets/images/ara-4.jpg',
    'title': '맥북',
    'likes': '0'
  },
  {
    'pid': '0',
    'location': '전동드릴',
    'image': 'assets/images/ara-5.jpg',
    'title': '신발',
    'likes': '0'
  },
  {
    'pid': '0',
    'location': '신공학관',
    'image': 'assets/images/ara-6.jpg',
    'title': '핸드폰',
    'likes': '0'
  },
  {
    'pid': '0',
    'location': '신공학관',
    'image': 'assets/images/ara-7.jpg',
    'title': '신발',
    'likes': '0'
  }
];


BottomNavigationBarItem _bottomNavigationBarItem(
    String iconName, String label) {
  return BottomNavigationBarItem(
    icon: Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: SvgPicture.asset('assets/svg/${iconName}_off.svg', width: 22),
    ),
    activeIcon: Padding(
      padding: EdgeInsets.only(bottom: 5.0),
      child: SvgPicture.asset('assets/svg/${iconName}_on.svg', width: 22),
    ),
    label: label,
  );
}

class DataListView extends StatelessWidget {
  const DataListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        itemBuilder: (BuildContext _context, int index) {
          return GestureDetector(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10.0),
                    ),
                    child: Hero(
                      tag: datas[index]['pid'],
                      child: Image.asset(
                        datas[index]['image'],
                        width: 100,
                        height: 100,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(left: 20.0),
                      height: 100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            datas[index]['title'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 15.0),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            datas[index]['location'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.black.withOpacity(0.3)),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '2000원',
                            style: TextStyle(fontWeight: FontWeight.w500),
                          ),
                          Expanded(
                            child: Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  SvgPicture.asset(
                                    'assets/svg/heart_off.svg',
                                    width: 13,
                                    height: 13,
                                  ),
                                  SizedBox(width: 5.0),
                                  Text(datas[index]['likes']),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (BuildContext _context, int index) {
          return Container(height: 1, color: Colors.black.withOpacity(0.1));
        },
        itemCount: datas.length);
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () {},
              child: PopupMenuButton<String>(
                offset: Offset(0, 38),
                onSelected: (String where) {},
                itemBuilder: (BuildContext context) {
                  return [
                    PopupMenuItem(value: '0', child: Text('안암동')),
                    PopupMenuItem(value: '1', child: Text('신설동')),
                    PopupMenuItem(
                      value: 'setting_neighborhood',
                      child: Text('내 동네 설정하기'),
                    ),
                  ];
                },
                child: Row(
                  children: [
                    Text(
                      '안암동',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                    Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: Colors.black,
                    )
                  ],
                ),
              ),
            ),
            elevation: 1.0,
            actions: [
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.search,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/svg/bell.svg',
                  width: 22,
                  color: Colors.black,
                ),
              ),
            ],
          ),
          body: DataListView(),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            selectedFontSize: 12.0,
            showSelectedLabels: true,
            selectedItemColor: Colors.black,
            selectedLabelStyle: TextStyle(color: Colors.black),
            items: [
              _bottomNavigationBarItem('home', '홈'),
              _bottomNavigationBarItem('notes', '동네생활'),
              _bottomNavigationBarItem('location', '내 근처'),
              _bottomNavigationBarItem('chat', '채팅'),
              _bottomNavigationBarItem('user', '나의 당근'),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {},
            backgroundColor: Colors.deepOrange,
            child: Icon(
              Icons.add,
            ),
          )),
    );
  }
}
