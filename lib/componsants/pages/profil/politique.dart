import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Politique extends StatelessWidget {
  late PDFDocument document;
  late RxBool isLoading = true.obs;
  loading() async {
    //
    document = await PDFDocument.fromURL(
      "https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf",
    );
    //
    isLoading.value = false;
  }

  Politique({Key? key}) : super(key: key) {
    loading();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Politique & confidencialité"),
        leading: IconButton(
          onPressed: () {
            //
            Get.back();
          },
          icon: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: Obx(
        () => isLoading.value
            ? const Center(
                child: SizedBox(
                  height: 40,
                  width: 40,
                  child: CircularProgressIndicator(),
                ),
              )
            : PDFViewer(
                document: document,
                zoomSteps: 1,
                // child: SfPdfViewer.network(
                //   'https://cdn.syncfusion.com/content/PDFViewer/flutter-succinctly.pdf',
                // ),
              ),
      ),
    );
  }
}
