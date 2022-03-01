
import 'package:bloc_pattern/blocs/appbarcolor_bloc/appbar.dart';
import 'package:bloc_pattern/blocs/backgroundcolor_bloc/background.dart';
import 'package:bloc_pattern/blocs/bottomNav_bloc/bottomNav.dart';
import 'package:bloc_pattern/blocs/increment_bloc/increment_count.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'appBarColorChange.dart';
import 'increment.dart';
import 'backgroundColorChange.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<BottomNav>(create: (context) => BottomNav()),
        BlocProvider<IncrementCount>(create: (context) => IncrementCount()),
        BlocProvider<Appbar>(create: (context) => Appbar()),
        BlocProvider<Backgrounds>(create: (context) => Backgrounds())
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pages = [Increment(), Background(), AppbarColor()];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNav, BottomNavState>(
      builder: (context, state) {
        return BlocBuilder<Appbar, AppBarState>(
          builder: (context, state1) {
            return Scaffold(
              drawer: Drawer(
                child: Container(),
              ),
              appBar: AppBar(
                backgroundColor: state1.color,
                title: const Text('Assessment'),
              ),
              body: pages[state.current],
              bottomNavigationBar: BottomNavigationBar(
                  backgroundColor: state1.color,
                  currentIndex: state.current,
                  onTap: (index) {
                    BlocProvider.of<BottomNav>(context).changeTab(index);
                  },
                  items: const [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.add), label: 'Increment'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.verified_outlined),
                        label: 'Background'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home), label: 'AppBar')
                  ]),
            );
          },
        );
      },
    );
  }
}
