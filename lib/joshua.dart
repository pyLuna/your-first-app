import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';
import 'package:provider/provider.dart';
import 'package:your_first_app/joshuawidgets/adaptive_layoutjjc.dart';
import 'package:your_first_app/joshuawidgets/app_themejjc.dart';
import 'package:your_first_app/joshuawidgets/favoritesjjc.dart';
import 'package:your_first_app/joshuawidgets/focused_widget.dart';
import 'package:your_first_app/joshuawidgets/font_variation.dart';
import 'package:your_first_app/joshuawidgets/image_internet.dart';
import 'package:your_first_app/joshuawidgets/parallaxlistjjc.dart';
import 'package:your_first_app/joshuawidgets/return_data.dart';
import 'package:your_first_app/joshuawidgets/send_data.dart';
import 'package:your_first_app/joshuawidgets/snackbar_demo.dart';
import 'package:your_first_app/joshuawidgets/swipe_dismiss.dart';
import 'package:your_first_app/main.dart';
import 'joshuawidgets/difflisttypesjjc.dart';
import 'joshuawidgets/draggable_ui.dart';
import 'joshuawidgets/gesture_tap.dart';
import 'joshuawidgets/layoutjjc.dart';
import 'joshuawidgets/listviewjjc.dart';
import 'joshuawidgets/horizontallistjjc.dart';
import 'joshuawidgets/gridlistjjc.dart';
import 'joshuawidgets/interactivity.dart';
import 'joshuawidgets/playpause_vid.dart';
import 'joshuawidgets/shortcuts.dart';
import 'joshuawidgets/spacedlistjjc.dart';
import 'joshuawidgets/longlistjjc.dart';
import 'joshuawidgets/floatingappbarjjc.dart';
import 'joshuawidgets/touch_ripple.dart';

void main() {
  runApp(const JoshuaPage());
}

class JoshuaPage extends StatelessWidget {
  const JoshuaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'Name App',
        theme: ThemeData(
          useMaterial3: true,
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.blueAccent,
          ),
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  var current = WordPair.random();
  var favorites = <WordPair>[];
  var history = <WordPair>[];

  GlobalKey? historyListKey;

  void addWord() {
    history.insert(0, current);
    var animatedList = historyListKey?.currentState as AnimatedListState?;
    animatedList?.insertItem(0);
    notifyListeners();
  }

  void getNext() {
    current = WordPair.random();
  }

  void toggleFavorite([WordPair? pair]) {
    pair = pair ?? current;
    if (favorites.contains(pair)) {
      favorites.remove(pair);
    } else {
      favorites.add(pair);
    }
    notifyListeners();
  }

  void removeFavorite(word) {
    favorites.remove(word);
    notifyListeners();
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

// HomePage State
class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    Widget page;
    switch (selectedIndex) {
      case 0:
        page = const GeneratorPage();
        break;
      case 1:
        page = const FavoritesPage();
        break;
      case 2:
        page = const MyLayout();
        break;
      case 3:
        page = const MyListView();
        break;
      case 4:
        page = const HorizontalList();
        break;
      case 5:
        page = const MyGridView();
        break;
      case 6:
        page = DiffList(
          items: List<ListItem>.generate(
            1000,
            (i) => i % 6 == 0
                ? HeadingItem('Heading $i')
                : MessageItem('Sender $i', 'Message Body $i'),
          ),
        );
        break;
      case 7:
        page = const SpacedList();
        break;
      case 8:
        page = const LongList();
        break;
      case 9:
        page = const FloatingAppBar();
        break;
      case 10:
        page = const ParallaxList();
        break;
      case 11:
        page = const Adaptive();
        break;
      case 12:
        page = const AppTheme();
        break;
      case 13:
        page = const Variation();
        break;
      case 14:
        page = const Interactivity();
      case 15:
        page = const GestureTap();
        break;
      case 16:
        page = const DraggableUI();
      case 17:
        page = const TouchRipple();
        break;
      case 18:
        page = const SwipeDismiss();
        break;
      case 19:
        page = const SnackBarDemo();
        break;
      case 20:
        page = const ShortCuts();
        break;
      case 21:
        page = const FocusedWidget();
        break;
      case 22:
        page = const ImageViewer();
        break;
      case 23:
        page = const VideoDemo();
        break;
      case 24:
        page = const SendDataToScreen();
        break;
      case 25:
        page = const ReturnHomeScreen();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              }),
          title: const Text('Joshua'),
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.home),
                tooltip: 'Home',
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const MyApp()));
                }),
          ],
        ),
        body: Row(
          children: [
            LayoutBuilder(
              builder: (context, contraints) {
                return SingleChildScrollView(
                  child: ConstrainedBox(
                    constraints: BoxConstraints(
                      minHeight: constraints.maxHeight,
                    ),
                    child: IntrinsicHeight(
                      child: NavigationRail(
                        extended: constraints.maxWidth >= 600,
                        destinations: const [
                          NavigationRailDestination(
                            icon: Icon(Icons.home),
                            label: Text('Home'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.favorite),
                            label: Text('Favorites'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.image),
                            label: Text('Layout'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.list),
                            label: Text('List View'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.compare_arrows_outlined),
                            label: Text('Horizontal List'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.grid_4x4),
                            label: Text('Grid List'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.message),
                            label: Text('Mixed List'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.space_bar),
                            label: Text('Spaced List'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.arrow_downward),
                            label: Text('Long List'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.square),
                            label: Text('Floating AppBar'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.image),
                            label: Text('Parallax Items'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.aspect_ratio),
                            label: Text('Adaptive Layout'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.design_services),
                            label: Text('App Theme'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.font_download),
                            label: Text('Font Variation'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.graphic_eq),
                            label: Text('Shaders'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.fingerprint),
                            label: Text('Gesture Tap'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.drag_handle),
                            label: Text('Draggable ui'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.touch_app),
                            label: Text('Touch Ripple'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.swipe),
                            label: Text('Dismiss on Swipe'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.notifications_active),
                            label: Text('Snackbar'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.keyboard),
                            label: Text('Shortcuts'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.center_focus_strong_rounded),
                            label: Text('Focused Widget'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.image_search),
                            label: Text('Focused Widget'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.movie),
                            label: Text('Video Demo'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.send),
                            label: Text('Send data to another'),
                          ),
                          NavigationRailDestination(
                            icon: Icon(Icons.repeat_rounded),
                            label: Text('Return data'),
                          ),
                        ],
                        selectedIndex: selectedIndex,
                        onDestinationSelected: (value) {
                          setState(() {
                            selectedIndex = value;
                          });
                        },
                      ),
                    ),
                  ),
                );
              },
            ),
            Expanded(
              child: Container(
                color: Theme.of(context).colorScheme.primaryContainer,
                child: page, // ← Here.
              ),
            ),
          ],
        ),
      );
    });
  }
}

// text generator, index = 0
PreferredSizeWidget appBarBuilder(String title, bool? isCenter) {
  return AppBar(
    title: Text(title),
    centerTitle: isCenter,
    elevation: 1,
  );
}
