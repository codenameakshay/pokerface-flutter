part of '../app_extension.dart';

class GameHistorySave {
  GameHistorySave._();

  static final GameHistorySave _instance = GameHistorySave._();
  static GameHistorySave get instance => _instance;

  static const gameHistorySaveKey = 'GameHistorySaveKey#02';

  Future<List<GameHistory>> getGameHistory() async {
    return (await MyAppX.prefs.retrieve(
          key: gameHistorySaveKey,
          decoder: (p0) => (jsonDecode(p0) as List<dynamic>).map(
            (e) => GameHistory.fromJson(e),
          ),
        ))
            ?.toList() ??
        [];
  }

  Future<void> updateGameHistory(GameHistory updatedGameHistory) async {
    final savedGames = await getGameHistory();

    if (savedGames.isNotEmpty) {
      final index = savedGames.indexWhere((element) => element.gameStartAt == updatedGameHistory.gameStartAt);
      if (index != -1) {
        savedGames[index] = updatedGameHistory;
      } else {
        savedGames.add(updatedGameHistory);
      }
      await MyAppX.prefs.update(
        key: gameHistorySaveKey,
        updatedData: jsonEncode(savedGames),
        encoder: (p0) => p0,
        createIfNotExisting: true,
      );
    } else {
      await MyAppX.prefs.store(
        key: gameHistorySaveKey,
        data: jsonEncode([updatedGameHistory]),
        encoder: (p0) => p0,
        overwrite: true,
      );
    }
  }
}
