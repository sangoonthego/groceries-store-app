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
  bool isGrid = true;

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
      appBar: AppBar(
        title: Text("Test Grid View"),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(isGrid ? Icons.list : Icons.grid_view),
            onPressed: onViewClicked,
          ),
        ],
      ),
      body: isGrid ? buildGridView() : buildListView(),
    );
  }

  // @override
  Widget buildListView() {
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

  Widget buildGridView() {
    return isGrid
        ? GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              // column want to display
              crossAxisCount: 2,
            ),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return GridTile(
                // tap on the item => InkWell
                child: InkWell(
                  child: Ink.image(
                    image: AssetImage("assets/images/apple2.png"),
                    fit: BoxFit.cover,
                  ),
                  onTap: () => itemSelection(item),
                ),
                footer: Container(
                  padding: const EdgeInsets.all(12),
                  alignment: Alignment.center,
                  child: Text(
                    item,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          )
        : const Center(child: Text("GridView is disabled"));
  }

  void onViewClicked() {
    setState(() {
      isGrid = !isGrid;
    });
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
