part of '../app_extension.dart';

typedef PersistentStorageEncoder<T> = String Function(T);
typedef PersistentStorageDecoder<T> = T Function(String);

abstract class SimpleStorage {
  factory SimpleStorage() => SimpleStorageImpl();

  Future<void> store<T>({
    required String key,
    required T data,
    required PersistentStorageEncoder<T> encoder,
    bool overwrite = false,
  });

  Future<void> update<T>({
    required String key,
    required T updatedData,
    required PersistentStorageEncoder<T> encoder,
    bool createIfNotExisting = false,
  });

  Future<T?> retrieve<T>({
    required String key,
    required PersistentStorageDecoder<T> decoder,
  });

  Future<void> delete({
    required String key,
  });

  Future<bool> exists({required String key});

  void setPrefsInstance(SharedPreferences prefs);
}
