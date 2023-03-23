import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  final List<Arts> arts = [
    Arts(
      name: 'Literature',
      genres: 'Poetry, fiction, nonfiction, drama, and prose',
      image: 'https://images.pexels.com/photos/3646172/pexels-photo-3646172.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      favoriteExamples: [
        'Divine Comedy: Inferno by Dante',
        'Faust by Johann Wolfgang von Goethe',
        'One Hundred Years of Solitude by Gabriel García Márquez',
        'To Kill a Mockingbird by Harper Lee'
      ],
    ),
    Arts(
        name: 'Music',
        genres: 'Rock, instrumental, Soul, Pop, Rock, Jazz, Electronic Dance Music, R&B, Country',
        image: 'https://images.pexels.com/photos/2956143/pexels-photo-2956143.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
        favoriteExamples: [
          'Rock - Queen',
          'Instrumental - Beethoven',
          'Soul music - Aretha Franklin',
          'Pop - Michael Jackson'
        ],
    ),
    Arts(
      name: 'Architecture',
      genres: 'Creek and Roman, Gothic, Modernism, Mughal',
      image: 'https://images.pexels.com/photos/13185742/pexels-photo-13185742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1',
      favoriteExamples: [
        'Acropolis complex in Athens and the Colosseum in Rome',
        'Notre-Dame in Paris, France',
        'La Sagrada Familia by Antonio Gaudi, Barcelona, Spain',
        'Taj Mahal, Agra, India'
      ],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Favorite Art Forms',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Favorite Art Forms'),
        ),
        body: ListView.builder(
          itemCount: arts.length,
          itemBuilder: (BuildContext context, int index) {
            return ArtCard(art: arts[index]);
          },
        ),
      ),
    );
  }
}


class Arts {
  final String name;
  final String genres;
  final String image;
  final List<String> favoriteExamples;


  Arts(
      {required this.name,
        required this.genres,
        required this.image,
        required this.favoriteExamples});
}


class ArtCard extends StatefulWidget {
  final Arts art;


  ArtCard({required this.art});


  @override
  _ArtCardState createState() => _ArtCardState();
}


class _ArtCardState extends State<ArtCard> {
  bool _showTodos = false;


  void _toggleTodos() {
    setState(() {
      _showTodos = !_showTodos;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Card(
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TodoDescriptionPage(
                art: widget.art,
              ),
            ),
          );
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              widget.art.image,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.art.name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    widget.art.genres,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: _toggleTodos,
                        child: Text(
                          _showTodos ? 'Hide Favorites' : 'Show Favorites',
                          style: TextStyle(
                            color: Colors.blue,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.favorite_border),
                      ),
                    ],
                  ),
                  if (_showTodos)
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: widget.art.favoriteExamples
                          .map(
                            (todo) => Padding(
                          padding: EdgeInsets.symmetric(
                            vertical: 4.0,
                            horizontal: 24.0,
                          ),
                          child: Row(
                            children: [
                              Icon(
                                Icons.check,
                                color: Colors.green,
                              ),
                              SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  todo,
                                  style: TextStyle(
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                          .toList(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class TodoDescriptionPage extends StatelessWidget {
  final Arts art;


  TodoDescriptionPage({required this.art});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(art.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              art.image,
              fit: BoxFit.cover,
              height: 200.0,
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Things to Do',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: art.favoriteExamples
                        .map(
                          (todo) => Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 4.0,
                          horizontal: 24.0,
                        ),
                        child: Row(
                          children: [
                            Icon(
                              Icons.check,
                              color: Colors.green,
                            ),
                            SizedBox(width: 8.0),
                            Expanded(
                              child: Text(
                                todo,
                                style: TextStyle(
                                  fontSize: 16.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                        .toList(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}