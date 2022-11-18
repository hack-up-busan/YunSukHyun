import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:toss2/appBarPage/calendar.dart';
import 'package:toss2/appBarPage/setting.dart';

class CurrentMoney extends StatelessWidget {
  final int money;
  final String profit;
  final f = NumberFormat('###,###');

  CurrentMoney({super.key, required this.money, required this.profit});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
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

class Stock extends StatelessWidget {
  final String img;
  final int curPrice;
  final double change;
  final f = NumberFormat("###,###");
  Stock({super.key, required this.img, required this.curPrice, required this.change});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            CircleImg(img: 'assets/$img.png'),
            Text(img)
          ],
        ),
        Column(
          children: [
            Text(
              "$change%",
              style: TextStyle(
                color: change > 0 ? Colors.red : Colors.blue
              ),
            ),
            Text('${f.format(curPrice)}원'),
          ],
        )
      ],
    );
  }
}

class ResponsiveBar extends StatefulWidget with PreferredSizeWidget {
  final List<String> list = List.generate(10, (index) => "Text $index");

  ResponsiveBar({super.key});

  @override
  State<ResponsiveBar> createState() => _ResponsiveBarState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _ResponsiveBarState extends State<ResponsiveBar>
    with TickerProviderStateMixin {
  late TabController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
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
              showSearch(context: context, delegate: Search(widget.list));
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
      bottom: TabBar(
        controller: _controller,
        tabs: const [
          Tab(text: "내 주식"),
          Tab(text: "오늘의 발견"),
        ],
        indicatorColor: Colors.white,

      ),
    );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.close),
        onPressed: () {
          query = "";
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  String selectedResult = "";

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(selectedResult),
    );
  }

  final List<String> listExample;

  Search(this.listExample);

  List<String> recentList = ["Text 4", "Text 3"];

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> suggestionList = [];
    query.isEmpty
        ? suggestionList = recentList //In the true case
        : suggestionList.addAll(listExample.where(
      // In the false case
          (element) => element.contains(query),
    ));
    return ListView.builder(
      itemCount: suggestionList.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(
            suggestionList[index],
          ),
          leading: query.isEmpty ? const Icon(Icons.access_time) : SizedBox(),
          onTap: () {
            selectedResult = suggestionList[index];
            showResults(context);
          },
        );
      },
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

