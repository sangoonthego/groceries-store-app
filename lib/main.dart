import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // only 1 value
  final String str = "Text from my App";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;
  // final String str;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  double _width = 50;
  double _height = 50;

  // get index of Widget
  GlobalKey textKey = GlobalKey();
  GlobalKey btnKey = GlobalKey();

  void _incrementCounter() {
    setState(() {
      // buộc phải gọi hàm setState thì hệ thống mới
      // hiểu và build lại trạng thái
      _counter++;
      _width += 10;
      _height += 10;
    });

    RenderBox? renderText =
        textKey.currentContext?.findRenderObject() as RenderBox?;
    RenderBox? renderBtn =
        btnKey.currentContext?.findRenderObject() as RenderBox?;

    if (renderText != null && renderBtn != null) {
      print(renderText.localToGlobal(Offset.zero));
      print(renderText.size);

      print("----");
      print(renderBtn.localToGlobal(Offset.zero));
      print(renderBtn.size);

      // initialize object
      final myApp = btnKey.currentContext
          ?.findAncestorWidgetOfExactType<MyApp>();
      print(myApp?.str);
    }
  }

  // void _resetCounter() {
  //   setState(() {
  //     _counter = 0;
  //   });
  // }

  // void _decrementCounter() {
  //   setState(() {
  //     _counter--;
  //   });
  // }

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
            Text(
              'Increment or Decrement',
              // key: textKey,
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            Text(
              '$_counter',
              key: textKey,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Container(color: Colors.red, width: _width, height: _height),
          ],
        ),
      ),

      // floatingActionButton: Row(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       onPressed: _incrementCounter,
      //       tooltip: "Increment",
      //       child: const Icon(Icons.add),
      //     ),

      //     const SizedBox(width: 10),
      //     FloatingActionButton(
      //       onPressed: _resetCounter,
      //       tooltip: "Reset",
      //       child: const Icon(Icons.refresh),
      //     ),

      //     const SizedBox(width: 10),
      //     FloatingActionButton(
      //       onPressed: _decrementCounter,
      //       tooltip: "Decrement",
      //       child: const Icon(Icons.remove),
      //     ),
      // ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        key: btnKey,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
