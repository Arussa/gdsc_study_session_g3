void main(){
   print('Current time: ${DateTime.now()}');
  
  Future.delayed(Duration(seconds: 5), () {
    print('Current time after 5 seconds: ${DateTime.now()}');
  });
}