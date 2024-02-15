import 'package:flutter/material.dart';
import '../../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? selectCategory = "all";
  bool isSalad = true, isDessert = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
              child: Column(children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      Text(
                        "Surat City",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, "cart");
                          },
                          child: Icon(Icons.shopping_cart, color: Colors.black)),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: const Text.rich(TextSpan(children: [
                          TextSpan(
                              text: "Find The\t",
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                              )),
                          TextSpan(
                              text: "Best \nFood",
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              )),
                          TextSpan(
                              text: "\tAround You",
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.black,
                              ))
                        ]))),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: SearchBar(hintText: "search your fav food....",leading: Icon(Icons.search_rounded),),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        margin: const EdgeInsets.all(20),
                        child: const Text.rich(
                          TextSpan(children: [
                            TextSpan(
                                text: "Find",
                                style: TextStyle(
                                  fontSize: 30,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                )),
                            TextSpan(
                                text: "\t5km >",
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.red,
                                  fontWeight: FontWeight.bold,
                                )),
                          ]),
                        ))
                  ],
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      DropdownButton(
                        value: selectCategory,
                        items: const [
                          DropdownMenuItem(child: Text("All"), value: "all"),
                          DropdownMenuItem(
                              child: Text("Salads"), value: "salads"),
                          DropdownMenuItem(
                              child: Text("Dessert"), value: "dessert"),
                        ],
                        onChanged: (String? value) {
                          setState(() {
                            selectCategory = value;
                            if (value == "salads") {
                              isSalad = true;
                              isDessert = false;
                            } else if (value == "dessert") {
                              isSalad = false;
                              isDessert = true;
                            } else {
                              isSalad = true;
                              isDessert = true;
                            }
                          });
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 5),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: isSalad,
                        child: const Text(
                          "Salads",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isSalad,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        saladList.length,
                        (index) => InkWell(
                          onTap: () {
                            Map m1 = saladList[index];
                            Navigator.pushNamed(context, 'item', arguments: m1)
                                .then((value) => print("$value"));
                          },
                          child: Container(
                            height: 200,
                            width: 150,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ]),
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                    visible: isSalad,
                                    child: Image.asset(
                                      "${saladList[index]['image']}",
                                      height: 80,
                                      width: 150,
                                      fit: BoxFit.fill,
                                    )),
                                const SizedBox(
                                  height: 10,
                                ),
                                Visibility(
                                  visible: isSalad,
                                  child: Text(
                                    "${saladList[index]['name']}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: isSalad,
                                      child: Text(
                                        "${saladList[index]['time']}",
                                        style: const TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.grey),
                                      ),
                                    ),
                                    Visibility(
                                      visible: isSalad,
                                      child: Text(
                                        "${saladList[index]['rate']}",
                                        style: const TextStyle(
                                            fontSize: 15, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: isSalad,
                                      child: Text(
                                        "\$${saladList[index]['price']}",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ),
                                    Visibility(
                                      visible: isSalad,
                                      child: SizedBox(
                                        height: 30,
                                        width: 30,
                                        child: Icon(Icons.add),
                                      )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Visibility(
                        visible: isDessert,
                        child: const Text(
                          "Dessert",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isDessert,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                        dessertList.length,
                        (index) => InkWell(
                          onTap: () {
                            Map m1 = dessertList[index];
                            Navigator.pushNamed(context, 'item', arguments: m1);
                          },
                          child: Container(
                            height: 200,
                            width: 150,
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 2,
                                      blurRadius: 5)
                                ]),
                            alignment: Alignment.center,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Visibility(
                                    visible: isDessert,
                                    child: Image.asset(
                                        "${dessertList[index]['image']}",
                                        height: 80,
                                        width: 150)),
                                const SizedBox(
                                  height: 10,
                                ),
                                Visibility(
                                  visible: isDessert,
                                  child: Text(
                                    "${dessertList[index]['name']}",
                                    style: const TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: isDessert,
                                      child: Text(
                                        "${dessertList[index]['time']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    Visibility(
                                      visible: isDessert,
                                      child: Text(
                                        "${dessertList[index]['rate']}",
                                        style: const TextStyle(
                                            color: Colors.grey,
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Visibility(
                                      visible: isDessert,
                                      child: Text(
                                        "\$${dessertList[index]['price']}",
                                        style: const TextStyle(
                                            fontSize: 14, color: Colors.black),
                                      ),
                                    ),
                                    Visibility(
                                      visible: isDessert,
                                      child:SizedBox(
                                      height: 30,
                                      width: 30,
                                      child: Icon(Icons.add),
                                    )
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ]),
            )));
  }
}
