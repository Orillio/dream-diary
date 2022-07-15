import 'package:dream_diary/api/interfaces/iuid_storage.dart';
import 'package:dream_diary/api/uid_secure_storage.dart';

class AuthorizationManager {
  IUidStorage uidStorage = UidSecureStorage();

  AuthorizationManager(this.uidStorage);

  Future<bool> isAuthorized() async {
    return await uidStorage.getUid() != null;
  }
  Future login() async {

  }
}