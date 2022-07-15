
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'interfaces/iuid_storage.dart';

class UidSecureStorage implements IUidStorage {
  static const _storage = FlutterSecureStorage();

  @override
  Future<String?> getUid() async {
    return await _storage.read(key: "uid");
  }

  @override
  setUid(String? newUid) async {
    await _storage.write(key: "uid", value: newUid);
  }

}