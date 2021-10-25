import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Raws and Colums",
      color: Colors.lightBlue[50],
      home: const LayOutController(),
    ));

class LayOutController extends StatefulWidget {
  const LayOutController({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LayOutControllerState();
}

class _LayOutControllerState extends State<LayOutController> {
  static const kElement = <Widget>[
    Icon(
      Icons.star_rate_sharp,
      size: 50,
    ),
    Icon(
      Icons.star_rate_sharp,
      size: 100,
    ),
    Icon(
      Icons.star_rate_sharp,
      size: 50,
    ),
  ];

  bool _isRow = true;
  MainAxisSize _mainAxisSize = MainAxisSize.max;
  MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.start;
  CrossAxisAlignment _crossAxisAlignment = CrossAxisAlignment.start;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(
        body: _builBody(),
        bottomNavigationBar: _getBottomBar(),
      ),
    );
  }

  Widget _builBody() => Container(
        color: Colors.yellow,
        child: _isRow
            ? Row(
                mainAxisAlignment: _mainAxisAlignment,
                mainAxisSize: _mainAxisSize,
                crossAxisAlignment: _crossAxisAlignment,
                children: kElement,
              )
            : Column(
                mainAxisAlignment: _mainAxisAlignment,
                mainAxisSize: _mainAxisSize,
                crossAxisAlignment: _crossAxisAlignment,
                children: kElement,
              ),
      );

  Widget _getBottomBar() => Material(
        color: Theme.of(context).primaryColorLight,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Row(
              children: <Widget>[
                Radio<bool>(
                    value: true,
                    groupValue: _isRow,
                    onChanged: (bool? val) {
                      if (val != null) {
                        setState(() {
                          _isRow = val;
                        });
                      }
                    }),
                const Text("Row"),
                Radio(
                    value: false,
                    groupValue: _isRow,
                    onChanged: (bool? val) {
                      if (val != null) {
                        setState(() {
                          _isRow = val;
                        });
                      }
                    }),
                const Text("Column")
              ],
            ),
            ListTile(
              title: const Text("mainAxisSize:"),
              trailing: DropdownButton<MainAxisSize>(
                value: _mainAxisSize,
                onChanged: (MainAxisSize? newVal) {
                  if (newVal != null) {
                    setState(() {
                      _mainAxisSize = newVal;
                    });
                  }
                },
                items: MainAxisSize.values
                    .map((MainAxisSize val) => DropdownMenuItem(
                          child: Text(
                              val.toString().substring('MainAxisSize.'.length)),
                          value: val,
                        ))
                    .toList(),
              ),
            ),
            ListTile(
              title: const Text("MainAxisAlignment"),
              trailing: DropdownButton<MainAxisAlignment>(
                value: _mainAxisAlignment,
                onChanged: (MainAxisAlignment? newVal) {
                  if (newVal != null) {
                    setState(() {
                      _mainAxisAlignment = newVal;
                    });
                  }
                },
                items: MainAxisAlignment.values
                    .map((MainAxisAlignment Val) => DropdownMenuItem(
                          value: Val,
                          child: Text(Val.toString()
                              .substring('MainAxisAlignment.'.length)),
                        ))
                    .toList(),
              ),
            ),
          ],
        ),
      );
}
