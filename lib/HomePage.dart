// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:pro1/detail_page.dart';
import 'package:pro1/model/food.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

int indexCategory = 0;
int _selectedIndex = 0;
bool isFavorite = false;

class _HomePageState extends State<HomePage> {
  void updateCategory(int index) {
    setState(() {
      indexCategory = index;
    });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey[200],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.chat,
            ),
            label: "Chat",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.shopping_cart,
            ),
            label: "Cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.notifications,
            ),
            label: "Notifications",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
            ),
            label: "Favourite",
          ),
        ],
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //     // backgroundColor: Colors.grey,
      //     type: BottomNavigationBarType.fixed,
      //     showSelectedLabels: false,
      //     showUnselectedLabels: false,
      //     selectedItemColor: Colors.green,
      //     unselectedItemColor: Colors.grey[200],
      //     items: const [
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.home,
      //         ),
      //         label: "Home",
      //       ),
      //       BottomNavigationBarItem(
      //         icon: Icon(
      //           Icons.chat,
      //         ),
      //         label: "Chat",
      //       ),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.shopping_cart,
      //           ),
      //           label: "Cart"),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.notifications,
      //           ),
      //           label: "Notifications"),
      //       BottomNavigationBarItem(
      //           icon: Icon(
      //             Icons.favorite,
      //           ),
      //           label: "Favourite"),
      //     ]
      //     ),
      body: ListView(
        children: [
          const SizedBox(
            height: 16,
          ),
          header(),
          const SizedBox(
            height: 30,
          ),
          title(),
          const SizedBox(
            height: 20,
          ),
          search(),
          const SizedBox(
            height: 30,
          ),
          categories(onCategoryTap: updateCategory),
          const SizedBox(
            height: 20,
          ),
          gridFood(),
        ],
      ),
    );
  }

  Widget header() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Material(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8.0),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                height: 40,
                width: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const Spacer(),
          const Icon(
            Icons.location_on,
            color: Colors.green,
            size: 18,
          ),
          const Text(
            "Gandhipuram,Coimbatore",
            style: TextStyle(color: Colors.black),
          ),
          const Spacer(),
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.asset(
              'assets/burger.jpeg',
              fit: BoxFit.cover,
              width: 40,
              height: 40,
            ),
          ),
        ],
      ),
    );
  }
}

Widget title() {
  return const Padding(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Hii Irshath",
          style: TextStyle(
            color: Colors.green,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        Text(
          "Find your food",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 34,
          ),
        ),
      ],
    ),
  );
}

Widget search() {
  return Container(
    height: 60,
    margin: const EdgeInsets.symmetric(horizontal: 16),
    padding: const EdgeInsets.fromLTRB(8, 2, 6, 2),
    decoration: BoxDecoration(
      color: Colors.green[100],
      borderRadius: BorderRadius.circular(12.0),
    ),
    child: Row(
      children: [
        const Expanded(
            child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.green,
            ),
            hintText: 'Search Food',
            hintStyle: TextStyle(
              color: Colors.grey,
            ),
          ),
        )),
        Material(
          color: Colors.green,
          borderRadius: BorderRadius.circular(10.0),
          child: InkWell(
            onTap: () {},
            borderRadius: BorderRadius.circular(10.0),
            child: Container(
              width: 50,
              height: 50,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(8.0),
              child: const Icon(
                Icons.bar_chart,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget categories({required void Function(int) onCategoryTap}) {
  List list = ["Food", "Fruits", "Vegetables", "Grocery", "Drink"];
  return SizedBox(
    height: 40,
    // color: Colors.amber[300],
    child: ListView.builder(
        itemCount: list.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onCategoryTap(index);
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(index == 0 ? 16 : 16, 0,
                  index == list.length - 1 ? 16 : 16, 0),
              child: Text(
                list[index],
                style: TextStyle(
                  fontSize: 22,
                  color: indexCategory == index ? Colors.green : Colors.grey,
                  fontWeight: indexCategory == index ? FontWeight.bold : null,
                ),
              ),
            ),
          );
        }),
  );
}

Widget gridFood() {
  return GridView.builder(
    itemCount: dummyFoods.length,
    shrinkWrap: true,
    physics: const NeverScrollableScrollPhysics(),
    padding: const EdgeInsets.all(16),
    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
      crossAxisCount: 2,
      mainAxisSpacing: 8,
      crossAxisSpacing: 8,
      mainAxisExtent: 330,
    ),
    itemBuilder: (context, index) {
      Food food = dummyFoods[index];
      return GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return DetailPage(food: food);
          }));
        },
        child: Container(
          height: 330,
          decoration: BoxDecoration(
            color: Colors.grey[100],
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.all(8),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(120),
                      child: Image.asset(
                        food.image,
                        width: 120,
                        height: 140,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      food.name,
                      style: Theme.of(context).textTheme.headline6,
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(
                    height: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      children: [
                        Text(
                          food.cookingTime,
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                        const Spacer(),
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 4,
                        ),
                        Text(
                          food.rate.toString(),
                          style: TextStyle(color: Colors.grey[600]),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      '\$${food.price}',
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
              const Positioned(
                top: 12,
                right: 12,
                child: Icon(
                  Icons.favorite_border,
                  color: Colors.grey,
                ),
              ),
              const Align(
                alignment: Alignment.bottomRight,
                child: Material(
                  color: Colors.green,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    bottomRight: Radius.circular(16),
                  ),
                  child: InkWell(
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    },
  );
}
