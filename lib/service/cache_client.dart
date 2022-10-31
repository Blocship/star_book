

abstract class CacheClient {
  Future writeData({required Object object, required String key});
  Object readData({required String key});
}