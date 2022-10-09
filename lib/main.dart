import 'package:flutter/material.dart';
import 'custom.dart';

void main() {
  runApp(const Stock1());
}

class Stock1 extends StatelessWidget {
  const Stock1({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Colors.black),
        textTheme: const TextTheme(
          bodyText2: TextStyle(color: Colors.white),
        ),
      ),
      home: Scaffold(
        appBar: const Top(),
        body: ListView(
          children: [
            Column(
              children: [
                Row(
                  //crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    TossJunguan(),
                    Kospi(),
                  ],
                ),
                Row(
                  children: const [
                    NavBar(string:"내 주식"),
                    NavBar(string:"오늘의 발견"),
                  ],
                ),
                const Divider(
                  height: 5,
                  color: Colors.white,
                )
              ],
            ),
            Column(
              children: [
                CurrentMoney(money: 5542, profit: "-377원 (6.5%)"),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Row(
                          children: const [
                            Icon(
                              Icons.check_box,
                              color: Colors.grey,
                            ),
                            SizedBox(width: 4),
                            Text("현재가",
                            style:
                              TextStyle(color: Colors.grey),
                            ),
                          ],
                        )
                    )
                  ],
                ),
                const SizedBox(height: 2),
                const Region("국내"),
                MyStock(
                    name: "대한전선",
                    img: "assets/taihan.png",
                    cnt: 1,
                    price: 1505,
                    profit: "-30(1.9%)"
                ),
                const SizedBox(height: 2),
                const Region("해외"),
                MyStock(
                    name: "테슬라",
                    img: "assets/teslr.jpg",
                    cnt: 1,
                    price: 4037,
                    profit: "-347(7.9%)"
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: const Bottom()
      )
    );
  }
}

class Kospi extends StatelessWidget {
  const Kospi({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Expanded(child: SizedBox(
        child: Row(
          children: [
            Text("코스피",
              style: TextStyle(
                  fontSize: 11,
                  color: Colors.grey[500]
              ),
            ),
            const SizedBox(width: 5),
            const Text('2,237.86',
              style: TextStyle(
                  fontSize: 15,
                  color: Colors.red
              ),
            )
          ],
        ),
      )
    );
  }
}


class TossJunguan extends StatelessWidget {
  const TossJunguan({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(10, 0, 18, 0),
      child: const Text(
        "토스증권",
        style: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }
}


class Top extends StatelessWidget with PreferredSizeWidget {
  const Top({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AppBar(
      actionsIconTheme: IconThemeData(color: Colors.grey[700]),
      actions: const [
        Icon(Icons.lens),
        Icon(Icons.dangerous)
      ],
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class Bottom extends StatelessWidget {
  const Bottom({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: SizedBox(
          child: BottomNavigationBar(
            iconSize: 25,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey[600],
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
          ),
        )
    );
  }
}



