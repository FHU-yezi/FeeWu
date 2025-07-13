class Thing {
  String name;
  double price;
  int usedDays;

  Thing(this.name, this.price, this.usedDays);

  double averagePricePerDay() {
    return price / usedDays;
  }
}
