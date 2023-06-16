import 'package:flutter/material.dart';

class WrapPage extends StatelessWidget {
  const WrapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('流式布局'),
      ),
      body: Column(children: [
        Column(
          children: [
            const Text('row overflow'),
            Row(children: [Text('***' * 100)]),
          ],
        ),
        Column(
          children: [
            const Text('column not overflow'),
            Column(
              children: [Text('???' * 100)],
            ),
          ],
        ),
        Column(
          children: [
            const Text(
              'wrap not overflow',
            ),
            Wrap(
              children: [Text('%%%' * 100)],
            )
          ],
        ),
        const Column(
          children: [
            Text(
              'wrap space',
            ),
            Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              children: [
                Chip(label: Text('Hamilton')),
                Chip(label: Text('Lafayette')),
                Chip(label: Text('Lee')),
                Chip(label: Text('Wang')),
                Chip(label: Text('Loin')),
              ],
            )
          ],
        ),
      ]),
    );
  }
}
