import 'dart:io';
import 'package:action_center_data_app/pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ReportForm extends StatefulWidget {
  const ReportForm({super.key});

  @override
  State<ReportForm> createState() => _ReportFormState();
}

class _ReportFormState extends State<ReportForm> {
  final reportFormGlobalKey = GlobalKey<FormState>();
  final ImagePicker picker = ImagePicker();
  List<File?> imageTemps = [null, null, null];

  Future<void> captureMedia(int index) async {
    try {
      final capturedImage = await picker.pickImage(source: ImageSource.camera);
      if (capturedImage == null) return;

      setState(() {
        imageTemps[index] = File(capturedImage.path);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Report Form"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(8),
        child: Form(
          key: reportFormGlobalKey,
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              const SizedBox(height: 5),
              // Media Picker
              Container(
                height: 200.0,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: imageTemps.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () => captureMedia(index),
                      child: Container(
                        width: 160.0,
                        color: Color.fromARGB(255, 255, 113, 113),
                        child: imageTemps[index] != null
                            ? Image.file(
                                imageTemps[index]!,
                                fit: BoxFit.fill,
                              )
                            : Center(child: Text("Upload Image")),
                      ),
                    );
                  },
                ),
              ),
              // Other form fields (Location, Incident Type, Description)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Location',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Incident Type',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Description',
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.secondary),
                ),
              ),
              TextFormField(
                autofocus: true,
                decoration: InputDecoration(
                  errorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedErrorBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Theme.of(context).colorScheme.primary),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  filled: true,
                  fillColor: Theme.of(context).colorScheme.onPrimary,
                  floatingLabelBehavior: FloatingLabelBehavior.never,
                  label: Text(
                    'Username',
                    style: TextStyle(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color:
                            Theme.of(context).colorScheme.onSecondaryContainer),
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter description';
                  }
                  return null;
                },
                onSaved: (value) {
                  // emailFinal = value!;
                },
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style:
                    TextStyle(color: Theme.of(context).colorScheme.secondary),
              ),
              // Submit Button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(200, 40),
                    foregroundColor: Theme.of(context).colorScheme.tertiary,
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5),
                    )),
                onPressed: () {
                  if (reportFormGlobalKey.currentState!.validate()) {
                    reportFormGlobalKey.currentState!.save();
                    reportFormGlobalKey.currentState!.reset();

                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return const MainPage();
                    }));
                  }
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
