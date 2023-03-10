import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorites_provider.dart';
import 'book.dart';

class BookDetailsPage extends StatelessWidget {
  final Book book;

  BookDetailsPage({required this.book});

  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(book.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Image.network(
            book.coverImageUrl,
            height: 300,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  book.author,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 8),
                Text(
                  book.department,
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 16),
                IconButton(
                  icon: favoritesProvider.favorites.contains(book.title)
                      ? Icon(Icons.favorite, color: Colors.red)
                      : Icon(Icons.favorite_border),
                  onPressed: () {
                    if (favoritesProvider.favorites.contains(book.title)) {
                      favoritesProvider.removeFromFavorites(book.title);
                    } else {
                      favoritesProvider.addToFavorites(book.title);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
