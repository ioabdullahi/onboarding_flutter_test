import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'task_detail_screen.dart';
// TaskViewScreen displays a list of cards with images, titles, and descriptions.
class TaskViewScreen extends StatefulWidget {
  @override
  _TaskViewScreenState createState() => _TaskViewScreenState();
}

class _TaskViewScreenState extends State<TaskViewScreen> {
  final List<Map<String, dynamic>> dummyData = [
    {
      'image': 'image_url_1',
      'title': 'Card 1',
      'description': 'Description for Card 1',
      'isFavorite': false,
    },
    {
      'image': 'image_url_2',
      'title': 'Card 2',
      'description': 'Description for Card 2',
      'isFavorite': false,
    },
  ];
    void toggleFavorite(int index) {
    setState(() {
      dummyData[index]['isFavorite'] = !dummyData[index]['isFavorite'];
    });
  }
  bool isLoading = false;
  String errorMessage = '';
  // fetchData fetches data from an API endpoint and updates the screen.
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
    
    
    try {
      final response = await http.get(Uri.parse('https://nodedemo.com/login'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        for (var data in jsonData) {
          dummyData.add({
            'image': data['image'],
            'title': data['title'],
            'description': data['description'],
            'isFavorite': false,
          });
        }
      } else {
      // Handles non-200 status code (e.g., display an error message)
      print('Error: ${response.statusCode}');
      // Optionally, you can set an error message and show a retry button.
      setState(() {
        errorMessage = 'Failed to fetch data. Status code: ${response.statusCode}';
      });
    }
    } catch (error) {
      // logic that Handles errors
      print('Error fetching data: $error');
      setState(() {
      errorMessage = 'Failed to fetch data. Check your internet connection.';
    });
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding Flutter Test'),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
            : errorMessage.isNotEmpty
            // Display an error message and retry button.
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  errorMessage,
                  style: TextStyle(color: Colors.red),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Retry fetching data
                    fetchData();
                  },
                  child: Text('Retry'),
                ),
              ],
            ),
          )
          : ListView.builder(
              itemCount: dummyData.length,
              itemBuilder: (ctx, index) {
                final cardData = dummyData[index];
                return Card(
                  elevation: 3,
                  margin: EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                        height: 200,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(cardData['image']),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          cardData['title'],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          cardData['description'],
                          style: TextStyle(
                            fontSize: 16,
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
                            // this Toggles favorite logic
                            toggleFavorite(index);
                          },
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (ctx) => TaskDetailScreen(cardData),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Call the fetchData function when the button is pressed
          fetchData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
