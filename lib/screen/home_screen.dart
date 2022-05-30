import 'package:flutter/material.dart';
import 'package:submission/data/recipe_data.dart';


import 'detail_screeen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: HomeLayout(),
    );
  }
}

class HomeLayout extends StatefulWidget {
  const HomeLayout({Key? key}) : super(key: key);

  @override
  State<HomeLayout> createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final List<Tab> catTab = const [
    Tab(text: 'Beef'),
    Tab(text: 'Chicken'),
    Tab(text: 'Lamb'),
    Tab(text: 'Seafood'),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text('Hello There,', style: TextStyle(fontSize: 16)),
              SizedBox(height: 8),
              Text('Let\'s Find Best Recipe for\nYour Meal.',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        const SizedBox(height: 4),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://www.themealdb.com/images/media/meals/uuuspp1511297945.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Chicken & mushroom Hotpot",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                    height: 250,
                    width: 250,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      image: const DecorationImage(
                        image: NetworkImage(
                            'https://www.themealdb.com/images/media/meals/sypxpx1515365095.jpg'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    padding: const EdgeInsets.all(16),
                    alignment: Alignment.bottomLeft,
                    child: const Text(
                      "Brown Stew Chicken",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    )),
                const SizedBox(width: 16),
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://www.themealdb.com/images/media/meals/xrttsx1487339558.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Lamb Biryani",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(16),
                    image: const DecorationImage(
                      image: NetworkImage(
                          'https://www.themealdb.com/images/media/meals/xxyupu1468262513.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: const EdgeInsets.all(16),
                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Honey Teriyaki Salmon",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Container(
          margin: const EdgeInsets.all(16),
          child: const Text(
            'Find by Categories',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const SizedBox(height: 16),
        // const TabBarContent()
        Container(
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: TabBar(
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            labelPadding: const EdgeInsets.symmetric(horizontal: 24),
            controller: _tabController,
            isScrollable: false,
            tabs: catTab,
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: [
              Scrollbar(
                isAlwaysShown: true,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: dataBeef.map((recipe) {
                      return InkWell(
                        child: Card(
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Expanded(
                                child: Image.network(
                                  recipe.mealThumb,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  recipe.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // navigate to DetailScreen with MaterialPageRoute
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(recipe: recipe);
                          }));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Scrollbar(
                isAlwaysShown: true,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: dataChicken.map((recipe) {
                      return InkWell(
                        child: Card(
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Expanded(
                                child: Image.network(
                                  recipe.mealThumb,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  recipe.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // navigate to DetailScreen with MaterialPageRoute
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(recipe: recipe);
                          }));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Scrollbar(
                isAlwaysShown: true,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: dataLamb.map((recipe) {
                      return InkWell(
                        child: Card(
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Expanded(
                                child: Image.network(
                                  recipe.mealThumb,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  recipe.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // navigate to DetailScreen with MaterialPageRoute
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(recipe: recipe);
                          }));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
              Scrollbar(
                isAlwaysShown: true,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    children: dataSeafood.map((recipe) {
                      return InkWell(
                        child: Card(
                          child: Stack(
                            alignment: Alignment.bottomLeft,
                            children: [
                              Expanded(
                                child: Image.network(
                                  recipe.mealThumb,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.all(8),
                                child: Text(
                                  recipe.title,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    shadows: [
                                      Shadow(
                                        blurRadius: 4,
                                        color: Colors.black,
                                        offset: Offset(2, 2),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          // navigate to DetailScreen with MaterialPageRoute
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailScreen(recipe: recipe);
                          }));
                        },
                      );
                    }).toList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
