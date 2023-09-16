import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import '../models/task_view_model.dart';

class TaskController extends GetxController {
  final taskData = <Task>[].obs;
  final isLoading = false.obs;
  final errorMessage = ''.obs;

  final box = GetStorage();

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  Future<void> fetchData() async {
    isLoading(true);
    errorMessage('');

    try {
      // Checks if there is cached data
      if (box.read('taskData') != null) {
        // Loads data from local storage
        taskData.addAll(box.read('taskData'));
      }

      final response = await http.get(Uri.parse('https://nodedemo.com/login'));

      if (response.statusCode == 200) {
        final List<dynamic> jsonData = json.decode(response.body);

        // Converts API data to TaskModel and add to taskData
        for (var data in jsonData) {
          taskData.add(Task(
            image: data['image'],
            title: data['title'],
            description: data['description'],
            isFavorite: false,
          ));
        }

        // Cache the updated data locally
        box.write('taskData', taskData.toList());
      } else {
        // Handles non-200 status code (e.g., display an error message)
        errorMessage('Failed to fetch data. Status code: ${response.statusCode}');
      }
    } catch (error) {
      errorMessage('Failed to fetch data. Check your internet connection.');
    } finally {
      isLoading(false);
    }
  }
  void toggleFavorite(int index) {
    final task = taskData[index];
    task.isFavorite = !task.isFavorite;
    taskData[index] = task;
  }
}