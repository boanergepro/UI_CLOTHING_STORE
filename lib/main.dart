import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
   home: HomeScreen(),
   debugShowCheckedModeBanner: false,
  ));
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => new _HomeScreenState();
 }
class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin{

  TabController controller;
  @override
    void initState() {
      // TODO: implement initState
      super.initState();
      controller = TabController(length: 2, vsync: this);
    }

  int _currentIndex = 0;
  //final pageController = PageController();

  // uri, tittle, price, descuento
  List<List> itemsClothing = [
    [
      'product1.jpg',
      'Sueter USA',
      '\$15.00',
      '30%',
      'no-favorite'
    ],
    [
      'product2.jpg',
      'Jean Black',
      '\$25.00',
      '10%',
      'no-favorite'
    ],
    [
      'product3.jpg',
      'Camisa Kids',
      '\$5.00',
      '20%',
      'favorite'
    ],
    [
      'product4.jpeg',
      'Bolso White and Black',
      '\$20.00',
      '15%',
      'no-favorite'
    ],
    [
      'product5.jpg',
      'Jeans Blue',
      '\$30.00',
      '5%',
      'no-favorite'
    ],
    [
      'product6.jpeg',
      'Sueters',
      '\$18.00',
      '20%',
      'no-favorite'
    ],
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black54,),
          onPressed: () {},
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('WOMEN', style: TextStyle(color: Colors.black54,),),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.black54,),
            onPressed: () {},
          )
        ],
        bottom: TabBar(
          indicatorColor: Colors.transparent,
          controller: controller,
          labelColor: Colors.black54,
          unselectedLabelColor: Colors.black54,
          tabs: <Widget>[
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.compare_arrows),
                  Text('SORT BY')
                ],
              ),
            ),
            Tab(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Icon(Icons.filter_list, color: Colors.pinkAccent,),
                  Text('FILTER BY'),
                ],
              ),
              
            ),
          ],
        ),
      ),
      body: Container(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: GridView.count(
              mainAxisSpacing: 13,
              crossAxisSpacing: 13,
              crossAxisCount: 2,
              children: List.generate(itemsClothing.length, (index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    //border: Border.all(color: Colors.grey[300],  width: 3),
                  ),
                  child: Column(
                    children: <Widget>[
                      Stack(
                        children: <Widget>[
                          Container(
                            height: MediaQuery.of(context).size.height / 5,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/' + itemsClothing[index][0]),
                                fit: BoxFit.fitWidth
                              )
                            ), 
                          ),
                          Positioned(
                            right: 0,
                            child: IconButton(
                              //icon: Icon(Icons.favorite_border, color: Colors.black),
                              icon: itemsClothing[index][4] == 'favorite' ? Icon(Icons.favorite, color: Colors.red) : Icon(Icons.favorite_border, color: Colors.black),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(itemsClothing[index][1]),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(left: 5, top: 5),
                                  child: Text(
                                    itemsClothing[index][2],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 5, top: 5),
                                  child: Container(
                                    padding: EdgeInsets.only(top: 3, right: 6, bottom: 3,
                                    left: 6),
                                    decoration: BoxDecoration(
                                      color: Colors.tealAccent,
                                      borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Text(
                                      itemsClothing[index][3],
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            )
                            
                          ],
                        ),
                      ),
                    ],
                  )
                );
              }),
            ),
          ),
        ),
      
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        notchMargin: 2,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.apps, color: _currentIndex == 0 ? Colors.pinkAccent : Colors.black54),
              onPressed: () {
                //pageController.jumpToPage(0);
              },
            ),
            IconButton(
              icon: Icon(Icons.favorite_border, color: _currentIndex == 1 ? Colors.pinkAccent : Colors.black54),
              onPressed: () {
                //pageController.jumpToPage(1);
              },
            ),
            IconButton(
              icon: Icon(Icons.local_grocery_store, color: _currentIndex == 2 ? Colors.pinkAccent : Colors.black54),
              onPressed: () {
                //pageController.jumpToPage(1);
              },
            ),
            IconButton(
              icon: Icon(Icons.person, color: _currentIndex == 3 ? Colors.pinkAccent : Colors.black54),
              onPressed: () {
                //pageController.jumpToPage(1);
              },
            ),
            IconButton(
              icon: Icon(Icons.settings, color: _currentIndex == 4 ? Colors.pinkAccent : Colors.black54),
              onPressed: () {
                //pageController.jumpToPage(1);
              },
            )
          ],
        ),
      ),

    );
  }
}