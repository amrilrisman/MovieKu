import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  if (dir.endsWith('home')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/home/test/$name').readAsStringSync();
}
