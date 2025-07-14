class Thing {
  String name;
  double price;
  DateTime buyDate;

  Thing(this.name, this.price, this.buyDate);

  int getUsedDays() {
    return (DateTime.now().difference(buyDate)).inDays;
  }

  double getAveragePricePerDay() {
    return price / this.getUsedDays();
  }
}
