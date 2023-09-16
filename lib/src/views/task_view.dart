import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'task_detail_screen.dart';
import '../controllers/task_view_controller.dart';
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

  @override
  Widget build(BuildContext context) {
    // Initializes the controller
    final TaskController taskController = Get.put(TaskController());

    return Scaffold(
      appBar: AppBar(
        title: Text('Onboarding Flutter Test'),
      ),
      body: Obx(
        () {
          final isLoading = taskController.isLoading.value;
          final errorMessage = taskController.errorMessage.value;
          final taskData = taskController.taskData;

          if (isLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (errorMessage.isNotEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    errorMessage,
                    style: TextStyle(fontSize: 18),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // Retries fetching data
                      taskController.fetchData();
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          } else {
            return ListView.builder(
              itemCount: taskData.length,
              itemBuilder: (ctx, index) {
                final cardData = taskData[index];
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
                            image: NetworkImage(cardData.image),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      ListTile(
                        title: Text(
                          cardData.title,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          cardData.description,
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            cardData.isFavorite
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            // Toggle favorite logic
                            taskController.toggleFavorite(index);
                          },
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Calls the fetchData function when the button is pressed
          taskController.fetchData();
        },
        child: Icon(Icons.refresh),
      ),
    );
  }
}
