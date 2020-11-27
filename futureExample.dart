import 'dart:async';

void main() async {
  print('About to fetch data...');
  var result = await get('http://sth-sth-sth-sth');
 print(result); 
}

Future<String> get(String url) {
  return new Future.delayed(new Duration(seconds: 3), () {
    return 'Got the data!';
  });
}
