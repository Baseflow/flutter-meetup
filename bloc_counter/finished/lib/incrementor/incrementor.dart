class Incrementor {
  int _counter = 0;

  int updateCounter() {
    _counter = _counter + 1;
    return _counter;
  }
}