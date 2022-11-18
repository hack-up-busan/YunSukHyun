import 'package:flutter/material.dart';
import 'package:toss2/custom.dart';

class MyStock extends StatelessWidget {
  const MyStock({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
              const DrownDown()
            ],
          ),
        ),
        const SizedBox(height: 10,),
        Container(
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
        ),
        const SizedBox(height: 30),
        SizedBox(

          child: Column(
            children: const [
              Text("◆토스증권")
            ],
          ),
        )
      ],
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