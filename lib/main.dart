import 'package:flutter/material.dart';
import 'package:my_app/Gesture.dart';
import 'package:my_app/Home.dart';
import 'package:my_app/Routes.dart';
import 'package:my_app/layout.dart';
import 'package:my_app/router/router.dart';
import 'package:my_app/shopList.dart';
import 'package:my_app/shopperScreens/ChartModel.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyAppState extends ChangeNotifier {
  var count = 1;
  var fav = false;
  void countplus() {
    count++;
    notifyListeners();
  }

  void toggleFav() {
    fav = !fav;
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CatalogModel()),
        ChangeNotifierProvider(create: (context) => MyAppState()),
        ChangeNotifierProxyProvider<CatalogModel, CartModel>(
          create: (context) => CartModel(),
          update: (context, catalog, cart) {
            if (cart == null) throw ArgumentError.notNull('cart');
            cart.catalog = catalog;
            return cart;
          },
        ),
      ],
      child: MaterialApp.router(
        routerConfig: router(),
        title: 'Flutter Demo',
        theme: ThemeData(
          useMaterial3: true,
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        ),
        // home: const MyHomePage(title: 'Flutter Demo Home Page'),
      ),
    );
  }
}

class AppIndex extends StatefulWidget {
  const AppIndex({super.key});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  @override
  State<AppIndex> createState() => AppIndexState();
}

class AppIndexState extends State<AppIndex> {
  var selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const HomePage();
        break;
      case 1:
        page = const ShoppingList(products: [
          Product(name: 'Eggs'),
          Product(name: 'Flour'),
          Product(name: 'Chocolate chips'),
        ]);
        break;
      case 2:
        page = const Layout();
        break;
      case 3:
        page = const Routes();
        break;
      case 4:
        page = Gesture();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
          bottomNavigationBar: NavigationBar(
            onDestinationSelected: (int index) {
              setState(() {
                selectedIndex = index;
              });
            },
            selectedIndex: selectedIndex,
            destinations: const [
              NavigationDestination(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              NavigationDestination(
                icon: Icon(Icons.list),
                label: 'Shop List',
              ),
              NavigationDestination(
                icon: Icon(Icons.list),
                label: 'Layout',
              ),
              NavigationDestination(
                icon: Icon(Icons.list),
                label: 'Pages',
              ),
              NavigationDestination(
                icon: Icon(Icons.list),
                label: 'Gesture',
              ),
            ],
          ),
          body: Center(
            child: Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page,
              ),
            ),
          ));
    });
  }
}
