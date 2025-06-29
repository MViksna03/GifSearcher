import 'package:flutter/material.dart';
import 'dart:async';
import 'gif_search_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Gif Searcher',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const GifSearchPage(title: 'Gif Searcher'),
    );
  }
}

class GifSearchPage extends StatefulWidget {
  const GifSearchPage({super.key, required this.title});

  final String title;

  @override
  State<GifSearchPage> createState() => _GifSearchPageState();
}

class _GifSearchPageState extends State<GifSearchPage> {
  String _searchText = '';
  final List<String> _foundGifs = [];
  Timer? _debounce;
  int _offset = 0;
  final GifSearchService _gifSearchService = GifSearchService();

  void _onSearchTextChanged(String text) {
    if (_debounce?.isActive ?? false) {
      _debounce?.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: 300), () {
      _offset = 0;
      _loadGifs(text);
    });
  }

  void _loadGifs(String query) {
    _gifSearchService.searchGifs(query, offset: _offset).then((gifUrls) {
      setState(() {
        _foundGifs.addAll(gifUrls);
      });
    }).catchError((error) {});
  }

  void _loadMoreGifs() {
    _offset += 20;
    _loadGifs(_searchText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                labelText: 'Search for GIFs',
              ),
              onChanged: (value) {
                setState(() {
                  _searchText = value;
                });
                _onSearchTextChanged(value);
              },
            ),
          ),
          Expanded(
            child: NotificationListener<ScrollNotification>(
              onNotification: (ScrollNotification scrollInfo) {
                if (scrollInfo is ScrollEndNotification &&
                    scrollInfo.metrics.pixels ==
                        scrollInfo.metrics.maxScrollExtent) {
                  _loadMoreGifs();
                }
                return false;
              },
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemCount: _foundGifs.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Colors.grey[200],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.network(
                        _foundGifs[index],
                        width: 200,
                        height: 200,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
