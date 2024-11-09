import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:dio/dio.dart';

import '../../data/repository/remove_bg_repository.dart';

part 'remove_bg_provider.g.dart';

@riverpod
Dio dio (DioRef ref) {
  final apiKe = dotenv.env['REMOVE_BG_API_KEY'];
  final options = BaseOptions(
    baseUrl: 'https://api.remove.bg/v1.0/',
    headers: {
      'X-Api-Key': apiKe
    }
  );
  return Dio(options);
}

@riverpod
RemoveBgRepository removeBgRepository (RemoveBgRepositoryRef ref) {
  return RemoveBgRepository(ref.watch(dioProvider)) ;
}

@riverpod
Future<File?> removePhotoBackground(RemovePhotoBackgroundRef ref,File image ) async {
  return ref.watch(removeBgRepositoryProvider).removeBackground(image);
}

