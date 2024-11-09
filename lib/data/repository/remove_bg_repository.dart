

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:path_provider/path_provider.dart';

class RemoveBgRepository{

  final Dio dio;

  RemoveBgRepository(this.dio);

  Future<File?> removeBackground(File image) async{
    try{

      final formData = FormData.fromMap({
        'image_file': await MultipartFile.fromFile(image.path),
        'size': 'auto',
      });

      final response = await dio.post(
        'removebg',
        data: formData,
        options: Options(
          responseType: ResponseType.bytes
        )
      );

      if(response.statusCode == 200){
        final appDir = await getTemporaryDirectory();
        final outputFile = File('${appDir.path}/no-bg.png');
        await outputFile.writeAsBytes(response.data);
        return outputFile;
      }else{
        return null;
      }

    }catch(e){
      return null;
    }
  }
}