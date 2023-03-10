import 'package:flutter/material.dart';

class FavoritesProvider extends ChangeNotifier {
  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  void addToFavorites(String bookId) {
    if (!_favorites.contains(bookId)) {
      _favorites.add(bookId);
      notifyListeners();
    }
  }

  void removeFromFavorites(String bookId) {
    if (_favorites.contains(bookId)) {
      _favorites.remove(bookId);
      notifyListeners();
    }
  }
}
