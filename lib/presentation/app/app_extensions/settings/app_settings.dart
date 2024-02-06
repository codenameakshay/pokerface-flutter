part of '../app_extension.dart';

abstract class AppSettings<Current, Switch> {
  Current get current;

  void switchTo(Switch type);

  void nextTo();
}
