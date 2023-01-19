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
  late TextField _textInput;

  @override
  void initState() {
    super.initState();
    _color = Colors.blueAccent;
    _btnColor = Colors.blueAccent;
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

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

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
                padding: const EdgeInsets.fromLTRB(50, 200, 50, 50),
                child: rectangle(100, 200, "Hello Rectangle", _color)
            ),
            TextButton(
              onPressed: () { toggleColorRectangle(); },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith<Color?>(
                        (Set<MaterialState> states) {
                          if (states.contains(MaterialState.pressed)) {
                            return Theme.of(context).colorScheme.primary.withOpacity(0.5);
                          }
                          return Theme.of(context).colorScheme.primary.withOpacity(1); // Use the component's default.
                        }
                ),
              ),
                child: RichText(
                    text: const TextSpan(
                      text: "Changer la couleur"
                    ),

                  ),
                ),
            ElevatedButton(
                onPressed: () { toggleColorRectangle(); },
                style: ElevatedButton.styleFrom(
                  backgroundColor: toggleColorBtn(),
                ),
                child: const Text('Changer la couleur'),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(
                horizontal: 50
              ),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Ecrire un text'
                )
              ),
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
