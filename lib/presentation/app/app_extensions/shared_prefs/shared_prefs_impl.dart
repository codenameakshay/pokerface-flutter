part of '../app_extension.dart';

class SimpleStorageImpl implements SimpleStorage {
  SharedPreferences? _prefs;

  @override
  Future<void> store<T>({
    required String key,
    required T data,
    required PersistentStorageEncoder<T> encoder,
    bool overwrite = false,
  }) async {
    await _obtainOrCreateDatabase();

    final isWriteable = await exists(key: key) ? overwrite : true;

    if (isWriteable) {
      final encodedData = encoder(data);
      await _prefs?.setString(key, encodedData);
    }
  }

  @override
  Future<void> update<T>({
    required String key,
    required T updatedData,
    required PersistentStorageEncoder<T> encoder,
    bool createIfNotExisting = true,
  }) async {
    if (await exists(key: key)) {
      await store<T>(
        key: key,
        data: updatedData,
        encoder: encoder,
        overwrite: true,
      );
    } else if (createIfNotExisting) {
      await store<T>(
        key: key,
        data: updatedData,
        encoder: encoder,
      );
    }
  }

  @override
  Future<T?> retrieve<T>({
    required String key,
    required PersistentStorageDecoder<T> decoder,
  }) async {
    await _obtainOrCreateDatabase();

    final retrievedData = _prefs?.getString(key);

    late T? data;

    if (retrievedData != null) {
      data = decoder(retrievedData);
    } else {
      data = null;
    }

    return data;
  }

  @override
  Future<bool> exists({required String key}) async {
    await _obtainOrCreateDatabase();

    final isExisting = _prefs?.containsKey(key);

    return isExisting ?? false;
  }

  @override
  Future<void> delete({required String key}) async {
    await _obtainOrCreateDatabase();

    if (await exists(key: key)) {
      await _prefs?.remove(key);
    }
  }

  Future<void> _obtainOrCreateDatabase() async {
    if (_prefs == null) {
      final sharedPreferences = await SharedPreferences.getInstance();
      _prefs = sharedPreferences;
    }
  }

  @override
  void setPrefsInstance(SharedPreferences prefs) {
    _prefs = prefs;
  }
}
