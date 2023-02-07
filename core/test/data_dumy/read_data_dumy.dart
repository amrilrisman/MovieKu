import 'dart:convert';
import 'dart:io';

import 'package:flutter/services.dart';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  if (dir.endsWith('core')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/core/test/$name').readAsStringSync();
}