import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:appinio_swiper/appinio_swiper.dart';
import 'package:d_chart/d_chart.dart';

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
  final double _initialRating = 2.0;
  final bool _isVertical = false;
  int _selectedIndex = 0;

  Widget _buildPopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Contact'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("loic.daude@mondet.fr"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pop(context);
          },
          child: const Text('Fermer'),
        ),
      ],
    );
  }

  final PageController controller = PageController();

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const PanierRoute()),
          );
          // Add your onPressed code here!
        },
        backgroundColor: Colors.blue,
        child: const Icon(Icons.shopping_cart_checkout),
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('MANGER'),
            ),
            ListTile(
              title: const Text('Paramètres'),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ParamRoute()),
                );

                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Contact'),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) => _buildPopupDialog(context),
                );

                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: <Widget>[
        // MENU
        Center(
          child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height,
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
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // PLATS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // DESSERTS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
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
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // PLATS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // DESSERTS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
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
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // PLATS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // DESSERTS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
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
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // PLATS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // DESSERTS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
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
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // PLATS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // DESSERTS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
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
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // PLATS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // DESSERTS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
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
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Entrées",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // PLATS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Plats",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                  // DESSERTS
                                  GestureDetector(
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
                                              fit: BoxFit.fill,
                                              child: Center(
                                                  child: Image(
                                                width: 600,
                                                height: 399,
                                                image: AssetImage(
                                                  "assets/images/plat1.jpg",
                                                ),
                                              )),
                                            )),
                                        Center(
                                            child: Text("Desserts",
                                                style: TextStyle(
                                                    fontSize: 80,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.bold))),
                                      ],
                                    ),
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ],
              )),
        ),

        // Notation
        Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
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
                        setState(() {});
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
                        setState(() {});
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
                        setState(() {});
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
                        setState(() {});
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
                        setState(() {});
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
                        setState(() {});
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
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: SizedBox(
              height: MediaQuery.of(context).size.height * 0.8,
              width: MediaQuery.of(context).size.width * 0.9,
              child: AppinioSwiper(
                cards: <Widget>[
                  Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 7,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Column(children: <Widget>[
                        const Expanded(
                          child: SizedBox(
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  width: 600,
                                  height: 399,
                                  image: AssetImage("assets/images/plat1.jpg"),
                                )),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        const Text('Nom du plat',
                            style:
                                TextStyle(fontSize: 40, color: Colors.black)),
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
                                              fontSize: 30,
                                              color: Colors.black)),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            offset: const Offset(0, 3),
                            blurRadius: 7,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ],
                      ),
                      child: Column(children: <Widget>[
                        const Expanded(
                          child: SizedBox(
                            child: Card(
                              clipBehavior: Clip.hardEdge,
                              child: FittedBox(
                                fit: BoxFit.cover,
                                child: Center(
                                    child: Image(
                                  width: 1239,
                                  height: 874,
                                  image: AssetImage("assets/images/plat2.jpg"),
                                )),
                              ),
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(top: 20.0),
                        ),
                        const Text('Nom du plat',
                            style:
                                TextStyle(fontSize: 40, color: Colors.black)),
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
                                              fontSize: 30,
                                              color: Colors.black)),
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
              )),
        ),

        // Stats
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          alignment: Alignment.center,
          child: ListView(
            padding: const EdgeInsets.all(8),
            children: <Widget>[
              const Padding(
                padding: EdgeInsets.only(top: 10.0),
              ),
              const Center(
                  child: Text("Stats de la semaine",
                      style: TextStyle(
                          fontSize: 35,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))),
              const Padding(
                padding: EdgeInsets.only(top: 40.0),
              ),
              const Center(
                  child: Text("Gaspillage évité",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: DChartBar(
                  data: const [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': 'Lundi', 'measure': 1},
                        {'domain': 'Mardi', 'measure': 1.25},
                        {'domain': 'Mercredi', 'measure': 0.5},
                        {'domain': 'Jeudi', 'measure': 0.29},
                        {'domain': 'Vendredi', 'measure': 2.5},
                        {'domain': 'Samedi', 'measure': 1.25},
                        {'domain': 'Dimanche', 'measure': 1.07},
                      ],
                    },
                  ],
                  xAxisTitle: 'Jours',
                  yAxisTitle: 'Gaspillage en kg',
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.yellow,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.yellow,
                  showBarValue: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
              ),
              const Center(
                  child: Text("Ma Diététique",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.5,
                child: DChartBar(
                  data: const [
                    {
                      'id': 'Bar',
                      'data': [
                        {'domain': 'Lundi', 'measure': 2100},
                        {'domain': 'Mardi', 'measure': 2300},
                        {'domain': 'Mercredi', 'measure': 1900},
                        {'domain': 'Jeudi', 'measure': 2400},
                        {'domain': 'Vendredi', 'measure': 2000},
                        {'domain': 'Samedi', 'measure': 1790},
                        {'domain': 'Dimanche', 'measure': 2220},
                      ],
                    },
                  ],
                  xAxisTitle: 'Jours',
                  yAxisTitle: 'Valeur énergétique kcal',
                  domainLabelPaddingToAxisLine: 16,
                  axisLineTick: 2,
                  axisLinePointTick: 2,
                  axisLinePointWidth: 10,
                  axisLineColor: Colors.green,
                  measureLabelPaddingToAxisLine: 16,
                  barColor: (barData, index, id) => Colors.green,
                  showBarValue: true,
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 50.0),
              )
            ],
          ),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                                builder: (context) =>
                                    const DescriptionAddRoute()),
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
                        const Text("Note moyenne",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
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
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
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

class DescriptionAddRoute extends StatelessWidget {
  const DescriptionAddRoute({super.key});

  Widget _buildPopupDialog3(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Plat ajouté au panier"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pop(context);
          },
          child: const Text('Fermer'),
        ),
      ],
    );
  }

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
                        const Text("Note moyenne",
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
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
                            style:
                                TextStyle(fontSize: 30, color: Colors.black)),
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
                Padding(
                  padding: const EdgeInsets.only(top: 25.0),
                  child: Center(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                _buildPopupDialog3(context),
                          );
                        },
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                        ),
                        child: const Text('Ajouter au panier',
                            style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}

class ParamRoute extends StatelessWidget {
  const ParamRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Paramètres'),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(
              children: const <Widget>[
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Paramètre 1'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Paramètre 2'),
                ),
                ListTile(
                  leading: Icon(Icons.settings),
                  title: Text('Paramètre 3'),
                ),
              ],
            ),
          ),
        ]));
  }
}

class PanierRoute extends StatelessWidget {
  const PanierRoute({super.key});

  Widget _buildPopupDialog2(BuildContext context) {
    return AlertDialog(
      title: const Text('Confirmation'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const <Widget>[
          Text("Réservation effectuée"),
        ],
      ),
      actions: <Widget>[
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
            Navigator.pop(context);
          },
          child: const Text('Fermer'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Panier'),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: ListView(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                const ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Entrée'),
                ),
                const ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Plat'),
                ),
                const ListTile(
                  leading: Icon(Icons.fastfood),
                  title: Text('Dessert'),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 50.0),
                ),
                Container(
                  alignment: Alignment.bottomCenter,
                  child: ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) =>
                            _buildPopupDialog2(context),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.black),
                    ),
                    child: const Text('Réserver',
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ),
                ),
              ],
            ),
          ),
        ]));
  }
}
