import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorites_provider.dart';
import 'book.dart';
import 'book_details.dart';


class MyFavoritesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void removeBook(Book book) {
      final favoritesProvider = Provider.of<FavoritesProvider>(context, listen: false);

      // Remove the book from the favorites list in the provider
      favoritesProvider.removeFromFavorites(book.title);
    }
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    final List<Book> books = [
      Book(

        title: 'Book 1',
        author: 'Author 1',
        department: 'Department 1',
        coverImageUrl: 'https://imgs.search.brave.com/M_D1TBEWuwFgfTWpt5bSvMMTJQ4KjJX1FM14TrhYA6Y/rs:fit:564:900:1/g:ce/aHR0cHM6Ly9lZGl0/Lm9yZy9pbWFnZXMv/Y2F0L2Jvb2stY292/ZXJzLWJpZy0yMDE5/MTAxNjEwLmpwZw',
      ),
      Book(

        title: 'Book 2',
        author: 'Author 2',
        department: 'Department 2',
        coverImageUrl: 'https://imgs.search.brave.com/M_D1TBEWuwFgfTWpt5bSvMMTJQ4KjJX1FM14TrhYA6Y/rs:fit:564:900:1/g:ce/aHR0cHM6Ly9lZGl0/Lm9yZy9pbWFnZXMv/Y2F0L2Jvb2stY292/ZXJzLWJpZy0yMDE5/MTAxNjEwLmpwZw',
      ),
      Book(

        title: 'Book 3',
        author: 'Author 3',
        department: 'Department 3',
        coverImageUrl: 'https://imgs.search.brave.com/M_D1TBEWuwFgfTWpt5bSvMMTJQ4KjJX1FM14TrhYA6Y/rs:fit:564:900:1/g:ce/aHR0cHM6Ly9lZGl0/Lm9yZy9pbWFnZXMv/Y2F0L2Jvb2stY292/ZXJzLWJpZy0yMDE5/MTAxNjEwLmpwZw',
      ),
    ];

    List<Book> favoriteBooks = books
        .where((book) => favoritesProvider.favorites.contains(book.title))
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('My Favorites'),
      ),
      body: favoriteBooks.isEmpty
          ? Center(
        child: Text('No favorite books yet'),
      )
          : ListView.builder(
        itemCount: favoriteBooks.length,
        itemBuilder: (context, index) {
          final book = favoriteBooks[index];

          return Dismissible(
            key: Key(book.title), // Replace 'id' with a unique identifier for the book
            direction: DismissDirection.endToStart,
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete, color: Colors.white),
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 20),
            ),
            onDismissed: (direction) {
              // Call a function to remove the book from the list
              removeBook(book);
            },
            child: ListTile(
              leading: Image.network(
                book.coverImageUrl,
                height: 100,
                width: 80,
                fit: BoxFit.cover,
              ),
              title: Text(book.title),
              subtitle: Text(book.author),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => BookDetailsPage(book: book),
                  ),
                );
              },
            ),
          );

        },
      ),
    );
  }
}






