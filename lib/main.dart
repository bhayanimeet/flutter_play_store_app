import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_1_2/views/res/global.dart';

void main() {
  runApp(
    const myApp(),
  );
}

class myApp extends StatefulWidget {
  const myApp({Key? key}) : super(key: key);

  @override
  State<myApp> createState() => _myAppState();
}

class _myAppState extends State<myApp> with SingleTickerProviderStateMixin {
  int currentPage = 0;
  DateTime currentTime = DateTime.now();
  List days = [
    'MONDAY',
    'TUESDAY',
    'WEDNESDAY',
    'THURSDAY',
    'FRIDAY',
    'SATURDAY',
    'SUNDAY',
  ];
  List months = [
    'JANUARY',
    'FEBRUARY',
    'MARCH',
    'APRIL',
    'MAY',
    'JUNE',
    'JULY',
    'AUGUST',
    'SEPTEMBER',
    'OCTOBER',
    'NOVEMBER',
    'DECEMBER',
  ];
  late TabController tabController;
  PageController pageController = PageController();
  int currentIndex = 0;
  bool isTrue = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(vsync: this, length: 4);
  }

  @override
  Widget build(BuildContext context) {
    return (Global.isIos)
        ? MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Scaffold(
              resizeToAvoidBottomInset: false,
              appBar: AppBar(
                backgroundColor: Colors.white,
                elevation: 1,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 40),
                  child: SizedBox(
                    height: 55,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Search for apps & games",
                        prefixIcon: const Icon(Icons.menu),
                        suffixIcon: const Icon(Icons.keyboard_voice),
                      ),
                    ),
                  ),
                ),
                toolbarHeight: 65,
                bottom: TabBar(
                  controller: tabController,
                  onTap: (val) {
                    setState(() {
                      pageController.animateToPage(val,
                          duration: const Duration(milliseconds: 500),
                          curve: Curves.bounceInOut);
                    });
                  },
                  isScrollable: true,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Tab(
                      child: Text(
                        "For you",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Top Charts",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Categories",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    Tab(
                      child: Text(
                        "Editor's choice",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              body: PageView(
                controller: pageController,
                onPageChanged: (val) {
                  setState(() {
                    tabController.animateTo(val);
                    currentIndex = val;
                  });
                },
                children: [
                  Container(
                    color: Colors.white,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("Recommended for you",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                                Icon(Icons.arrow_forward, color: Colors.black),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...Global.apps.map(
                                  (e) => Container(
                                    height: 160,
                                    width: 120,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    color: Colors.white,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            color: Colors.white,
                                            child: Image.asset(
                                              e['image'],
                                              fit: BoxFit.fill,
                                            )),
                                        Text("${e['name']}"),
                                        Row(
                                          children: [
                                            Text("${e['star']} "),
                                            const Icon(
                                                Icons.star_border_outlined,
                                                size: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: const [
                                Text("New & Updated apps",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18)),
                                Icon(Icons.arrow_forward, color: Colors.black),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...Global.newApps.map(
                                  (e) => Container(
                                    height: 160,
                                    width: 120,
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            color: Colors.white,
                                            child: Image.asset(
                                              e['image'],
                                              fit: BoxFit.fill,
                                            )),
                                        Text("${e['name']}"),
                                        Row(
                                          children: [
                                            Text("${e['star']} "),
                                            const Icon(
                                                Icons.star_border_outlined,
                                                size: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      height: 20,
                                      width: 40,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border: Border.all(
                                            color: Colors.grey.shade300,
                                            width: 1),
                                      ),
                                      child: const Text(
                                        "Ads",
                                      ),
                                    ),
                                    const SizedBox(width: 5),
                                    const Text("Suggested for you",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18)),
                                  ],
                                ),
                                const Icon(Icons.arrow_forward,
                                    color: Colors.black),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                ...Global.suggestion.map(
                                  (e) => Container(
                                    height: 160,
                                    width: 120,
                                    color: Colors.white,
                                    padding: const EdgeInsets.only(
                                        left: 10, right: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                            height: 100,
                                            width: 100,
                                            color: Colors.white,
                                            child: Image.asset(
                                              e['image'],
                                              fit: BoxFit.fill,
                                            )),
                                        Text("${e['name']}"),
                                        Row(
                                          children: [
                                            Text("${e['star']} "),
                                            const Icon(
                                                Icons.star_border_outlined,
                                                size: 10),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.white,
                    child: Column(
                      children: [
                        const SizedBox(height: 10),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text("Show installed apps"),
                              Switch(
                                  value: isTrue,
                                  onChanged: (val) {
                                    setState(() {
                                      isTrue = val;
                                    });
                                  }),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  height: 30,
                                  width: 80,
                                  margin: const EdgeInsets.only(left: 10, right: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text("Top free"),
                                ),
                                Container(
                                  height: 30,
                                  width: 110,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text("Top grossing"),
                                ),
                                Container(
                                  height: 30,
                                  width: 90,
                                  margin: const EdgeInsets.only(left: 10,right: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text("Trending"),
                                ),
                                Container(
                                  height: 30,
                                  width: 120,
                                  margin: const EdgeInsets.only(right: 10),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: const Text("Top picks"),
                                ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),

                      ],
                    ),
                  ),
                  const Center(
                    child: CircularProgressIndicator(
                        color: Colors.blue, strokeWidth: 4),
                  ),
                  const Center(
                    child: CircularProgressIndicator(
                        color: Colors.blue, strokeWidth: 4),
                  ),
                ],
              ),
              bottomNavigationBar: BottomNavigationBar(
                currentIndex: currentIndex,
                unselectedItemColor: Colors.grey,
                selectedItemColor: Colors.green,
                onTap: (val) {
                  setState(() {
                    currentIndex = val;
                    pageController.animateToPage(val,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.bounceInOut);
                    tabController.animateTo(val);
                  });
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view_sharp),
                    label: "Apps",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.sports_esports),
                    label: "Games",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.movie),
                    label: "Movies & tv",
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.book_online_rounded),
                    label: "Books",
                  ),
                ],
              ),
            ),
          )
        : CupertinoApp(
            debugShowCheckedModeBanner: false,
            home: CupertinoPageScaffold(
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  IndexedStack(
                    index: currentPage,
                    children: [
                      Container(
                        color: Colors.white,
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                padding: const EdgeInsets.only(bottom: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "${days[currentTime.weekday - 1]}, ${months[currentTime.month - 1]} ${currentTime.day}",
                                      style: const TextStyle(
                                        fontSize: 13,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w600,
                                        letterSpacing: 0.5,
                                        decoration: TextDecoration.none,
                                      ),
                                    ),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Today",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.blue,
                                          backgroundImage: AssetImage(
                                              'assets/images/profile.jpg'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Container(
                                height: 460,
                                width: 500,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      offset: const Offset(-1, 1),
                                      spreadRadius: 4,
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(
                                    'assets/images/game.jpg',
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 20),
                              Container(
                                height: 460,
                                width: 500,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  image: const DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      'assets/images/game2.jpg',
                                    ),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade400,
                                      spreadRadius: 4,
                                      offset: const Offset(-1, 1),
                                      blurRadius: 10,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 15, right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(""),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Games",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.blue,
                                          backgroundImage: AssetImage(
                                              'assets/images/profile.jpg'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 2,
                                width: 380,
                                margin: const EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 20),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "NEW GAME",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          const Text(
                                            "Warhammer AoS : Realm War",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            "Compete in thrilling battles",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 250,
                                            width: 360,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/game3.jpg'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "NEW GAME",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          const Text(
                                            "New Car Racing game",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            "Compete in less time and win",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 250,
                                            width: 360,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/game4.jpg'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("Discover AR Gaming",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900)),
                                    Text(
                                      "See All",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        height: 120,
                                        width: 360,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 110,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/pool.jpg'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 3),
                                                const Text(
                                                  "King of Pool",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                const Text(
                                                  "Ultimate AR Pool",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const SizedBox(height: 14),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 70,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade400,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(17.5),
                                                      ),
                                                      child: const Text(
                                                        "Get",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    const Text(
                                                      "In-App\nPurchases",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        height: 120,
                                        width: 360,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 110,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/race.jpg'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 3),
                                                const Text(
                                                  "Real Racing",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                const Text(
                                                  "Ultimate Car Racing",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const SizedBox(height: 14),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 70,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade400,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(17.5),
                                                      ),
                                                      child: const Text(
                                                        "Get",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    const Text(
                                                      "In-App\nPurchases",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        height: 120,
                                        width: 360,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 110,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/wcc.jpg'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 3),
                                                const Text(
                                                  "World Cricket Championship",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                const Text(
                                                  "Extreme cricket experience",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const SizedBox(height: 14),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 70,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade400,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(17.5),
                                                      ),
                                                      child: const Text(
                                                        "Get",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    const Text(
                                                      "In-App\nPurchases",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        height: 120,
                                        width: 360,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 110,
                                              width: 110,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/shoot.jpg'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                const SizedBox(height: 3),
                                                const Text(
                                                  "Sniper Commando 3D",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                const SizedBox(height: 3),
                                                const Text(
                                                  "Bullet Shooting",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                                const SizedBox(height: 14),
                                                Row(
                                                  children: [
                                                    Container(
                                                      height: 35,
                                                      width: 70,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade400,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(17.5),
                                                      ),
                                                      child: const Text(
                                                        "Get",
                                                        style: TextStyle(
                                                            color: Colors.blue),
                                                      ),
                                                    ),
                                                    const SizedBox(width: 5),
                                                    const Text(
                                                      "In-App\nPurchases",
                                                      style: TextStyle(
                                                          fontSize: 12,
                                                          color: Colors.grey),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        color: Colors.white,
                        child: SingleChildScrollView(
                          physics: const BouncingScrollPhysics(),
                          child: Column(
                            children: [
                              Container(
                                height: 140,
                                padding: const EdgeInsets.only(
                                    bottom: 10, left: 15, right: 15),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const Text(""),
                                    const SizedBox(height: 8),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: const [
                                        Text(
                                          "Apps",
                                          style: TextStyle(
                                            fontSize: 30,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900,
                                            decoration: TextDecoration.none,
                                          ),
                                        ),
                                        CircleAvatar(
                                          radius: 20,
                                          backgroundColor: Colors.blue,
                                          backgroundImage: AssetImage(
                                              'assets/images/profile.jpg'),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 2,
                                width: 380,
                                margin: const EdgeInsets.only(
                                    left: 15, right: 15, top: 5),
                                color: Colors.grey.shade300,
                              ),
                              const SizedBox(height: 20),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "NOW WITH SIRI",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          const Text(
                                            "Triplt: Travel Planner",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            "Quickly get flight info with Siri",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 250,
                                            width: 360,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/travel.png'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text(
                                            "NEW GAME",
                                            style: TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          const Text(
                                            "Jiomart : Online Shopping",
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.black,
                                            ),
                                          ),
                                          const SizedBox(height: 3),
                                          Text(
                                            "Save time and money",
                                            style: TextStyle(
                                              fontSize: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.grey.shade500,
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          Container(
                                            height: 250,
                                            width: 360,
                                            decoration: BoxDecoration(
                                              color: Colors.grey,
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/jio.jpg'),
                                                  fit: BoxFit.fill),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 40),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    Text("12 Great Apps for IOS 12",
                                        style: TextStyle(
                                            fontSize: 23,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w900)),
                                    Text(
                                      "See All",
                                      style: TextStyle(color: Colors.blue),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        height: 90,
                                        width: 360,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/sky.jpg'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                SizedBox(height: 3),
                                                Text(
                                                  "Sky Guide",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  "View stars night or day",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 35,
                                              width: 70,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(17.5),
                                              ),
                                              child: const Text(
                                                "Open",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Container(
                                        height: 90,
                                        width: 360,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/note.jpg'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                SizedBox(height: 3),
                                                Text(
                                                  "Noted: Notepad,Audi...",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  "Note Taking, Meeting min...",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 35,
                                                  width: 69,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade400,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17.5),
                                                  ),
                                                  child: const Text(
                                                    "Get",
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                                Text(
                                                  "In-App\nPurchases",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color:
                                                          Colors.grey.shade400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              SingleChildScrollView(
                                physics: const BouncingScrollPhysics(),
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left: 15),
                                      child: Container(
                                        height: 90,
                                        width: 360,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                  image: AssetImage(
                                                      'assets/images/app.jpg'),
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                SizedBox(height: 3),
                                                Text(
                                                  "Whatsapp",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  "To stay updated",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Container(
                                              height: 35,
                                              width: 70,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                color: Colors.grey.shade400,
                                                borderRadius:
                                                    BorderRadius.circular(17.5),
                                              ),
                                              child: const Text(
                                                "Open",
                                                style: TextStyle(
                                                    color: Colors.blue),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, right: 15),
                                      child: Container(
                                        height: 90,
                                        width: 360,
                                        color: Colors.white,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              height: 70,
                                              width: 70,
                                              decoration: BoxDecoration(
                                                color: Colors.grey,
                                                borderRadius:
                                                    BorderRadius.circular(10),
                                                image: const DecorationImage(
                                                    image: AssetImage(
                                                        'assets/images/insta.jpg'),
                                                    fit: BoxFit.fill),
                                              ),
                                            ),
                                            const SizedBox(width: 10),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: const [
                                                SizedBox(height: 3),
                                                Text(
                                                  "Instagram",
                                                  style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                                SizedBox(height: 3),
                                                Text(
                                                  "lite version of tiktok",
                                                  style: TextStyle(
                                                    color: Colors.grey,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const Spacer(),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 35,
                                                  width: 71,
                                                  alignment: Alignment.center,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey.shade400,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            17.5),
                                                  ),
                                                  child: const Text(
                                                    "Get",
                                                    style: TextStyle(
                                                        color: Colors.blue),
                                                  ),
                                                ),
                                                Text(
                                                  "In-App\nPurchases",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13,
                                                      color:
                                                          Colors.grey.shade400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(color: Colors.white),
                      Container(color: Colors.white),
                    ],
                  ),
                  CupertinoTabBar(
                    currentIndex: currentPage,
                    onTap: (val) {
                      setState(() {
                        currentPage = val;
                      });
                    },
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                    height: 55,
                    items: const [
                      BottomNavigationBarItem(
                        label: "Today",
                        icon: Icon(CupertinoIcons.today),
                      ),
                      BottomNavigationBarItem(
                        label: "Games",
                        icon: Icon(CupertinoIcons.rocket_fill),
                      ),
                      BottomNavigationBarItem(
                        label: "Apps",
                        icon: Icon(CupertinoIcons.square_stack_3d_up_fill),
                      ),
                      BottomNavigationBarItem(
                        label: "Updates",
                        icon: Icon(CupertinoIcons.square_arrow_down_fill),
                      ),
                      BottomNavigationBarItem(
                        label: "Search",
                        icon: Icon(CupertinoIcons.search),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
