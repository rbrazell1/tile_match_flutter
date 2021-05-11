import 'package:flutter/material.dart';
import 'view/tile_images.dart';
import 'viewmodel/puzzle_viewmodel.dart';

void main() => runApp(TileMatchApp());

class TileMatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tile Match',
      theme: ThemeData(
        primarySwatch: Colors.red,
        accentColor: Colors.indigoAccent,
      ),
      home: TileMatchScreen(title: 'Tile Match'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class TileMatchScreen extends StatefulWidget {
  final String title;

  TileMatchScreen({Key? key, required this.title}) : super(key: key);

  @override
  _TileMatchScreenState createState() => _TileMatchScreenState();
}

class _TileMatchScreenState extends State<TileMatchScreen> {
  final _viewmodel = PuzzleViewModel();

  _TileMatchScreenState() {
    _viewmodel.newPuzzle(tileImages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<int>(
              stream: _viewmodel.tickStream,
              builder: (context, snapshot) => Text('${snapshot.data}'),
            ),
          ],
        ),
      ),
    );
  }
}
