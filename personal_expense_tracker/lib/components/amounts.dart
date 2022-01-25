class Amount {
  final String day;
  final Object amount;

  Amount(
    this.day,
    this.amount,
  );

  @override
  String toString() {
    return '{title: $this.day,amount:$this.amount}';
  }
}
