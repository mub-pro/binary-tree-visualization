import 'package:binary_tree_visualization/components/node.dart';
import 'package:binary_tree_visualization/tree.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController? controller = TextEditingController();
  int? value;

  @override
  void initState() {
    controller!.addListener(() {});
    super.initState();
  }

  Tree tree = Tree();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 2,
                      child: TextField(
                        controller: controller,
                        keyboardType: TextInputType.number,
                        onChanged: (v) {
                          setState(() {
                            value = int.parse(v);
                          });
                        },
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: "Value",
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.black, width: 2.0),
                          ),
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          Node? node =
                              tree.insert(value!, MediaQuery.of(context).size);
                          tree.nodes.add(node!);
                          // tree.traverse();
                        });
                        controller!.clear();
                      },
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 14, horizontal: 30),
                        decoration: BoxDecoration(
                            // border: Border.all(color: Colors.white, width: 2),
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: const Text(
                          'INSERT',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * tree.nodes.length,
                child: Stack(
                  children: List.generate(tree.nodes.length,
                      (index) => NodeWidget(node: tree.nodes[index])),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
