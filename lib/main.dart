import 'dart:async';

import 'package:flutter/material.dart';
import 'package:temel_widget/models/student_model.dart';
import 'package:temel_widget/pages/student_add.dart';
import 'package:temel_widget/pages/student_edit.dart';

void main(List<String> args) {
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String titleApp = "Merhaba Öğrenci Uygulamam";
  Student selectedStudent = Student.withId(0, "", "", "", 0);

  List<Student> students = [
    Student.withId(
        1,
        'Sercan',
        'Özbek',
        'https://cdn.pixabay.com/photo/2021/05/10/00/14/smile-6242237_960_720.jpg',
        45),
    Student.withId(
        2,
        'Nazlıcan',
        'Özbek',
        'https://cdn.pixabay.com/photo/2021/10/26/02/41/woman-6742445_960_720.jpg',
        80),
    Student.withId(
        3,
        'Aysel',
        'Özbek',
        'https://cdn.pixabay.com/photo/2021/09/03/13/32/portrait-6595821_960_720.jpg',
        20)
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(titleApp),
      ),
      body: buildBody(context),
    );
  }

  FutureOr onGoBack(dynamic value) {
    setState(() {});
  }

  Column buildBody(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage(students[index].image!),
                  ),
                  title: Text(students[index].firstName! +
                      " " +
                      students[index].lastName! +
                      " [" +
                      students[index].getStatus +
                      ']'),
                  subtitle: Text('Sınavdan Aldığı Not : ' +
                      students[index].gradle.toString()),
                  trailing: builderIcon(students[index].gradle!),
                  onTap: () {
                    setState(() {
                      selectedStudent = students[index];
                    });
                  },
                );
              }),
        ),
        Text('Seçilen Öğrenci : ' + selectedStudent.firstName!),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(Colors.redAccent)),
                child: Row(
                  children: const [
                    Icon(Icons.add),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Yeni Öğrenci',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => StudentAdd(student: students));
                  Navigator.push(context, route).then(onGoBack);
                },
              ),
            ),
            Expanded(
              child: ElevatedButton(
                  child: Row(
                    children: const [
                      Icon(Icons.update),
                      SizedBox(
                        width: 5,
                      ),
                      Text('Güncelle', style: TextStyle(fontSize: 12)),
                    ],
                  ),
                  onPressed: () {
                    Route route = MaterialPageRoute(
                        builder: (context) => StudentEdit(
                              selectedStudent: selectedStudent,
                            ));
                    Navigator.push(context, route).then(onGoBack);
                  }),
            ),
            Expanded(
              child: ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.amber)),
                child: Row(
                  children: const [
                    Icon(Icons.delete),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      'Sil',
                      style: TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                onPressed: () {
                  setState(() {
                    students.remove(selectedStudent);
                  });
                  var alert = AlertDialog(
                    title: const Text('Silindi !'),
                    content: Text(selectedStudent.firstName!),
                  );
                  showDialog(
                      context: context,
                      builder: (BuildContext context) => alert);
                },
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget builderIcon(int not) {
    if (not > 50) {
      return const Icon(Icons.check);
    } else if (not < 50 && not > 40) {
      return const Icon(Icons.error);
    } else {
      return const Icon(Icons.close);
    }
  }
}
