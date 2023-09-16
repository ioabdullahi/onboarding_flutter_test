import 'package:flutter/material.dart';

class TaskOne extends StatefulWidget {

 TaskOne({super.key});
  @override
  State<TaskOne> createState() => _TaskOneState();
}

class _TaskOneState extends State<TaskOne> {
  final List<Map<String, dynamic>> dummyData = [
    {
      'image': 'image_url_1',
      'title': 'Card 1',
      'description': 'Description for Card 1',
      'isFavorite': false, // Added the field for tracking favorite state
    },
    {
      'image': 'image_url_2',
      'title': 'Card 2',
      'description': 'Description for Card 2',
      'isFavorite': false, // Added the field for tracking favorite state
    },
    // Add more dummy data entries as needed
  ];

  // Function to toggle the favorite state
  void toggleFavorite(int index) {
    setState(() {
      dummyData[index]['isFavorite'] = !dummyData[index]['isFavorite'];
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task One"),
      ),
      body: ListView.builder(
        itemCount: dummyData.length ,
        itemBuilder: (ctx, index){
          final cardData =  dummyData[index];
          return Card(
            margin: EdgeInsets.all(10),
            elevation: 3,
            child: Column(
              children: [
                Container(
                  height: 200,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(cardData['image 1']!),
                    fit: BoxFit.cover,
                    )
                  ),
                ),
                ListTile(
                  title: Text(
                    cardData['title']!,
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  subtitle: Text(
                    cardData['description']!,
                    style: TextStyle(
                      fontSize: 17.0,
                    ),
                  ),
                  trailing: IconButton(
                    icon: Icon(
                      cardData['isFavorite']
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                    ),
                    onPressed: () {
                      toggleFavorite(index);
                    },
                ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}