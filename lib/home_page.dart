import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<ItemModel>? items;
  List<ItemModel>? items2;

  int score = 0;
  bool? gameOver;

  @override
  void initState() {
    super.initState();
    initGame();
  }

  initGame() {
    gameOver = false;
    score = 0;
    items = [
      ItemModel(
          profile: 'assets/images/p1.jpg',
          profilName: 'Jack',
          image: 'assets/images/burger.png',
          name: "Burger",
          value: "\$9"),
      ItemModel(
          profile: 'assets/images/p2.jpg',
          profilName: 'Zagman',
          image: 'assets/images/roast.png',
          name: "Roasted",
          value: "\$8"),
      ItemModel(
          profile: 'assets/images/p2.jpg',
          profilName: 'Zagman',
          image: 'assets/images/chiken.png',
          name: "Chiken",
          value: "\$8"),
      ItemModel(
          profile: 'assets/images/p3.jpg',
          profilName: 'Robica',
          image: 'assets/images/crossiant.png',
          name: "Crossiant",
          value: "\$8"),
      ItemModel(
          profile: 'assets/images/p3.jpg',
          profilName: 'Lu',
          image: 'assets/images/jucie.png',
          name: "Orange Juice",
          value: "\$8"),
    ];
    items2 = List<ItemModel>.from(items!);
    items!.shuffle();
    items2!.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    if (items!.isEmpty) {
      gameOver = true;
    }
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(
                height: 40,
              ),
              const Icon(
                Icons.arrow_back_ios_new,
                size: 20,
              ),
              const SizedBox(
                height: 40,
              ),
              const Text.rich(TextSpan(children: [
                TextSpan(
                    text: "Split ",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35.0,
                    )),
                TextSpan(
                    text: "Order",
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 35.0,
                    ))
              ])),
              const SizedBox(
                height: 15,
              ),
              if (!gameOver!)
                Row(
                  children: <Widget>[
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: items!.map((item) {
                          return Container(
                            margin: const EdgeInsets.all(8.0),
                            child: Draggable<ItemModel>(
                                data: item,
                                childWhenDragging: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item.image!,
                                    height: 60,
                                  ),
                                ),
                                feedback: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.asset(
                                    item.image!,
                                    height: 120,
                                  ),
                                ),
                                child: SizedBox(
                                  width: MediaQuery.of(context).size.width - 90,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            height: 60,
                                            width: 60,
                                            color: Colors.grey.shade100,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              child: Image.asset(
                                                item.image!,
                                                fit: BoxFit.cover,
                                                height: 30,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Text("1 x ${item.name}"),
                                        ],
                                      ),
                                      Text(
                                        item.value!,
                                        style: const TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                )),
                          );
                        }).toList()),
                  ],
                ),
              const SizedBox(
                height: 15,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: items2!.map((item) {
                  return DragTarget<ItemModel>(
                    onAccept: (receivedItem) {
                      if (item.value == receivedItem.value) {
                        setState(() {
                          items!.remove(receivedItem);
                          items2!.remove(item);
                          score += 10;
                          item.accepting = false;
                        });
                      } else {
                        setState(() {
                          score -= 5;
                          item.accepting = false;
                        });
                      }
                    },
                    onLeave: (receivedItem) {
                      setState(() {
                        item.accepting = false;
                      });
                    },
                    onWillAccept: (receivedItem) {
                      setState(() {
                        item.accepting = true;
                      });
                      return true;
                    },
                    builder: (context, acceptedItems, rejectedItem) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: item.accepting
                              ? Colors.black
                              : Colors.grey.shade200,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(35),
                                    image: DecorationImage(
                                        image: AssetImage(item.profile!),
                                        fit: BoxFit.cover)),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(item.profilName!),
                              if (item.accepting == true)
                                Image.asset(item.image!)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                }).toList()),
              ),
              if (gameOver!)
                const Text(
                  "All List Orders",
                  style: TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 24.0,
                  ),
                ),
              if (gameOver!)
                Center(
                  child: TextButton(
                    child: const Text("Order List"),
                    onPressed: () {
                      initGame();
                      setState(() {});
                    },
                  ),
                )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemModel {
  final String? name;
  final String? value;
  final String? image;
  final String? profile;
  final String? profilName;
  bool accepting;

  ItemModel(
      {this.name,
      this.value,
      this.image,
      this.accepting = false,
      required this.profile,
      required this.profilName});
}
