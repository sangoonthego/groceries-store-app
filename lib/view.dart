import "package:flutter/material.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return new MaterialApp(debugShowCheckedModeBanner: false, home: MyView());
  }
}

class MyView extends StatefulWidget {
  const MyView({super.key});

  @override
  State<MyView> createState() => _MyViewState();
}

class _MyViewState extends State<MyView> {
  List<String> items = [
    "Anna",
    "Brandon",
    "Emma",
    "Lucas",
    "Murphy",
    "Sophia",
    "Zahara",
    "Yasmin",
  ];
  @override
  Widget build(BuildContext context) {
    //return const Placeholder();
    return Scaffold(
      appBar: AppBar(title: Text("Test Grid View"), centerTitle: true),
      body: buildList(),
    );
  }

  // @override
  Widget buildList() {
    return ListView.builder(
      itemCount: items.length,
      // callback func => build each child Widget of list at corresponding idx
      itemBuilder: (context, index) {
        //define item at corres idx
        final item = items[index];

        return ListTile(
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage("assets/images/apple2.png"),
          ),
          title: Text(item),
          subtitle: Text("Subtitle $index"),
          onTap: () => itemSelection(item),
        );
      },
    );
  }

  void itemSelection(String item) {
    final snackBar = SnackBar(
      content: Text(
        "Selected $item...",
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
      backgroundColor: Colors.red,
    );

    ScaffoldMessenger.of(context)
      ..removeCurrentSnackBar()
      ..showSnackBar(snackBar);
  }
}
