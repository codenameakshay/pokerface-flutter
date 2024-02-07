part of '../app_extension.dart';

class SoundPlayer {
  SoundPlayer._();

  static final SoundPlayer _instance = SoundPlayer._();
  static SoundPlayer get instance => _instance;

  static final player = AudioPlayer();

  Future<void> play() async {
    await player.resume();
  }

  Future<void> setSource(String source) async {
    await player.setSource(AssetSource(source.split('/').sublist(1).join('/')));
  }

  Future<void> stop() async {
    await player.stop();
  }

  Future<void> clickSoundEffect() async {
    await player.stop();
    await play();
  }

  Future<void> initClickSoundEffect() async {
    await setSource(Assets.sounds.buttonClick);
  }
}
