import 'dart:async';

class Cake {}

class Order {
  String type;
  Order(this.type);
}

void main () {
  final controller = new StreamController();
  final order = new Order('chocolate');
  
  // Bu kısım BAKER'ın yaptığı işi temsil eder.
  // type'ı alır ve karar verip Cake ya da Error çıkarır.
  final baker = new StreamTransformer.fromHandlers(
    handleData: (cakeType, sink) {
      if(cakeType == 'chocolate') {
        sink.add(new Cake());
      } else {
        sink.addError('I can not bake that type!');
      }
    }
  );
  
  controller.sink.add(order); // Bu kısım Order Taker'ı temsil eder.
  
  controller.stream
    .map((order) => order.type) // Bu kısım Order Inspector'u temsil eder.
    .transform(baker) // Bu kısım baker'ı temsil eder.
    .listen( // Bu kısım Pickup Office'i temsil eder.
    (cake) => print('Here is your cake $cake'), 
    onError: (err) => print(err));
}
