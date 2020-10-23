import 'package:flutter/material.dart';
import 'category_view.dart';

class HomeTop extends StatelessWidget {
  final Animation<double> containerGrow;
  HomeTop({@required this.containerGrow});
  
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    
    return Container(
      height: screenSize.height * 0.4,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 10),
                alignment: Alignment.topRight,
                width: containerGrow.value * 100,
                height: containerGrow.value * 100,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage('assets/images/profile.png'),
                      fit: BoxFit.cover),
                ),
                child: Container(
                  margin: EdgeInsets.only(left: 75),
                  alignment: Alignment.center,                
                  width: containerGrow.value * 30,
                  height: containerGrow.value * 30,
                  child: Text('2',
                      style: TextStyle(
                        fontSize: containerGrow.value * 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      )),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).accentColor,
                  ),
                ),
              ),
              Text(
                'Welcome, Felipe!',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    letterSpacing: 1),
              ),
              CategoryView(),
            ]),
      ),
    );
  }
}
