import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
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
  bool isLoading = false;
  Future<void> fetchData() async {
    setState(() {
      isLoading = true;
    });
  // Function to toggle the favorite state in task 2
  void toggleFavorite(int index) {
    setState(() {
      dummyData[index]['isFavorite'] = !dummyData[index]['isFavorite'];
    });
  }
  
 try {
      final response = await http.get(Uri.parse('https://timeapi.io/api/Time/current/zone?timeZone=Europe/Amsterdam'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);
        // Assuming jsonData is a list of data objects, you may need to adjust this based on your API response structure.

        for (var data in jsonData) {
          dummyData.add({
            'image': data['image'],
            'title': data['title'],
            'description': data['description'],
            'isFavorite': false,
          });
        }
      }
    } catch (error) {
      // Handle errors here
      print('Error fetching data: $error');
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
                            // Toggle favorite logic
                          },
                        ),
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
