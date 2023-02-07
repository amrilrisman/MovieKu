import 'dart:io';

String readJson(String name) {
  var dir = Directory.current.path;
  if (dir.endsWith('/test')) {
    dir = dir.replaceAll('/test', '');
  }
  if (dir.endsWith('detail_movie')) {
    return File('$dir/test/$name').readAsStringSync();
  }
  return File('$dir/detail_movie/test/$name').readAsStringSync();
}
