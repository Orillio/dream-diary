abstract class IUidStorage {
  Future<String?> getUid();
  Future setUid(String uid);
}