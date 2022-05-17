import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:http/http.dart' as http;



class DownloadShare extends StatefulWidget {
  const DownloadShare({Key? key}) : super(key: key);

  @override
  _DownloadShareState createState() => _DownloadShareState();
}

class _DownloadShareState extends State<DownloadShare> {
  List<String> imgPath=[];
  String url = "http://www.africau.edu/images/default/sample.pdf";


  download() async {

    final appdir = Directory('/storage/emulated/0/Download/fb');
    final path = appdir.path + '/demo.jpg';
    setState(() {
      imgPath.add(path);
    });
    print(path);
    await  Dio().download(url, path);
    await Share.shareFiles(imgPath,text: "Hello");
    
    // final imageurl = url;
    // final uri = Uri.parse(imageurl);
    // final response = await http.get(uri);
    // final bytes = response.bodyBytes;
    // final temp = Directory('/storage/emulated/0/Download/fb');
    // // String name=url.substring(url.lastIndexOf('/'),url.length);
    // final path = temp.path+'/demo.pdf';
    // File(path).writeAsBytesSync(bytes);
    // await Share.shareFiles(['${File(path)}'], text: 'Image Shared');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            InkWell(
                onTap: () {
                  download();
                },
                child: Icon(
                  Icons.share,
                  size: 35,
                ))
          ],
        ),
      ),
    );
  }
}
