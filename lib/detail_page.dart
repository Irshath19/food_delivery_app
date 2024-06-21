import 'package:flutter/material.dart';
import 'package:pro1/HomePage.dart';
import './model/food.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key, required this.food}) : super(key: key);
  final Food food;

  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int quantity = 1;
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          header(),
          const SizedBox(
            height: 20,
          ),
          image(),
          details(),
        ],
      ),
    );
  }

  Container details() {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.food.name,
                      style: const TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                      '\$${widget.food.price}',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),
              Material(
                color: Colors.green,
                borderRadius: BorderRadius.circular(30),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          if (quantity > 1) {
                            quantity -= 1;
                          }
                        });
                      },
                      icon: const Icon(Icons.remove),
                      color: Colors.white,
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    Text(
                      quantity.toString(),
                      style: const TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          quantity += 1;
                        });
                      },
                      icon: const Icon(Icons.add),
                      color: Colors.white,
                    ),
                  ],
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            children: [
              const Icon(
                Icons.star,
                color: Colors.amber,
                size: 18,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                widget.food.rate.toString(),
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.fiber_manual_record,
                color: Colors.red,
                size: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                '${widget.food.kcal} Kcal',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              const Icon(
                Icons.access_time_filled,
                color: Colors.amber,
                size: 20,
              ),
              const SizedBox(
                width: 4,
              ),
              Text(
                widget.food.cookingTime,
                style: TextStyle(
                  color: Colors.grey[600],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Text(
            "About Food",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Text(
            widget.food.description,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Material(
            color: Colors.green,
            borderRadius: BorderRadius.circular(16),
            child: InkWell(
              borderRadius: BorderRadius.circular(16),
              onTap: () {},
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                ),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return const HomePage();
                      }),
                    );
                  },
                  child: const Text(
                    "Add to Cart",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  SizedBox image() {
    return SizedBox(
      width: double.infinity,
      height: 300,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              height: 150,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
            ),
          ),
          Center(
            child: Container(
              decoration: BoxDecoration(boxShadow: [
                BoxShadow(
                    color: Colors.green[400]!,
                    blurRadius: 16,
                    offset: const Offset(0, 10)),
              ]),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(250),
                child: Image.asset(
                  widget.food.image,
                  fit: BoxFit.cover,
                  width: 250,
                  height: 250,
                ),
              ),
            ),
          ),
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
            color: Colors.white.withOpacity(0.3),
            borderRadius: BorderRadius.circular(8.0),
            child: const BackButton(
              color: Colors.white,
            ),
          ),
          const Spacer(),
          const Text(
            'Details Food',
            style: TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Material(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(8),
            child: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(8),
              child: Container(
                width: 40,
                height: 40,
                alignment: Alignment.center,
                padding: const EdgeInsets.all(8.0),
                child: const Icon(
                  Icons.favorite,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
