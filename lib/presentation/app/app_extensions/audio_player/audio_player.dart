part of '../app_extension.dart';

class SoundPlayer {
  SoundPlayer._();

  static final SoundPlayer _instance = SoundPlayer._();
  static SoundPlayer get instance => _instance;

  static final player = AudioPlayer();

  Future<void> play(String source) async {
    await player.play(AssetSource(source.split('/').sublist(1).join('/')));
  }

  Future<void> stop() async {
    await player.stop();
  }

  Future<void> clickSoundEffect() async {
    await player.stop();
    await play(Assets.sounds.buttonClick);
  }
}
