import 'dart:core';

class TaskModel {
  String? key;
  String? title;
  String? category;
  String? description;
  String? image;
  String? taskPriority;
  String? time;
  String? date;
  String? show;
  String? progress;
  String? status;

  TaskModel(
      {required this.key,
      required this.time,
      required this.date,
      required this.taskPriority,
      required this.description,
      required this.category,
      required this.title,
      required this.image,
      required this.show,
      required this.progress,
      required this.status});

  TaskModel.fromMap(Map<String, dynamic> res) {
    key = res['key'];
    title = res['title'];
    category = res['category'];
    description = res['description'];
    image = res['image'];
    taskPriority = res['taskPriority'];
    show = res['show'];
    time = res['time'];
    date = res['date'];
    progress = res['progress'];
    status = res['status'];
  }

  Map<String, Object?> toMap() {
    return {
      'key': key,
      'title': title,
      'category': category,
      'description': description,
      'image': image,
      'periority': taskPriority,
      'time': time,
      'date': date,
      'show': show,
      'status': status,
      'progress': progress,
    };
  }
}
