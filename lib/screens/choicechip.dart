import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ChoiceChipPage extends StatefulWidget {
  ChoiceChipPage({super.key});

  @override
  State<ChoiceChipPage> createState() => _ChoiceChipPageState();
}

class ChipName {
  final String name;
  final IconData icon;

  ChipName(this.name, this.icon);
}

class _ChoiceChipPageState extends State<ChoiceChipPage>
    with TickerProviderStateMixin {
  int _selected = 2220220020020020022;
  // late int _selectedIndex;
  List<ChipName> _options = [
    ChipName('zero', Icons.onetwothree),
    ChipName('one', Icons.onetwothree),
    ChipName('two', Icons.onetwothree),
    ChipName('three', Icons.onetwothree),
    ChipName('four', Icons.onetwothree),
    ChipName('five', Icons.onetwothree),
    ChipName('six', Icons.onetwothree),
    ChipName('eight', Icons.onetwothree),
    ChipName('nine', Icons.onetwothree),
    ChipName('ten', Icons.onetwothree),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("choice chip"),
      ),
      body: Center(
        child: Wrap(
          spacing: 10,
          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            for (int i = 0; i < _options.length; i++)
              ChoiceChip(
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                label: Text(_options[i].name),
                selected: _selected == i,
                selectedColor: Colors.blueAccent,
                avatar: Icon(_options[i].icon),
                elevation: 10,
                pressElevation: 5,
                shadowColor: Colors.teal,
                onSelected: (bool selected) {
                  setState(() {
                    _selected = i;
                  });
                  print(selected);
                },
              )
          ],
        ),
      ),
    );
  }
}
