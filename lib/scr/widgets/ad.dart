import 'package:flutter/material.dart';

class Advertise extends StatelessWidget {
  const Advertise({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            width: double.infinity,
            height: 170,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                  image: AssetImage("images/a.jpg"), fit: BoxFit.fill),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.orange[500].withOpacity(0.7),
                    Colors.orange[100].withOpacity(0.7),
                  ],
                ),
              ),
              child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  children: <Widget>[
                    // ClipRRect(
                    //   // clipBehavior: Clip.antiAlias,
                    //   borderRadius: BorderRadius.circular(10),
                    //   child: Image(
                    //     image: AssetImage('assets/b.jpg'),
                    //   ),
                    // ),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.white,
                          ),
                          children: [
                            TextSpan(
                              text: "Grab It \n",
                              style: TextStyle(fontSize: 16),
                            ),
                            TextSpan(
                              text: "Best Taste In City",
                              style: TextStyle(fontSize: 25),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
