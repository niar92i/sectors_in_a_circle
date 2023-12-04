import 'package:flutter/material.dart';
import 'package:touchable/touchable.dart';
import 'sectors_painter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String middleText = "What are you doing?";

  TextStyle textStyle = const TextStyle(
      fontSize: 12,
      color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        backgroundColor: Colors.black45,
        title: Text(widget.title, style: const TextStyle(color: Colors.white),),
      ),
      body: Center(
        child:
            CanvasTouchDetector(
              gesturesToOverride: const [GestureType.onTapDown],
              builder: (BuildContext context) {
                return CustomPaint(
                  painter: SectorsPainter(
                    context: context, middleText: middleText, onTap: (sector) {
                      setState(() {
                        middleText = sector;
                      });
                  }
                  ),
                  child: SizedBox(
                    width: 400,
                    height: 400,
                    child: Stack(
                        children: [
                          Positioned(
                              left: 150,
                              top: 150,
                              child: Container(
                                  width: 100,
                                  height: 100,
                                  alignment: Alignment.center,
                                  child: Text(middleText, style: const TextStyle(color: Colors.white, fontSize: 16), textAlign: TextAlign.center,)
                              )
                          ),
                          Positioned(
                            left: 180,
                              top: 25,
                              child: Column(
                                children: [
                                  const Icon(Icons.bed, size: 40, color: Colors.white,),
                                  Text('Sleep', style: textStyle, textAlign: TextAlign.center,),
                                ],
                              ),
                          ),
                          Positioned(
                            left: 260,
                              top: 45,
                              child: Column(
                                children: [
                                  const Icon(Icons.local_florist, size: 40, color: Colors.white,),
                                  Text('Morning', textAlign: TextAlign.center, style: textStyle,),
                                ],
                              ),
                          ),
                          Positioned(
                            left: 300,
                              top: 120,
                              child: Column(
                                children: [
                                  const Icon(Icons.local_cafe, size: 40, color: Colors.white,),
                                  Text('Taking A', textAlign: TextAlign.center, style: textStyle,),
                                  Text('Break', textAlign: TextAlign.center, style: textStyle,),
                                ],
                              ),
                          ),
                          Positioned(
                            left: 300,
                            top: 210,
                            child: Column(
                              children: [
                                const Icon(Icons.directions_bus, size: 40, color: Colors.white,),
                                Text('Commute', textAlign: TextAlign.center, style: textStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 260,
                            top: 275,
                            child: Column(
                              children: [
                                const Icon(Icons.directions_walk, size: 40, color: Colors.white,),
                                Text('Walking', textAlign: TextAlign.center, style: textStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 180,
                            top: 310,
                            child: Column(
                              children: [
                                const Icon(Icons.work, size: 40, color: Colors.white,),
                                Text('At Work', textAlign: TextAlign.center, style: textStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 95,
                            top: 280,
                            child: Column(
                              children: [
                                const Icon(Icons.calendar_month, size: 40, color: Colors.white,),
                                Text('Big Event', textAlign: TextAlign.center, style: textStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 50,
                            top: 210,
                            child: Column(
                              children: [
                                const Icon(Icons.warning, size: 40, color: Colors.white,),
                                Text('SOS', textAlign: TextAlign.center, style: textStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 40,
                            top: 130,
                            child: Column(
                              children: [
                                const Icon(Icons.emoji_emotions, size: 40, color: Colors.white,),
                                Text('Tough Day', textAlign: TextAlign.center, style: textStyle,),
                              ],
                            ),
                          ),
                          Positioned(
                            left: 90,
                            top: 45,
                            child: Column(
                              children: [
                                const Icon(Icons.house, size: 40, color: Colors.white,),
                                Text('After Work', textAlign: TextAlign.center, style: textStyle,),
                              ],
                            ),
                          ),
                        ]),
                  ),

                );
              },
            ),


      ),
      backgroundColor: const Color.fromARGB(255, 28, 34, 45),
    );
  }
}
