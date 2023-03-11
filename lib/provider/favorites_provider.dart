import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  Future<void> setFavorites(List<String> favorites) async {
    _favorites = favorites;
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', _favorites);
    notifyListeners();
  }

  Future<void> addToFavorites(String title) async {
    if (!_favorites.contains(title)) {
      _favorites.add(title);
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('favorites', _favorites);
      notifyListeners();
    }
  }

  Future<void> removeFromFavorites(String title) async {
    _favorites.remove(title);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', _favorites);
    notifyListeners();
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _favorites = prefs.getStringList('favorites') ?? [];
    notifyListeners();
  }

  bool isFavorite(String title) {
    return _favorites.contains(title);
  }
}
