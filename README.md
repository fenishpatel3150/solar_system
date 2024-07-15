<h2 align = "center"> 1. Planets App </h2>


### Example: AnimatedContainer for Planet Details

```dart
import 'package:flutter/material.dart';

void main() {
  runApp(PlanetsApp());
}

class PlanetsApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Planets App'),
        ),
        body: PlanetDetails(),
      ),
    );
  }
}

class PlanetDetails extends StatefulWidget {
  @override
  _PlanetDetailsState createState() => _PlanetDetailsState();
}

class _PlanetDetailsState extends State<PlanetDetails> {
  bool _isLarge = false;

  void _toggleSize() {
    setState(() {
      _isLarge = !_isLarge;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _toggleSize,
        child: AnimatedContainer(
          duration: Duration(seconds: 1),
          curve: Curves.fastOutSlowIn,
          width: _isLarge ? 200.0 : 100.0,
          height: _isLarge ? 200.0 : 100.0,
          decoration: BoxDecoration(
            color: Colors.blue,
            borderRadius: BorderRadius.circular(_isLarge ? 20.0 : 10.0),
          ),
          child: Center(
            child: Text(
              _isLarge ? 'Planet Details' : 'Tap to Expand',
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            ),
          ),
        ),
      ),
    );
  }
}
```

### Description:

1. **Imports and Setup**: Import necessary packages (`flutter/material.dart`) and set up a basic Flutter app (`PlanetsApp`) with an app bar and a main widget (`PlanetDetails`).

2. **AnimatedContainer**: Inside `PlanetDetails`, use `AnimatedContainer` as the main widget. It animates changes to its properties like `width`, `height`, and `borderRadius` based on `_isLarge` state.

3. **State Management**: `_PlanetDetailsState` manages the `_isLarge` boolean state. Tapping on the container toggles `_isLarge`, triggering the animation due to `setState()`.

4. **GestureDetector**: Wraps the `AnimatedContainer` to detect taps and call `_toggleSize` to change `_isLarge`.

5. **Animation Properties**: `duration` specifies how long the animation should take (1 second in this case), and `curve` defines the animation's speed curve (here, `Curves.fastOutSlowIn` for a smooth transition).

6. **Decoration and Child**: `AnimatedContainer` decorates with a blue color and rounded corners (`borderRadius`). Its child (`Text`) changes based on `_isLarge` state.

This example demonstrates a basic use of animation with AnimatedContainer in Flutter, which you can adapt and expand upon for your planets app.




<img src = "https://github.com/user-attachments/assets/75d420ec-1eb7-44a4-813a-56238922d97b" width=22% height=35%>
<img src = "https://github.com/user-attachments/assets/a6ed6cdc-ddd9-48b2-b270-6e9ea1751e3f" width=22% height=35%>
<img src = "https://github.com/user-attachments/assets/57f5cdbd-24a3-428d-a582-05874b403f94" width=22% height=35%>


