import 'dart:io';

import 'package:dio/dio.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:path_provider/path_provider.dart';
class GroupScreen extends StatefulWidget {
  const GroupScreen({ Key? key }) : super(key: key);

  @override
  _GroupScreenState createState() => _GroupScreenState();
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text("Khas Student Portal"),
      ),
      body: Container(),
    );
  }
}
class _GroupScreenState extends State<GroupScreen> {
  late Future<ListResult> futureFiles;
  Map<int, double> downloadProgress = {};
  @override
  void initState(){
    super.initState();
    futureFiles = FirebaseStorage.instance.ref('/files').listAll();
  }
  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      automaticallyImplyLeading: false,
      centerTitle: true,
      title: const Text('KHAS Student Portal'),
    ),
    body: FutureBuilder<ListResult>(
      future: futureFiles,
      builder: (context, snapshot){
        if(snapshot.hasData){
          final files = snapshot.data!.items;

          return ListView.builder(
              itemCount: files.length,
              itemBuilder: (context, index){
                final file = files[index];
                double? progress = downloadProgress[index];

                return ListTile(
                  title: Text(file.name),
                  subtitle: progress != null
                  ?LinearProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.black,
                  )
                  :null,
                  trailing: IconButton(
                    icon: const Icon(
                      Icons.download,
                      color: Colors.black,
                    ),
                    onPressed: () => downloadFile(index, file),
                  ),
                );
              }
          );
        }else if(snapshot.hasError){
          return const Center(child: Text('Error occured'),);
        }else{
          return const Center(child: CircularProgressIndicator(),);
        }
      },
    ),
  );
    Future downloadFile(int index, Reference ref) async{
      final url = await ref.getDownloadURL();
      final tempDir = await getTemporaryDirectory();
      final path = File('${tempDir.path}/${ref.name}').toString();
      await Dio().download(
          url,
          path,
          onReceiveProgress: (received, total){
            double progress = received / total;
            setState(() {
              downloadProgress[index] = progress;
            });
        },
      );

      if(url.contains('.mp4')){
        await GallerySaver.saveVideo(path, toDcim:true);
      }else if(url.contains('.jpg') && url.contains('.png')){
        await GallerySaver.saveImage(path, toDcim:true);
      }

      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Downloaded ${ref.name}'))
      );
    }
}