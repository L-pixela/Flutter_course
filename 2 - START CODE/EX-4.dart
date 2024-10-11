void main() {
  // Map of pizza prices
  const pizzaPrices = {
    'margherita': 5.5,
    'pepperoni': 7.5,
    'vegetarian': 6.5,
  };

  // Example order
  const order = ['margherita', 'pepperoni', 'pineapple'];

  // Your code
  double calculatePrice(List<String> order) {
    double total = 0;
    for (String pizza in order) {
      if (pizzaPrices.containsKey(pizza)) {
        total += pizzaPrices[pizza]!;
      } else {
        print("$pizza is not on the menu.");
      }
    }
    return total;
  }

  double totalPrices = calculatePrice(order);
  print("The Total is: \$$totalPrices");
}
