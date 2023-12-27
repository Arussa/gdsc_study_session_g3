// ignore_for_file: file_names, avoid_print, prefer_const_constructors

void main() {
  print('Current time: ${DateTime.now()}');

  Future.delayed(Duration(seconds: 5), () {
    print('Current time after 5 seconds: ${DateTime.now()}');
  });
}
