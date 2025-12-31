import 'package:file_picker/file_picker.dart';
import 'package:get/get.dart';
import 'package:tecno_blog/core/controller/file_pick_controller.dart';

FilePickController _filePickController = Get.find<FilePickController>();

Future pickImageFile() async {

  FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);

  _filePickController.file.value = result!.files.first;

}