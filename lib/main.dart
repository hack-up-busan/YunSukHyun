import 'package:flutter/material.dart';
import 'package:toss2/Tabbar/MyStock.dart';
import 'package:toss2/appBarPage/calendar.dart';
import 'package:toss2/appBarPage/setting.dart';
import 'custom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();

}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin{
  List stockInfo = [["테슬라", 98907, 1.6], ["대한전선", 8812, -2.1]];
  bool _down = false;
  late TabController _controller;
  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black12,
        appBarTheme: const AppBarTheme(color: Colors.black12),
        textTheme: const TextTheme(bodyText2: TextStyle(color: Colors.white)),
      ),
      home: Scaffold(
        appBar: AppBar(
            actionsIconTheme: IconThemeData(color: Colors.grey[600]),
            title: Row(
              children: [
                Container(
                  padding: const EdgeInsets.fromLTRB(10, 30, 18, 0),
                  child: const Text(
                    "토스증권",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.only(top: 30),
                    child: Row(
                      children: [
                        Text(
                          "코스피",
                          style: TextStyle(fontSize: 11, color: Colors.grey[500]),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          '2,237.86',
                          style: TextStyle(fontSize: 15, color: Colors.red),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context, delegate: Search(["good"]));
                  },
                  icon: const Icon(Icons.search)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const CalendarPage()));
                  },
                  icon: const Icon(Icons.calendar_month)),
              IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const SettingPage()));
                  },
                  icon: const Icon(Icons.settings)),
            ],
          ),
          body: ListView(
            shrinkWrap: true,
            children: [
              DefaultTabController(
                  length: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: const [
                      TabBar(
                        indicatorColor: Colors.white,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Tab(text: '내 주식'),
                          Tab(text: '오늘의 발견'),
                        ],
                      ),


                    ],
                  ),
              ),


              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      CurrentMoney(money: 5542, profit: "-377원 (6.5%)"),
                      const SizedBox(width: 100,),
                      ElevatedButton(
                        onPressed: (){

                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.grey
                        ),
                        child: const Text("총 자산보기"),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    color: Colors.grey[800],
                    height: 115,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            const Text(
                              "관심주식",
                              style:
                              TextStyle(color: Colors.white, fontSize: 20),
                            ),
                            const Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                "편집하기",
                                style:
                                TextStyle(color: Colors.grey, fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        //const DrownDown(),
                        GestureDetector(
                          onTap: (){
                            setState(() {
                              // Toggle light when tapped.
                              _down = !_down;
                            });
                          },
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              const Text("기본", style: TextStyle(fontSize: 15),),
                              const Spacer(),
                              Icon(
                                _down ? Icons.arrow_downward : Icons.arrow_upward,
                                color: Colors.grey[400],
                              ),
                              const SizedBox(width: 10,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Visibility(
                    visible: !_down,
                    child: Column(
                      children: [
                        Stock(
                          img: stockInfo[0][0],
                          curPrice: 98907,
                          change: 1.6,
                        ),
                        const SizedBox(height: 10),
                        Stock(
                          img: "대한",
                          curPrice: 8812,
                          change: -2.1,
                        ),
                        const SizedBox(height: 10),
                        CircleImg(img: "assets/플러스.png"),
                      ],
                    ),
                  ),
                  const SizedBox(height: 10,),
                  const PopularStock(),
                  const SizedBox(height: 30),
                  SizedBox(
                    child: Column(
                      children: const [
                        Text("◆토스증권")
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        bottomNavigationBar: const Bottom(),
      ),
    );
  }
}

class PopularStock extends StatelessWidget {
  const PopularStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      color: Colors.grey[800],
      child: Row(
        children: [
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 13),
              RichText(
                text: const TextSpan(
                  text: ' 지금 다른 사람들이 \n 눈여겨 보는 주식은?',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              TextButton(
                  onPressed: (){

                  },
                  child: const Text("실시간 인기 주식 보기 >"))
            ],
          ),
          const SizedBox(width: 130,),
          const CircleImg(img: "assets/qm.png")
        ],
      ),
    );
  }
}

class DrownDown extends StatefulWidget {
  const DrownDown({Key? key}) : super(key: key);

  @override
  State<DrownDown> createState() => _DrownDownState();
}

class _DrownDownState extends State<DrownDown> {
  bool _down = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        setState(() {
          // Toggle light when tapped.
          _down = !_down;
        });
      },
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          const Text("기본", style: TextStyle(fontSize: 15),),
          const Spacer(),
          Icon(
            _down ? Icons.arrow_downward : Icons.arrow_upward,
            color: Colors.grey[400],
          ),
          const SizedBox(width: 10,)
        ],
      ),
    );
  }
}




class Bottom extends StatefulWidget {
  const Bottom({Key? key}) : super(key: key);
  @override
  State<Bottom> createState() => _BottomState();
}

class _BottomState extends State<Bottom> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SizedBox(
          child: BottomNavigationBar(
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: '홈',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.diamond),
                label: '혜택',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.money),
                label: '송금',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.factory),
                label: '주식',
                backgroundColor: Colors.black,
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.menu),
                label: '전체',
                backgroundColor: Colors.black,
              ),
            ],
            iconSize: 25,
            unselectedItemColor: Colors.grey[400],
            currentIndex: _selectedIndex,
            selectedItemColor: Colors.white,
            onTap: _onItemTapped,
          ),
        )
    );
  }
}
