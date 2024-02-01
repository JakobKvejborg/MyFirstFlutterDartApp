import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'second_screen.dart';
import 'third_screen.dart';

//____________________________________________________________________________
//    'FLUTTER RUN' IN CONSOLE TO RUN PROGRAM
//     CTRL + S SAVE
//     SHIFT + R HOT RESTART (updates window)
// https://api.flutter.dev/flutter/material/Icons-class.html ICONS
//     CTRL + SHIFT + Y to show console/TERMINAL
//     RIGHT-CLICK lib folder 'reveal in File Explorer'
//     CTRL + C closes shit
//____________________________________________________________________________
class ShoppingListState extends ChangeNotifier {
  List<String> items = [];

  void addItem(String item) {
    items.add(item);
    notifyListeners(); // Notify listeners of the change
  }

  void removeItem(int index) {
    items.removeAt(index);
    notifyListeners(); // Notify listeners of the change
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ShoppingListState(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'Jakobs test-app'), // name in the top of the screen
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  int _counter2 = 0;

// METHOD INCREASE COUNTER WHEN BUTTON IS PRESSED
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

// METHOD DECREASE COUNTER WHEN BUTTON IS PRESSED
  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  // METHOD BUTTON 4 DECREASE BY 10
  void _decreaseButton3By10() {
    setState(() {
      _counter -= 10;
    });
  }

  // METHOD BUTTON 3 INCREASE BY 10
  void _increaseButton3By10() {
    setState(() {
      _counter += 10;
    });
  }

  // METHOD BUTTON 6 RESET
  void _resetButton6() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
                'This text shows in the middle of the screen.'), // text middle of the screen
            Text(
              '$_counter', // the number in the middle of the screen
              style: TextStyle(
                fontSize:
                    24, // how big the number in the middle of the screen is
                color: _counter >= 0
                    ? Colors.green
                    : Colors
                        .red, // if the counter is bigger than 0, its color is green
                // _counter >= 0 is input 1, can be true or false. Colors.green is input 2, happens if input 1 is true. Colors.red is input 3, happens if input 3 is false.
              ),
            ),

            // FIRST 'Row' OF BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                // BUTTON 1
                FloatingActionButton(
                  // button 1
                  onPressed:
                      _decrementCounter, // method called when the button is pressed
                  tooltip: 'Decrement', // text tip button
                  child: const Icon(Icons.remove), // minus symbol inside button
                ),
                SizedBox(width: 10), // Add some spacing between the two buttons

                // BUTTON 2
                FloatingActionButton(
                  // button 2
                  onPressed:
                      _incrementCounter, // method called when the button is pressed
                  tooltip: 'Increment', // text tip button
                  child: const Icon(Icons.add),
                ),
              ],
            ),

            // SECOND 'Row' OF BUTTONS
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // BUTTON 3
              children: <Widget>[
                FloatingActionButton(
                  // button 3
                  onPressed:
                      _decreaseButton3By10, // method called when the button is pressed
                  tooltip: 'Decrement by 10', // text tip button
                  child: const Icon(Icons.remove), // minus symbol inside button
                ),

                SizedBox(width: 10), // the distance between the two buttons

                // BUTTON 4
                FloatingActionButton(
                  // button 4
                  onPressed:
                      _increaseButton3By10, // method called when the button is pressed
                  tooltip: 'Increment by 10', // text tip button
                  child: const Icon(Icons.add), // plus symbol inside button
                ),

                SizedBox(width: 10), // the distance between the two buttons

                // BUTTON 5
                FloatingActionButton(
                  // button 5
                  onPressed: null, // method called when the button is pressed
                  tooltip: 'Cant press this button', // text tip button
                  child: const Icon(
                      Icons.access_time), // plus symbol inside button
                ),

                // BUTTON 6 HOME BUTTON
                FloatingActionButton(
                  // button 6 home
                  onPressed:
                      _resetButton6, // method called when the button is pressed
                  tooltip: 'Reset button', // text tip button
                  child: const Icon(
                      Icons.restart_alt), // minus symbol inside button
                ),

                // BUTTON TO OPEN SECOND PAGE
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          SecondScreen(), // Creating an instance of the SecondScreen widget
                    ));
                  },
                  child: const Icon(Icons.launch),
                ),

          
                
                //___________________________

                // BUTTON TO OPEN THIRD PAGE
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ThirdScreen(), // Creating an instance of the SecondScreen widget
                    ));
                  },
                  child: const Icon(Icons.home),
                ),
                //____________________________
              ],
            ),
          ],
        ),
      ),
    );
  }
}
