class Counter {
  int _counter = 0;
  int get counter => _counter;

  void incrementCounter() {
    _counter++;
  }

  void decrementCounter() {
    _counter--;
  }

  void reset() {
    _counter = 0;
  }
}
