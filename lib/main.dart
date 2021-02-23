import 'package:flutter/material.dart';
import 'package:tflite_flutter/tflite_flutter.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Tensorflow',
        home: Home()
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  getModel() async{
    var interpreterOptions = InterpreterOptions()..useNnApiForAndroid = true;
    final interpreter = await Interpreter.fromAsset('models/model.tflite',
        options: interpreterOptions);
    var input = [[0.81012658, 0.35443038, 0.70886076, 0.26582278]];
    /*var output = List(1*2).reshape([1,1]);*/
    var output = List(1*1).reshape([1,1]);
    interpreter.run(input, output);
    print(output);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getModel();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flower Predict"),
        elevation: 0,
        backgroundColor: Colors.green[400],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Text("Central Text"),
        ),
      ),
    );
  }
}
