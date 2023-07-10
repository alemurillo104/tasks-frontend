import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../../../env.dart';
import '../model/task_model.dart';

class TaskRepository {
  Future<List<Task>?> getAllTasks() async {
    try {
      var url = Uri.http(Env.url, '/api/tareas');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('GET Correct!');
        final List<dynamic> decodedData = json.decode(response.body);
        List<Task> tasks = [];
        for (var jsonTask in decodedData) {
          tasks.add(Task.fromJson(jsonTask));
        }

        return tasks;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<List<Task>?> sortTasks() async {
    try {
      var url = Uri.http(Env.url, '/api/tareas/organizar');
      var response = await http.get(url);

      if (response.statusCode == 200) {
        print('GET Correct!');
        final List<dynamic> decodedData = json.decode(response.body);
        List<Task> tasks = [];
        for (var jsonTask in decodedData) {
          tasks.add(Task.fromJson(jsonTask));
        }

        return tasks;
      } else {
        print('Request failed with status: ${response.statusCode}.');
        return null;
      }
    } catch (e) {
      print(e);
      return null;
    }
  }
}
