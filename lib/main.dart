import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyWidgetState();
}
class _MyWidgetState extends State<MyApp> with SingleTickerProviderStateMixin {
  // The TabController requires a TickerProvider to drive its animations, and the SingleTickerProviderStateMixin provides the necessary implementation for it. By using SingleTickerProviderStateMixin
  late TabController _controller;
  int _selectedIndex = 0;
@override
void initState() {
super.initState();
_controller = TabController(length: 3, vsync: this);
_controller.addListener(() {
setState(() {
_selectedIndex = _controller.index;
});
print("Selected Index: " + _controller.index.toString());
});
}

  @override
  Widget build(BuildContext context) {
       return MaterialApp(
        home: DefaultTabController(
	            length: 3,
              child: Scaffold(appBar: AppBar(
                bottom: TabBar(
                  controller: _controller,
                tabs: [
                  Tab(icon:Icon(Icons.flight)),
                  Tab(icon: Icon(Icons.directions_transit)),
                  Tab(icon: Icon(Icons.directions_bike)),
                ]),
                ),
                body: TabBarView(
                  controller: _controller,
                  children: [
                    Icon(Icons.flight,size: 350,),
                    Icon(Icons.directions_transit,size: 350,),
                    Icon(Icons.directions_car,size: 350,),
                  ]),
                ),

       ),
       
       );
  }

}

// @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: DefaultTabController(
//         length: 3,
//         child: Scaffold(
//           appBar: AppBar(
//             bottom: TabBar(
//               controller: _controller,
//               tabs: const [
//                 Tab(icon: Icon(Icons.flight)),
//                 Tab(icon: Icon(Icons.directions_transit)),
//                 Tab(icon: Icon(Icons.directions_bike)),
//               ],
//             ),
//           ),
//           body: DraggableScrollableSheet(
//             expand: false,
//             builder: (context, controller) {
//               return TabBarView(
//                 controller: _controller,
//                 children: const [
//                   Icon(Icons.flight, size: 350),
//                   Icon(Icons.directions_transit, size: 350),
//                   Icon(Icons.directions_car, size: 350),
//                 ],
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }
// }
    // DraggableScrollableSheet, and the tabs will automatically swap based on the position of the dragged sheet.