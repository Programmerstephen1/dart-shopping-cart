void main() {
  // Sample shopping cart prices
  List<double> prices = [5, 15, 8, 25, 30, 9];

  // ✅ Anonymous Function: Filter items >= $10
  List<double> filteredItems = prices.where((price) => price >= 10).toList();
  print("🧹 Filtered (≥ \$10): $filteredItems");

  // ✅ Apply discount using Higher-Order Function
  List<double> discountedItems = applyDiscount(filteredItems, (price) => price * 0.9); // 10% off
  print("💸 After 10% discount: $discountedItems");

  // ✅ Calculate total with optional tax
  double totalWithTax = calculateTotal(discountedItems, taxRate: 8); // 8% tax
  print("🧾 Total with 8% tax: \$${totalWithTax.toStringAsFixed(2)}");

  // ✅ Apply special recursive factorial discount
  double factorialDiscountPercent = calculateFactorialDiscount(discountedItems.length);
  double finalTotal = totalWithTax * (1 - factorialDiscountPercent / 100);
  print("🎯 Final total after $factorialDiscountPercent% factorial discount: \$${finalTotal.toStringAsFixed(2)}");
}

/// ✅ Standard Function: Calculate total with optional tax
double calculateTotal(List<double> prices, {double taxRate = 0}) {
  double subtotal = prices.reduce((a, b) => a + b);
  return subtotal + (subtotal * taxRate / 100);
}

/// ✅ Higher-Order Function: Applies a discount function to each item
List<double> applyDiscount(List<double> prices, double Function(double) discountFn) {
  return prices.map(discountFn).toList();
}

/// ✅ Recursive Function: Factorial-based discount percentage
int calculateFactorialDiscount(int n) {
  if (n <= 1) return 1;
  return n * calculateFactorialDiscount(n - 1);
}
