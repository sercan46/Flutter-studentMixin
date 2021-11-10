import 'package:flutter/material.dart';
import 'package:temel_widget/models/student_model.dart';
import 'package:temel_widget/validations/student_validator.dart';

class StudentAdd extends StatefulWidget {
  List<Student>? student;

  StudentAdd({Key? key, this.student}) : super(key: key);

  @override
  _StudentAddState createState() => _StudentAddState();
}

class _StudentAddState extends State<StudentAdd> with StudentValidatonMixin {
  var student = Student("", "", 0);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Öğrenci Ekle'),
        ),
        body: Container(
          margin: const EdgeInsets.all(20.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                builderFirstNameField(),
                builderLastNameField(),
                builderGradleField(),
                builderSave()
              ],
            ),
          ),
        ));
  }

  TextFormField builderFirstNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Öğrenci adı', hintText: 'Sercan'),
      validator: (value) => validateFirstName(value!),
      onSaved: (value) {
        student.firstName = value;
      },
    );
  }

  TextFormField builderLastNameField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Öğrenci soyadı', hintText: 'Özbek'),
      validator: (value) => validateLasttName(value!),
      onSaved: (value) {
        student.lastName = value;
      },
    );
  }

  TextFormField builderGradleField() {
    return TextFormField(
      decoration:
          const InputDecoration(labelText: 'Öğrenci notu', hintText: '80'),
      validator: (value) => validateGradle(value!),
      onSaved: (value) {
        student.gradle = int.parse(value!);
      },
    );
  }

  Widget builderSave() {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            student.image =
                "https://cdn.pixabay.com/photo/2021/05/10/00/14/smile-6242237_960_720.jpg";
            student.id = 5;
            widget.student!.add(student);
            Navigator.pop(context);
          }
        },
        child: const Text('Öğrenci EKle'));
  }
}
