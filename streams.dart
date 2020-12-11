import 'dart:async';

class Cake {} // Possible output

class Order { // Input
  final String type;
  Order(this.type);
}

void main() {
  final controller = new StreamController();
  
  final order = new Order('chocolate');
  
  final baker = new StreamTransformer.fromHandlers(
    handleData: (cakeType, sink) {
      if (cakeType == 'chocolate') {
        sink.add(new Cake());
      } else {
        sink.addError('I cant bake that type!');
      }
    }
  );
  
  controller.sink.add(order); // Order Taker
  
  controller.stream // Chocolate Cake Factory
    .map((order) => order.type) // Order Inspector
    .transform(baker) // Baker - it is stream transformer
    .listen( // Pickup Office
      (cake) => print('Heres your cake $cake'),
      onError: (err) => print(err),
    );
}
