

abstract class CacheClient<T> {
  Future writeData({required T object, required String key});
  T readData({required String key});
}