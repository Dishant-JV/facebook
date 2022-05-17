import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class DownloadingScreen extends StatefulWidget {
  const DownloadingScreen({Key? key}) : super(key: key);

  @override
  _DownloadingScreenState createState() => _DownloadingScreenState();
}

class _DownloadingScreenState extends State<DownloadingScreen> {
  bool isDownload = false;
  final imgUrl =
      "https://www.cleverfiles.com/howto/wp-content/uploads/2018/03/minion.jpg";
  String dataProgress = "";

  Future<void> downloadImg() async {
    try {
      Dio dio = Dio();

      var imgPath = await getApplicationDocumentsDirectory();
      dio.download(imgUrl, "${imgPath.path}/minion.jpg",
          onReceiveProgress: (rec, total) {
        print("rec : $rec  total : $total");
        setState(() {
          dataProgress = ((rec / total) * 100).toStringAsExponential(0);
          print("data $dataProgress");
        });
      });
    } catch (e) {
      print(e);
    }
    setState(() {
      isDownload = false;
      print("Download complete");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isDownload
          ? Container(
              child: Center(
                child: Container(
                  height: 200,
                  width: 200,
                  child: Card(
                    color: Colors.black,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          dataProgress,
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          : Center(
              child: ElevatedButton(
                child: Text("Download"),
                onPressed: () {
                  setState(() {
                    isDownload = true;
                  });
                  downloadImg();
                },
              ),
            ),
    );
  }
}
