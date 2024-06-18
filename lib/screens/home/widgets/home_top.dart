import 'package:flutter/material.dart';
import 'category_view.dart';

class HomeTop extends StatelessWidget {
  const HomeTop({
    super.key,
    required this.containerGrow,
  });

  final Animation<double> containerGrow;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 0.4,
      decoration: const BoxDecoration(
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
              margin: const EdgeInsets.only(top: 10),
              alignment: Alignment.topRight,
              width: containerGrow.value * 100,
              height: containerGrow.value * 100,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: AssetImage('assets/images/profile.png'),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                margin: const EdgeInsets.only(left: 75),
                alignment: Alignment.center,
                width: containerGrow.value * 30,
                height: containerGrow.value * 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Theme.of(context).primaryColor,
                ),
                child: Text(
                  '5',
                  style: TextStyle(
                    fontSize: containerGrow.value * 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const Text(
              'Welcome, Felipe!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
            const CategoryView(),
          ],
        ),
      ),
    );
  }
}
