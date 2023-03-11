import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/favorites_provider.dart';
import 'book.dart';
import 'favorites.dart';

import '../main.dart';

class BooksPage extends StatefulWidget {

  const BooksPage({super.key});

  @override
  State<BooksPage> createState() => _BooksPageState();
}

class _BooksPageState extends State<BooksPage> {
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



  @override
  Widget build(BuildContext context) {
    final favoritesProvider = Provider.of<FavoritesProvider>(context);
    favoritesProvider.loadFavorites();
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Books'),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              Navigator.pushNamed(context, '/favorites');
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return ListTile(
            leading: Image.network(book.coverImageUrl),
            title: Text(book.title),
            subtitle: Text(book.author),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.pushNamed(
                context,
                '/book_details',
                arguments: BookDetailsArguments(book: book),
              );
            },
          );
        },
      ),
    );
  }
}