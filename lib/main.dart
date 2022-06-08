
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:appinio_swiper/appinio_swiper.dart';

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

// Define data structure for a bar group
class DataItem {
  int x;
  double y1;
  double y2;
  double y3;

  DataItem(
      {required this.x, required this.y1, required this.y2, required this.y3});
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
  final double _initialRating = 2.0;
  final bool _isVertical = false;
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
                  const Text('LUNDI',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[
                              // Entrées
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntreesRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  )),

                              // PLATS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PlatsRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),

                              // DESSERTS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DessertRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),
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
                  const Text('MARDI',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[
                              // Entrées
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntreesRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  )),

                              // PLATS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PlatsRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),

                              // DESSERTS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DessertRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),
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
                  const Text('MERCREDI',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[
                              // Entrées
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntreesRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  )),

                              // PLATS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PlatsRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),

                              // DESSERTS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DessertRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),
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
                  const Text('JEUDI',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[
                              // Entrées
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntreesRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  )),

                              // PLATS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PlatsRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),

                              // DESSERTS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DessertRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),
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
                  const Text('VENDREDI',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[
                              // Entrées
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntreesRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  )),

                              // PLATS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PlatsRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),

                              // DESSERTS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DessertRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),
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
                  const Text('SAMEDI',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[
                              // Entrées
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntreesRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  )),

                              // PLATS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PlatsRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),

                              // DESSERTS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DessertRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),
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
                  const Text('DIMANCHE',
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                  Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        child: ListView(
                            padding: const EdgeInsets.all(10),
                            children: <Widget>[
                              // Entrées
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const EntreesRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  )),

                              // PLATS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const PlatsRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),

                              // DESSERTS
                              SizedBox(
                                  height: 250,
                                  child: GestureDetector(
                                    onTap: () => {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const DessertRoute()),
                                      )
                                    },
                                    child: Stack(
                                      alignment: Alignment.center,
                                      children: const <Widget>[
                                        Card(
                                          clipBehavior: Clip.hardEdge,
                                          child: FittedBox(
                                            fit: BoxFit.cover,
                                            child: Center(
                                                child: Image(
                                              image: AssetImage(
                                                  "assets/images/plat1.jpg"),
                                            )),
                                          ),
                                        ),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold)))
                                      ],
                                    ),
                                  )),
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
            child: ListView(
              children: <Widget>[
                Column(
                  children: <Widget>[
                    SizedBox(
                        height: 250,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DescriptionRoute()),
                            )
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: const <Widget>[
                              Card(
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
                              Center(
                                  child: Text("Entrée 1",
                                      style: TextStyle(
                                          fontSize: 80,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        )),
                    RatingBar.builder(
                      initialRating: _initialRating,
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return const Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return const Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return const Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return const Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                          default:
                            return Container();
                        }
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                        });
                      },
                      updateOnDrag: true,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                        height: 250,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DescriptionRoute()),
                            )
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: const <Widget>[
                              Card(
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
                              Center(
                                  child: Text("Entrée 2",
                                      style: TextStyle(
                                          fontSize: 80,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        )),
                    RatingBar.builder(
                      initialRating: _initialRating,
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return const Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return const Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return const Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return const Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                          default:
                            return Container();
                        }
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                        });
                      },
                      updateOnDrag: true,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                        height: 250,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DescriptionRoute()),
                            )
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: const <Widget>[
                              Card(
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
                              Center(
                                  child: Text("Plat 1",
                                      style: TextStyle(
                                          fontSize: 80,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        )),
                    RatingBar.builder(
                      initialRating: _initialRating,
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return const Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return const Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return const Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return const Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                          default:
                            return Container();
                        }
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                        });
                      },
                      updateOnDrag: true,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                        height: 250,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DescriptionRoute()),
                            )
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: const <Widget>[
                              Card(
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
                              Center(
                                  child: Text("Plat 2",
                                      style: TextStyle(
                                          fontSize: 80,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        )),
                    RatingBar.builder(
                      initialRating: _initialRating,
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return const Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return const Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return const Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return const Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                          default:
                            return Container();
                        }
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                        });
                      },
                      updateOnDrag: true,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                        height: 250,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DescriptionRoute()),
                            )
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: const <Widget>[
                              Card(
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
                              Center(
                                  child: Text("Plat 3",
                                      style: TextStyle(
                                          fontSize: 80,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        )),
                    RatingBar.builder(
                      initialRating: _initialRating,
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return const Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return const Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return const Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return const Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                          default:
                            return Container();
                        }
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                        });
                      },
                      updateOnDrag: true,
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    SizedBox(
                        height: 250,
                        child: GestureDetector(
                          onTap: () => {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const DescriptionRoute()),
                            )
                          },
                          child: Stack(
                            alignment: Alignment.center,
                            children: const <Widget>[
                              Card(
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
                              Center(
                                  child: Text("Dessert 1",
                                      style: TextStyle(
                                          fontSize: 80,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold))),
                            ],
                          ),
                        )),
                    RatingBar.builder(
                      initialRating: _initialRating,
                      direction: _isVertical ? Axis.vertical : Axis.horizontal,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                      itemBuilder: (context, index) {
                        switch (index) {
                          case 0:
                            return const Icon(
                              Icons.sentiment_very_dissatisfied,
                              color: Colors.red,
                            );
                          case 1:
                            return const Icon(
                              Icons.sentiment_dissatisfied,
                              color: Colors.redAccent,
                            );
                          case 2:
                            return const Icon(
                              Icons.sentiment_neutral,
                              color: Colors.amber,
                            );
                          case 3:
                            return const Icon(
                              Icons.sentiment_satisfied,
                              color: Colors.lightGreen,
                            );
                          case 4:
                            return const Icon(
                              Icons.sentiment_very_satisfied,
                              color: Colors.green,
                            );
                          default:
                            return Container();
                        }
                      },
                      onRatingUpdate: (rating) {
                        setState(() {
                        });
                      },
                      updateOnDrag: true,
                    )
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
                Center(
                    child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: const Text('Valider',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                )),
                const Padding(
                  padding: EdgeInsets.only(top: 20.0),
                ),
              ],
            )),

        // Voter
        Container(
          child: Center(
              child: Container(
            height: MediaQuery.of(context).size.height * 0.8,
            width: MediaQuery.of(context).size.width * 0.9,
            child: AppinioSwiper(
              cards: <Widget>[
                Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Column(children: <Widget>[
                      const Expanded(child:         SizedBox(
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Center(
                                child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                          ),
                        ),
                      ),),

                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      const Text('Nom du plat',
                          style: TextStyle(fontSize: 40, color: Colors.black)),
                      const Padding(
                        padding:
                        EdgeInsets.only(top: 20.0, left: 30, right: 30),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                            style:
                            TextStyle(fontSize: 17, color: Colors.black)),
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.fastfood),
                              title: Text('Ingredient 1'),
                            ),
                            const ListTile(
                              leading: Icon(Icons.fastfood),
                              title: Text('Ingredient 2'),
                            ),
                            const ListTile(
                              leading: Icon(Icons.fastfood),
                              title: Text('Ingredient 3'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    const Text("Valeur nutrionnelle",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.black)),
                                    RatingBarIndicator(
                                      rating: 2.75,
                                      itemBuilder: (context, index) =>
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                      ),
                                      itemCount: 5,
                                      itemSize: 50.0,
                                      direction: Axis.horizontal,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
                Container(
                    height: MediaQuery.of(context).size.height * 0.8,
                    width: MediaQuery.of(context).size.width * 0.9,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0, 3),
                          blurRadius: 7,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ],
                    ),
                    child: Column(children: <Widget>[
                      const Expanded(child:         SizedBox(
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: FittedBox(
                            fit: BoxFit.cover,
                            child: Center(
                                child: Image(
                                  image: AssetImage("assets/images/plat2.jpg"),
                                )),
                          ),
                        ),
                      ),),

                      const Padding(
                        padding: EdgeInsets.only(top: 20.0),
                      ),
                      const Text('Nom du plat',
                          style: TextStyle(fontSize: 40, color: Colors.black)),
                      const Padding(
                        padding:
                        EdgeInsets.only(top: 20.0, left: 30, right: 30),
                        child: Text(
                            'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. ',
                            style:
                            TextStyle(fontSize: 17, color: Colors.black)),
                      ),
                      Expanded(
                        child: ListView(
                          children: <Widget>[
                            const ListTile(
                              leading: Icon(Icons.fastfood),
                              title: Text('Ingredient 1'),
                            ),
                            const ListTile(
                              leading: Icon(Icons.fastfood),
                              title: Text('Ingredient 2'),
                            ),
                            const ListTile(
                              leading: Icon(Icons.fastfood),
                              title: Text('Ingredient 3'),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Column(
                                  children: <Widget>[
                                    const Text("Valeur nutrionnelle",
                                        style: TextStyle(
                                            fontSize: 30, color: Colors.black)),
                                    RatingBarIndicator(
                                      rating: 2.75,
                                      itemBuilder: (context, index) =>
                                      const Icon(
                                        Icons.circle,
                                        color: Colors.green,
                                      ),
                                      itemCount: 5,
                                      itemSize: 50.0,
                                      direction: Axis.horizontal,
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ])),
              ],
            ),
          )),
        ),

        // Stats
        Container(
          alignment: Alignment.center,
          child: Text("test"),
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

class EntreesRoute extends StatelessWidget {
  const EntreesRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des entrées'),
      ),
      body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Entrée 1",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Entrée 2",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Entrée 3",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Entrée 3",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Entrée 4",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Entrée 5",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          )),
    );
  }
}

class PlatsRoute extends StatelessWidget {
  const PlatsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des plats'),
      ),
      body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Plat 1",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Plat 2",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Plat 3",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Plat 3",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Plat 4",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Plat 5",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          )),
    );
  }
}

class DessertRoute extends StatelessWidget {
  const DessertRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Liste des desserts'),
      ),
      body: Container(
          alignment: Alignment.center,
          child: ListView(
            children: <Widget>[
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Dessert 1",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Dessert 2",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Dessert 3",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Dessert 3",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Dessert 4",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
              Column(
                children: <Widget>[
                  SizedBox(
                      height: 250,
                      child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const DescriptionRoute()),
                          )
                        },
                        child: Stack(
                          alignment: Alignment.center,
                          children: const <Widget>[
                            Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                            Center(
                                child: Text("Dessert 5",
                                    style: TextStyle(
                                        fontSize: 80,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold))),
                          ],
                        ),
                      )),
                ],
              ),
            ],
          )),
    );
  }
}

class DescriptionRoute extends StatelessWidget {
  const DescriptionRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Description du plat'),
        ),
        body: Column(children: <Widget>[
          const Padding(
            padding: EdgeInsets.only(top: 20.0),
          ),
          const Text('Nom du plat',
              style: TextStyle(fontSize: 40, color: Colors.black)),
          const Padding(
            padding: EdgeInsets.only(top: 20.0, left: 30, right: 30),
            child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum',
                style: TextStyle(fontSize: 17, color: Colors.black)),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                const ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Ingredient 1'),
                ),
                const ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Ingredient 2'),
                ),
                const ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Ingredient 3'),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Text("Note moyenne",
                            style: const TextStyle(
                                fontSize: 30, color: Colors.black)),
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => const Icon(
                            Icons.star,
                            color: Colors.amber,
                          ),
                          itemCount: 5,
                          itemSize: 50.0,
                          direction: Axis.horizontal,
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        const Text("Valeur nutrionnelle",
                            style: TextStyle(
                                fontSize: 30, color: Colors.black)),
                        RatingBarIndicator(
                          rating: 2.75,
                          itemBuilder: (context, index) => const Icon(
                            Icons.circle,
                            color: Colors.green,
                          ),
                          itemCount: 5,
                          itemSize: 50.0,
                          direction: Axis.horizontal,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
