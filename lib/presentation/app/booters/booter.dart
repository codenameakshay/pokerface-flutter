// Abstract class for Booters
abstract class Booter<T> {
  Future<T> bootUp();

  void bootDown();
}
