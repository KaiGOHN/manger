import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Manger',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Manger'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  final PageController controller = PageController();

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: <Widget>[
        // MENU
        Container(
          // width: MediaQuery.of(context).size.width,
          // height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: PageView(
            /// [PageView.scrollDirection] defaults to [Axis.horizontal].
            /// Use [Axis.vertical] to scroll vertically.
            pageSnapping: true,
            controller: controller,
            children: <Widget>[

              //LUNDI
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text('LUNDI'),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(30),
                            children: const <Widget>[
                              // ENTREE
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                      image:
                                          AssetImage("assets/images/plat1.jpg"),
                                    )),
                                  ),
                                ),
                              ),


                              // PLAT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),



                              // DESSERT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),

                            ])),
                  ),
                ],
              ),


              //MARDI
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text('MARDI'),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(30),
                            children: const <Widget>[
                              // ENTREE
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),


                              // PLAT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),



                              // DESSERT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),

                            ])),
                  ),
                ],
              ),


              //MERCREDI
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text('MERCREDI'),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(30),
                            children: const <Widget>[
                              // ENTREE
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),


                              // PLAT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),



                              // DESSERT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),

                            ])),
                  ),
                ],
              ),


              //JEUDI
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text('JEUDI'),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(30),
                            children: const <Widget>[
                              // ENTREE
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),


                              // PLAT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),



                              // DESSERT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),

                            ])),
                  ),
                ],
              ),


              //VENDREDI
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text('VENDREDI'),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(30),
                            children: const <Widget>[
                              // ENTREE
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),


                              // PLAT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),



                              // DESSERT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),

                            ])),
                  ),
                ],
              ),


              //SAMEDI
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text('SAMEDI'),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(30),
                            children: const <Widget>[
                              // ENTREE
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),


                              // PLAT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),



                              // DESSERT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),

                            ])),
                  ),
                ],
              ),


              //DIMANCHE
              Column(
                children: <Widget>[
                  const Padding(
                    padding: EdgeInsets.only(top: 10.0),
                  ),
                  Text('DIMANCHE'),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(30),
                            children: const <Widget>[
                              // ENTREE
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),


                              // PLAT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),



                              // DESSERT
                              SizedBox(
                                height: 250,
                                child: Card(
                                  clipBehavior: Clip.hardEdge,
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: Center(
                                        child: Image(
                                          image:
                                          AssetImage("assets/images/plat1.jpg"),
                                        )),
                                  ),
                                ),
                              ),

                            ])),
                  ),
                ],
              ),

            ],
          ),
        ),

        // Notation
        Container(
          alignment: Alignment.center,
          child: const Text('Page 2'),
        ),

        // Voter
        Container(
          alignment: Alignment.center,
          child: const Text('Page 3'),
        ),

        // Stats
        Container(
          alignment: Alignment.center,
          child: const Text('Page 4'),
        ),
      ][_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant_menu),
            label: 'Menu',
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate),
            label: 'Noter',
            //backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.how_to_vote),
            label: 'Voter',
            // backgroundColor: Colors.blue,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Stats',
            // backgroundColor: Colors.blue,
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
