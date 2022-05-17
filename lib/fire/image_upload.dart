import 'dart:io';
import 'dart:async';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:multi_image_picker2/multi_image_picker2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class MultipleImageDemo extends StatefulWidget {
  @override
  _MultipleImageDemoState createState() => _MultipleImageDemoState();
}

class _MultipleImageDemoState extends State<MultipleImageDemo> {
  List<Asset> images = <Asset>[];
  List fileImage = [];
  bool loading = false;
  List urlList = [];

  @override
  void initState() {
    super.initState();
  }

  Widget buildGridView() {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(images.length, (index) {
        // Asset asset = images[index];
        // return AssetThumb(
        //   asset: asset.,
        //   width: 300,
        //   height: 300,
        // );
        return AssetThumb(asset: images[index], width: 300, height: 300);
      }),
    );
  }

  Future<void> loadAssets() async {
    List<Asset> resultList = <Asset>[];
    String error = 'No Error Detected';

    try {
      resultList = await MultiImagePicker.pickImages(
        maxImages: 300,
        enableCamera: true,
        selectedAssets: images,
        cupertinoOptions: CupertinoOptions(takePhotoIcon: "chat"),
        materialOptions: MaterialOptions(
          actionBarColor: "#abcdef",
          actionBarTitle: "Example App",
          allViewTitle: "All Photos",
          useDetailsView: false,
          selectCircleStrokeColor: "#000000",
        ),
      );
    } on Exception catch (e) {
      error = e.toString();
    }

    if (!mounted) return;

    setState(() {
      images = resultList;
      // _error = error;
    });
  }

  uploadImage() async {
    setState(() {
      loading = true;
    });
    //convert asset to file image so we can Access the path of file image
    images.forEach((asset) async {
      final byteData = await asset.getByteData();
      final tempFile =
          File("${(await getTemporaryDirectory()).path}/${asset.name}");
      final file = await tempFile.writeAsBytes(
        byteData.buffer
            .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes),
      );
      //uploading task
      var imgname = file.path.split("/").last;
      var dest = 'Dishant/$imgname';
      try {
        Reference storageReference = FirebaseStorage.instance.ref().child(dest);
        storageReference.getDownloadURL().then((value) => print(value));
        UploadTask uploadTask = storageReference.putFile(file);
        await uploadTask.then((TaskSnapshot taskSnapshot) {
          storageReference.getDownloadURL().then((value) => urlList.add(value));
          print(urlList);
        }).whenComplete(() => print("done"));
      } catch (e) {
        print("erroe");
        print(e);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Multiple Picker Image'),
      ),
      body: Container(
        // height:DeviceSize.height(context),
        // width:DeviceSize.width(context),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            //Center(child: Text('Error: $_error')),

            ElevatedButton(
              child: Text("Upload Image"),
              onPressed: uploadImage,
            ),
            ElevatedButton(
              child: Text("Pick images"),
              onPressed: loadAssets,
            ),
            Expanded(
              child: buildGridView(),
            ),
          ],
        ),
      ),
    );
  }
}
// import 'dart:io';
// import 'package:file_picker/file_picker.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:multi_image_picker2/multi_image_picker2.dart';
// import 'package:uuid/uuid.dart';
//
// class ImageUpload extends StatefulWidget {
//   const ImageUpload({Key? key}) : super(key: key);
//
//   @override
//   _ImageUploadState createState() => _ImageUploadState();
// }
//
// class _ImageUploadState extends State<ImageUpload> {
//   File? file;
//   List? urlList = [];
//   String? url;
//   List<Reference>? allfiles = [];
//   String? valid;
//
//   Future<void> load() async {
//     print("load");
//     ListResult listResult =
//         await FirebaseStorage.instance.ref('file').listAll();
//     print(listResult);
//     await listResult.items
//         .map((e) => e.getDownloadURL().then((value) {
//               data(value);
//             }))
//         .toList();
//
//     // lst = data.items.map((e) async => (await e.getDownloadURL()).toString());
//     // lst?.map((e) => urlList?.add(e.toString()));
//     // lst?.map((e) => urlList?.add(e.getDownloadURL().toString()));
//     // print("url");
//     // print(urlList);
//   }
//
//   data(String value) {
//     urlList?.add(value);
//     print(urlList);
//   }
//
//   selectfile() async {
//     final imageFile = await FilePicker.platform.pickFiles(allowMultiple: false);
//
//     if (imageFile == null) return;
//     final path = imageFile.files.single.path;
//     setState(() {
//       print("PAth");
//       print(path);
//       file = File(path!);
//     });
//   }
//
//   uploadFile() async {
//     String uniqueId = Uuid().v1();
//     String productId = uniqueId.split("-").join("");
//     if (file == null) return;
//     final fileName = "dishant";
//     final dest = 'file/$fileName';
//     try {
//       final ref = FirebaseStorage.instance.ref().child(dest);
//       ref.putFile(file!).whenComplete(() => print("uploaded"));
//     } on FirebaseException catch (e) {
//       print(e);
//     }
//   }
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     load();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: Column(
//           children: [
//             SizedBox(
//               height: 100,
//             ),
//             InkWell(
//               onTap: () {
//                 selectfile();
//               },
//               child: Container(
//                 child: Text("select image"),
//               ),
//             ),
//             SizedBox(
//               height: 100,
//             ),
//             InkWell(
//               onTap: () {
//                 uploadFile();
//               },
//               child: Container(
//                 child: Text("upload image"),
//               ),
//             ),
//             GridView.builder(
//                 shrinkWrap: true,
//                 itemCount: urlList?.length,
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                     crossAxisCount: 3),
//                 itemBuilder: (context, index) {
//                   return Image.network(urlList![index],height: 100,width: 100,);
//                 })
//           ],
//         ),
//       ),
//     );
//   }
// }
