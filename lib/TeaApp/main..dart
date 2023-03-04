import 'package:flutter/material.dart';

void main() {
  runApp(TeaApp());
}

class TeaApp extends StatelessWidget {
  final TeaController controller = TeaController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Teas around the world",
      theme: ThemeData(primarySwatch: Colors.green),
      home: TeaView(controller: controller),
    );
  }
}

//model
class Tea {
  final String name;
  final String origin;
  final String description;
  final String imageUrl;

  Tea({
    required this.name,
    required this.origin,
    required this.description,
    required this.imageUrl,
  });
}

//controller

class TeaController {
  List<Tea> _teas = [
    Tea(
      name: "Green tea",
      origin: "China",
      description:
      "Green tea is made from Camellia sinensis leaves and buds that have not undergone the same withering and oxidation process used to make oolong teas and black teas.",
      imageUrl:
      "https://upload.wikimedia.org/wikipedia/commons/3/36/Green_tea_3_appearances.jpg",
    ),
    Tea(
      name: "Assam tea",
      origin: "India",
      description:
      "Assam tea is a black tea named after the region of its production, Assam, India.",
      imageUrl:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/8/8a/Cup_of_black_tea.JPG/2560px-Cup_of_black_tea.JPG",
    ),
    Tea(
      name: "Matcha tea",
      origin: "Japan",
      description:
      "Matcha is a finely ground powder of specially grown and processed green tea leaves. It is special in two aspects of farming and processing: the green tea plants for matcha are shade-grown for three to four weeks before harvest, and the stems and veins are removed during processing.",
      imageUrl:
      "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d9/Matcha_Scoop.jpg/1920px-Matcha_Scoop.jpg",
    ),
  ];

  List<Tea> get teas => _teas;
}

class TeaView extends StatelessWidget {
  final TeaController controller;

  TeaView({required this.controller});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Teas around the world"),
      ),
      body: ListView.builder(
        itemCount: controller.teas.length,
        itemBuilder: (context, index) {
          Tea teass = controller.teas[index];
          return ListTile(
            leading: Image.network(
              teass.imageUrl,
              height: 80,
            ),
            title: Text(teass.name),
            subtitle: Text(teass.origin),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TeaDetail(tea: teass),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TeaDetail extends StatelessWidget {
  final Tea tea;

  TeaDetail({required this.tea});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tea.name),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(tea.imageUrl, height: 200, fit: BoxFit.cover),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              tea.description,
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}