import 'dart:async';

void main() {
  final bloc = new Bloc();
  
  // bloc.emailController.stream.listen((value) {
  //   print(value);
  // });
  bloc.email.listen((value) {
    print(value);
  });
  
  
  // bloc.emailController.sink.add('My New EMAIL');
  bloc.changeEmail('My New EMAIL');
}

class Bloc {
  final emailController = StreamController<String>();
  
  get changeEmail => emailController.sink.add;
  
  get email => emailController.stream;
}
