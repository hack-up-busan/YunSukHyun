import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NavBar extends StatelessWidget {
  final String string;
  const NavBar({super.key, required this.string});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextButton(
        style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15)),
        onPressed: () {},
        child: Text(
          string,
          style: TextStyle(
            fontSize: 17,
            color: Colors.grey[500],
          ),
        ),

      ),

    );
  }
}

class CurrentMoney extends StatelessWidget {
  final int money;
  final String profit;
  var f = NumberFormat('###,###');
  CurrentMoney({super.key, required this.money, required this.profit});
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        SizedBox(height: 10),
        Row(
            children: const [
              SizedBox(width: 10),
              Text('보유 주식',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18),
              ),
            ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(width: 10),
            Text(
              '${f.format(money)}원',
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.arrow_forward_ios_sharp),
              color: Colors.white,
              onPressed: () {},
              iconSize: 15,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[800],
              ),
            ),
          ],
        ),

        Row(
          children: [
            const SizedBox(width: 10),
            Text(
              profit,
              style: TextStyle(
                  color: Colors.blue[400],
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 0.5
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class StockPrice extends StatelessWidget {
  final String string;
  const StockPrice({super.key, required this.string});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
            onPressed: (){},
            child: Row(
              children: [
                CircleImg(img: string),

              ],
            ))
      ],
    );
  }
}

class Region extends StatelessWidget {
  final String region;
  const Region(this.region, {super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        const SizedBox(
          width: 20.0,
        ),
        Text(
          region,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 15,
              fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}

class MyStock extends StatelessWidget {
  final String name;
  final String img;
  final int cnt;
  final double price;
  final String profit;
  var f = NumberFormat('###,###');
  MyStock({
    super.key,
    required this.name,
    required this.img,
    required this.cnt,
    required this.price,
    required this.profit
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.black,
      child: ListTile(
        onTap: () {},
        trailing: Column(
          children: [
            Text('${f.format(price)}원',
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            Text(
              profit,
              style: TextStyle(
                  color: Colors.blue[600],
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
        leading: CircleImg(img: img),
        title: Text(
          name,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(
          '$cnt주',
          style: TextStyle(
              color: Colors.grey[600],
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class CircleImg extends StatelessWidget {
  final String img;
  const CircleImg({super.key, required this.img});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: AssetImage(img),
            )
        )
    );
  }
}

