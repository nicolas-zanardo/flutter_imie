import 'package:flutter/material.dart';


class InteractivePage extends StatefulWidget {
  const InteractivePage({super.key});

  @override
  State<StatefulWidget> createState() {
    return InteractivePageState();
  }
}

class InteractivePageState extends State<InteractivePage> {

  late Color _color;
  late Color _btnColor;
  late String _textInput;
  late bool _switchValue;
  late double _sliderValue;
  late bool? _checked;
  late int _groupValue;

  @override
  void initState() {
    super.initState();
    _color = Colors.blueAccent;
    _btnColor = Colors.blueAccent;
    _switchValue = false;
    _textInput = "";
    _sliderValue = 0.00;
    _checked = false;
    _groupValue = 0;
  }

  void toggleColorRectangle() {
    setState(() {
      _color = (_color == Colors.blueAccent)? Colors.black : Colors.blueAccent;
    });
  }

  Color toggleColorBtn() {
    _btnColor = (_color == Colors.blueAccent)? Colors.black : Colors.blueAccent;
    return _btnColor;
  }

  String textValue(String text) {
    setState(() {
      _textInput = (text.isEmpty)? "Aucun text" : text;
    });
    return _textInput;
  }


  Text textInput(textValue) {
    setState(() {
      textValue = (textValue.isEmpty)? "Aucun Valeur" : textValue;
      Text(textValue);
    });
    return Text(textValue);
  }

  Widget radio() {
    List<Widget> radios = [];
    for(var i = 0; i < 5; i++) {
      Radio r = Radio(
          value: i,
          groupValue: _groupValue,
          onChanged: (value) {
            setState(() {
              _groupValue = value as int;
              _textInput = "Valeur des radios : $_groupValue";
            });
          });
      radios.add(r);
    }
    return Row(children: radios);
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text("HELLO Interactive page State"),
        ) ,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: rectangle(100, 200, textValue(_textInput), _color)
            ),
            textInput(_textInput),
            ElevatedButton(
                onPressed: () { toggleColorRectangle(); },
                style: ElevatedButton.styleFrom(
                  backgroundColor: toggleColorBtn(),
                ),
                child: const Text('Changer la couleur'),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 50,
                  vertical: 25
              ),
              child: Column(
                children:  [
                  TextField(
                      obscureText: false,
                      decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Ecrire un text'
                      ),
                    onChanged: (String text) {
                      textValue(text);
                    },
                  ),
                  Switch(value: _switchValue, onChanged: (newBool) {
                    setState(() {
                      _textInput = (newBool)? "Switch true":"Switch false";
                      _switchValue = newBool;
                      print(_textInput);
                    });
                  }),
                  Slider(
                      min: 0,
                      max: 100,
                      value: _sliderValue,
                      onChanged: (double newValue) {
                        setState(() {
                          _textInput = "Valeur du slide ! $newValue";
                          _sliderValue = newValue;
                        });
                      }),
                  Checkbox(
                      value: _checked,
                      onChanged: (bool? valueContext) {
                        setState(() {
                          _textInput = "Valeur du CheckBox : $valueContext";
                          _checked = valueContext ?? false;
                        });
                      }),
                  Row(
                      children: [
                        radio()
                      ],
                  )
                ],
              )
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () { toggleColorRectangle(); },
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }
}



Widget rectangle(double height, double width, String text, Color color) {
  return Container(
    height: height,
    width: width,
    color: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: const BorderRadius.all(Radius.circular(10.0))),
      child: Center(
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 22),
          textAlign: TextAlign.center,
        ),
      ),
    ),
  );
}
