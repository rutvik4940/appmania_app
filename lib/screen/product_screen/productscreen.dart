import 'package:appmania/utils/global.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
class ItemScreen extends StatefulWidget {
  const ItemScreen({super.key});

  @override
  State<ItemScreen> createState() => _ItemScreenState();
}

class _ItemScreenState extends State<ItemScreen> {
  Map m1 = {};
  

  @override
  Widget build(BuildContext context) {
    m1 = ModalRoute.of(context)!.settings.arguments as Map;
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.green.shade300,
              title: const Text("Item"),
              centerTitle: true,
              actions: [
                const Icon(Icons.favorite_border)
              ],
            ),
            body:SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    margin: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                        boxShadow: [
                          BoxShadow(blurRadius: 1,spreadRadius: 1)
                        ]
                    ),
                    child: Image.asset("${m1['image']}",fit: BoxFit.fill,),
                  ),
                  const SizedBox(
                      height:5
                  ),
                  Container(
                    height:40,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Icon(Icons.remove,color: Colors.white),
                        Text("1",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                            )
                        ),
                        Icon(Icons.add,color: Colors.white),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left:10),
                        child: Text("${m1['name']}",
                          style: const TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.sizeOf(context).width-20,
                        margin:const EdgeInsets.all(10),
                        child: Text("${m1['description']}",
                            style: const TextStyle(
                              fontSize: 15,
                            )
                        ),
                      )
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    child: const Row(
                      children: [
                        Icon(Icons.star,color: Colors.amber),
                        SizedBox(
                          width: 5,
                        ),
                        Text("4.5",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                        ),
                        SizedBox(
                            width:50
                        ),
                        Text("🔥\t100 Kcal",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Icon(Icons.alarm,color: Colors.red),
                        SizedBox(
                          width: 5,
                        ),
                        Text("5-10 Min",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            )
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: const EdgeInsets.all(10),
                          child:const Text("Ingredients",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                      )
                    ],
                  ),
                  SizedBox(
                      height: 10
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text("🥬",
                            style: TextStyle(
                                fontSize: 30)
                        ),

                        Text("🧅",style: TextStyle(
                            fontSize: 30)),

                        Text("🥕",style: TextStyle(
                            fontSize: 30)),

                        Text("🥦",style: TextStyle(
                            fontSize: 30)),

                        Text("🥒",style: TextStyle(
                            fontSize: 30)),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      cartList.add(m1);
                      Navigator.pop(context, "Hello");
                    },
                    child: Container(
                      padding: const EdgeInsets.only(top:10),
                      margin: const EdgeInsets.only(left:10,right:10,bottom:10),
                      height: 50,
                      width: double.infinity,
                      decoration:BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(10),
                      ) ,
                      child: const Text("Add to Cart",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )


                ],
              ),
            )
        )
    );

  }
}