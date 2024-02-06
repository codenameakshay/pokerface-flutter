// File for abstraction of all UUID methods, to make them easy to use
part of '../app_extension.dart';

class UniqueId {
  UniqueId._();

  static final UniqueId _instance = UniqueId._();
  static UniqueId get instance => _instance;

  final Uuid _uuid = const Uuid();

  String get uuid => _uuid.v4();

  String get usernameUUID => _uuid.v4().replaceAll('-', '').substring(0, 8);
}
