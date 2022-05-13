import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:ge400mobileapp/widgets/button_widget.dart';
import 'package:ge400mobileapp/widgets/fileUpload_button_widget.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'api/firebase_api.dart';
import 'login.dart';

class fileUpload extends StatefulWidget {
  const fileUpload({ Key? key }) : super(key: key);
  @override
  _fileUploadState createState() => _fileUploadState();
}

class _fileUploadState extends State<fileUpload> {
  UploadTask? task;
  io.File? file;

  @override
  Widget build(BuildContext context) {
    final fileName = file != null ? basename(file!.path) : 'No File Selected';

    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Login()),
              );
            },
            child: Padding(
                padding: EdgeInsets.only(right: 10),
                child: Icon(Icons.exit_to_app)),
          )
        ],
        title: const Text('KHAS Student Portal'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FileButtonWidget(
                text: 'Select File',
                icon: Icons.attach_file,
                onClicked: selectFile,
              ),
              SizedBox(height: 8),
              Text(
                fileName,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 48),
              FileButtonWidget(
                text: 'Upload File',
                icon: Icons.cloud_upload_outlined,
                onClicked: uploadFile,
              ),
              SizedBox(height: 20),
              task != null ? buildUploadStatus(task!) : Container(),
            ],
          ),
        ),
      ),
    );
  }

Future selectFile() async {
  final result = await FilePicker.platform.pickFiles(allowMultiple: false);

  if (result == null) return;
  final path = result.files.single.path!;

  setState(() => file = io.File(path));
}

Future uploadFile() async {
  if (file == null) return;

  final fileName = basename(file!.path);
  final destination = 'files/$fileName';

  task = FirebaseApi.uploadFile(destination, file!);
  setState(() {});

  if (task == null) return;

  final snapshot = await task!.whenComplete(() {});
  final urlDownload = await snapshot.ref.getDownloadURL();

  print('Download-Link: $urlDownload');
}

Widget buildUploadStatus(UploadTask task) => StreamBuilder<TaskSnapshot>(
  stream: task.snapshotEvents,
  builder: (context, snapshot) {
    if (snapshot.hasData) {
      final snap = snapshot.data!;
      final progress = snap.bytesTransferred / snap.totalBytes;
      final percentage = (progress * 100).toStringAsFixed(2);

      return Text(
        '$percentage %',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      );
    } else {
      return Container();
    }
  },
);
}