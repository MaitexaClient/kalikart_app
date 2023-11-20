import 'package:flutter/material.dart';
import 'package:kalicart/features/Root/controller/root_controller.dart';
import 'package:kalicart/features/home/view/home_screen.dart';
import 'package:provider/provider.dart';

class RootScreen extends StatelessWidget {

  RootScreen({super.key});
   
  final List<Widget> _pages = [
    HomeScreen()
  ];

   
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<RootController>(builder: (BuildContext context, RootController value, Widget? child) { 
        return _pages[value.currentIndex];
       },

      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: context.read<RootController>().currentIndex,
        onTap: (index) {
         
            context.read<RootController>().setIndex(index);
     
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Page 1',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }
}