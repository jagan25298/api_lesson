import 'package:api_lesson/lesson_model.dart';
import 'package:api_lesson/lesson_service.dart';
import 'package:flutter/material.dart';

class LessonScreen extends StatefulWidget {
  const LessonScreen({super.key});

  @override
  State<LessonScreen> createState() => _LessonScreenState();
}

class _LessonScreenState extends State<LessonScreen> {
  late List<Items> _lessons = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadLesson();
    print('------inistate clicked');
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lesson API'),
      ),
      body: _lessons == null || _lessons.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: _lessons!.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(color: Colors.red),
                    child: Column(
                      children: [
                        Text('id:${_lessons[index].id}'),
                        Text('Name:${_lessons[index].name}'),
                        Text('CreatedAt:${_lessons[index].createdAt}'),
                        Text('Category:${_lessons[index].category}'),
                        Text('Duration:${_lessons[index].duration}'),
                        Text('Locked:${_lessons[index].locked}'),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }

  Future<void> _loadLesson() async {
    try {
      LessonModel response = await ApiServer.fetchLessons();
      print('_load lesson running');
      setState(
        () {
          _lessons = response.items!;
          print('${response.requestid}');
          print('${response.anykey}');
          print('${response.count}');
        },
      );
    } catch (e) {
      print('error loading lessons: $e');
    }
  }
}
