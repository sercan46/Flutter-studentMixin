import 'package:flutter/material.dart';
import 'package:temel_widget/models/student_model.dart';
import 'package:temel_widget/validations/student_validator.dart';

class StudentEdit extends StatefulWidget {
  Student? selectedStudent;

  StudentEdit({Key? key, this.selectedStudent}) : super(key: key);

  @override
  _StudentEditState createState() => _StudentEditState();
}

class _StudentEditState extends State<StudentEdit> with StudentValidatonMixin {
  var student = Student("", "", 0);
  var formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Öğrenci Güncelle'),
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
      initialValue: widget.selectedStudent?.firstName,
      decoration:
          const InputDecoration(labelText: 'Öğrenci adı', hintText: 'Sercan'),
      validator: (value) => validateFirstName(value!),
      onSaved: (value) {
        widget.selectedStudent?.firstName = value;
      },
    );
  }

  TextFormField builderLastNameField() {
    return TextFormField(
      initialValue: widget.selectedStudent?.lastName,
      decoration:
          const InputDecoration(labelText: 'Öğrenci soyadı', hintText: 'Özbek'),
      validator: (value) => validateLasttName(value!),
      onSaved: (value) {
        widget.selectedStudent?.lastName = value;
      },
    );
  }

  TextFormField builderGradleField() {
    return TextFormField(
      initialValue: widget.selectedStudent?.gradle.toString(),
      decoration:
          const InputDecoration(labelText: 'Öğrenci notu', hintText: '80'),
      validator: (value) => validateGradle(value!),
      onSaved: (value) {
        widget.selectedStudent?.gradle = int.parse(value!);
      },
    );
  }

  Widget builderSave() {
    return ElevatedButton(
        onPressed: () {
          if (formKey.currentState!.validate()) {
            formKey.currentState!.save();
            widget.selectedStudent?.image =
                "https://cdn.pixabay.com/photo/2021/05/10/00/14/smile-6242237_960_720.jpg";
            student.id = 5;
            Navigator.pop(context);
          }
        },
        child: const Text('Öğrenci Güncelle'));
  }
}
