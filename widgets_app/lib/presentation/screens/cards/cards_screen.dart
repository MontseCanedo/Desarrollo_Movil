import 'package:flutter/material.dart';

const cards = <Map<String, dynamic>>[
  {'elvation': 0.0, 'label': 'Elevation 0'},
  {'elvation': 1.0, 'label': 'Elevation 1'},
  {'elvation': 2.0, 'label': 'Elevation 2'},
  {'elvation': 3.0, 'label': 'Elevation 3'},
  {'elvation': 4.0, 'label': 'Elevation 4'},
  {'elvation': 5.0, 'label': 'Elevation 5'},
];

class CardsScreen extends StatelessWidget {
  static const name = 'cards_screen';

  const CardsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cards Screen'),
      ),
      body: const _CardsView(),
    );
  }
}

class _CardsView extends StatelessWidget {
  const _CardsView();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ...cards.map((card) =>
              _CardType1(label: card['label'], elevation: card['elvation'])),
          ...cards.map((card) =>
              _CardType2(label: card['label'], elevation: card['elvation'])),
          ...cards.map((card) =>
              _CardType3(label: card['label'], elevation: card['elvation'])),
          ...cards.map((card) =>
              _CardType4(label: card['label'], elevation: card['elvation'])),
          const SizedBox(
            height: 30,
          )
        ],
      ),
    );
  }
}

class _CardType1 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType1({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(label),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType2 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType2({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      shape: RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          side: BorderSide(
            color: colors.outline,
          )),
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text('$label - outline'),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType3 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType3({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Card(
      color: colors.onSurfaceVariant,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 5, 10, 10),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: const Icon(Icons.more_vert_outlined),
                onPressed: () {},
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                '$label - filled',
                style: TextStyle(color: colors.surfaceBright),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CardType4 extends StatelessWidget {
  final String label;
  final double elevation;
  const _CardType4({required this.label, required this.elevation});

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.hardEdge,
      elevation: elevation,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
        child: Stack(
          children: [
            Image.network(
              'https://picsum.photos/id/${elevation.toInt()}/600/350',
              height: 350,
              fit: BoxFit.cover,
            ),
            Align(
              alignment: Alignment.topRight,
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(20))),
                child: IconButton(
                  icon: const Icon(Icons.more_vert_outlined),
                  onPressed: () {},
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}