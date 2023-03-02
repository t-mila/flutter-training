// Define the Drink interface
abstract class Drink {
  void prepare();
  void serve();
}

// Define a Coffee class that implements the Drink interface
class Coffee implements Drink {
  var _type;

  String getType() {
    return _type;
  }

  void setType(String value) {
    _type = value;
  }

  @override
  void prepare() {
    print('Grinding coffee beans and brewing ${getType()} coffee');
  }

  @override
  void serve() {
    print('Serving hot ${getType()}');
  }
}

// Define a Smoothie class that implements the Drink interface
class Smoothie implements Drink {
  var _flavor;

  String getFlavor() {
    return _flavor;
  }

  void setFlavor(String value) {
    _flavor = value;
  }

  @override
  void prepare() {
    print('Blending ${getFlavor()} smoothie');
  }

  @override
  void serve() {
    print('Serving cold ${getFlavor()} smoothie');
  }
}

void main() {
  // Create objects of the Coffee and Smoothie classes
  Coffee coffee = new Coffee();
  Smoothie smoothie = new Smoothie();

  // Set the coffee type and smoothie flavor using the setters
  coffee.setType('latte');
  smoothie.setFlavor('strawberry');

  // Call the prepare() and serve() methods on the Coffee and Smoothie objects
  coffee.prepare(); // Grinding coffee beans and brewing latte coffee
  coffee.serve(); // Serving hot latte coffee

  smoothie.prepare(); // Blending strawberry smoothie
  smoothie.serve(); // Serving cold strawberry smoothie

}