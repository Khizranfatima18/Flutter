import 'package:flutter/material.dart';
import 'package:miniproject/bottomNavi.dart';
import 'package:miniproject/colors.dart';
import 'package:miniproject/screens/BnSFishes.dart';
import 'package:miniproject/screens/fruitsList.dart';

class CategoryPage extends StatefulWidget {
  final String categoryName;
  const CategoryPage(this.categoryName, {Key? key}) : super(key: key);

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this); // 4 tabs in total
  }

  @override
  void dispose() {
    _tabController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  List<dynamic> top2 = [
    {
      "nameplate": 'assets/Images/namefield.png',
      "Shop": const Text(
        "Shop",
        style: TextStyle(
          fontSize: 50,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
      "ByCategory": const Text(
        "By Category",
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      )
    },
  ];

  final List<Map<String, String>> categories = [
    {
      "Category1": 'assets/Images/Fishes.png',
    },
    {
      "Category2": 'assets/Images/Meats.png',
    },
    {
      "Category3": 'assets/Images/Vegetable.png',
    },
    {
      "Category4": 'assets/Images/Fruits.png',
    },
    {
      "Category5": 'assets/Images/Jucies.png',
    },
    {
      "Category6": 'assets/Images/CookingNeeds.png',
    },
  ];

  final PageController _pageController =
      PageController(initialPage: 0, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(controller: _pageController, children: [
        // Page 1: Contains the content with GridView
        Column(
          children: [
            SizedBox(
              height: 280,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                controller: _pageController,
                itemCount: top2.length,
                onPageChanged: (int page) {
                  setState(() {});
                },
                itemBuilder: (context, index) {
                  return Container(
                    color: screenOneColor,
                    child: Column(
                      children: [
                        const Padding(padding: EdgeInsets.only(top: 50.0)),
                        Image.asset(top2[index]['nameplate']!),
                        const SizedBox(height: 25),
                        top2[index]['Shop'],
                        top2[index]['ByCategory'],
                      ],
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: GridView.builder(
                itemCount: 6,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 7,
                  crossAxisSpacing: 7,
                  childAspectRatio: 0.75,
                ),
                itemBuilder: (context, index) {
                  return Image.asset(categories[index].values.first);
                },
              ),
            ),
          ],
        ),

        // Page 2: Empty or other content
        Column(
          children: [
            Container(
              color: screenOneColor,
              height: 280,
              width: 600,
              child: Column(children: [
                const Padding(padding: EdgeInsets.only(top: 50.0)),
                Image.asset('assets/Images/namefield.png'),
                const SizedBox(height: 25),
                RichText(
                  text: const TextSpan(
                    style: TextStyle(
                      fontSize: 50,
                      color: Colors.white,
                    ),
                    children: [
                      TextSpan(text: "Shop\n"),
                      TextSpan(
                        text: "By Category",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            Expanded(
              child: NestedScrollView(
                headerSliverBuilder: (BuildContext context, bool isScrolled) {
                  return [
                    SliverAppBar(
                      pinned: true,
                      backgroundColor: Colors.white,
                      bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: Container(
                          margin: const EdgeInsets.all(0),
                          child: TabBar(
                            indicatorPadding: const EdgeInsets.all(0),
                            indicatorSize: TabBarIndicatorSize.label,
                            labelPadding: const EdgeInsets.all(0),
                            controller: _tabController,
                            isScrollable: true,
                            indicator: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.red.withOpacity(0.2),
                                  blurRadius: 7,
                                  offset: const Offset(0, 0),
                                )
                              ],
                            ),
                            tabs: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 132,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 7,
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Meats & Fishes",
                                    style: TextStyle(
                                      color: Color(0xffB2BBCE),
                                    ),
                                  ),
                                ),
                              ),
                              // Add more tabs as needed
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 132,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 7,
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Vegetable",
                                    style: TextStyle(
                                      color: Color(0xffB2BBCE),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 132,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 7,
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "Fruits",
                                    style: TextStyle(
                                      color: Color(0xffB2BBCE),
                                    ),
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Container(
                                  width: 132,
                                  height: 36,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.2),
                                        blurRadius: 7,
                                        offset: const Offset(0, 0),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  child: const Text(
                                    "CookingNeeds",
                                    style: TextStyle(
                                      color: Color(0xffB2BBCE),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ];
                },
                body: TabBarView(controller: _tabController, children: [
                  Material( //Meat N fishes
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            // Navigate to the next page when the image is tapped
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>  BnSFishes(),
                            ));
                          },
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 8, 70, 10),
                            child: Image.asset(
                              'assets/Images/BnSFishes.png',
                              height: 150,
                              width: 280,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 89, 0),
                          child: Image.asset(
                            'assets/Images/Halal Meats.png',
                            height: 150,
                            width: 280,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Material( //Vegetables
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Image.asset('assets/Images/Vege.png'),
                      ),
                    ]),
                  ),
                    Material(
      // Fruits
      child: InkWell(
        onTap: () {
          // Navigate to the next screen when the Fruits image is tapped
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => const FruitList(), // Replace NextScreen with your desired screen
          ));
        },
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(19.0),
              child: Image.asset('assets/Images/fruitscategory.png'),
            ),
          ],
        ),
      ),
    ),
                  Material( //cooking
                    child: Column(children: [
                      Image.asset('assets/Images/cookingresources.png',height: 300,width: 300,),
                    ]),
                  ),
                ]), 
                controller: _scrollController,
              ),
            ),
          ],
        )
      ]),
      bottomNavigationBar: buildBottomNavigationBar(context),
    );
  }
}
