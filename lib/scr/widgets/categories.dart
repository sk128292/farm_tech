import 'package:farm_tech/scr/helpers/commans.dart';
import 'package:farm_tech/scr/models/category_model.dart';
import 'package:farm_tech/scr/widgets/custom_text.dart';
import 'package:farm_tech/scr/widgets/loading.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class Categories extends StatelessWidget {
  final CategoryModel category;

  const Categories({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: <Widget>[
            Container(
              color: Colors.transparent,
              margin: EdgeInsets.only(left: 2, right: 5, top: 7, bottom: 5),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: EdgeInsets.all(0),
                    child: Stack(
                      children: <Widget>[
                        Positioned.fill(
                            child: Align(
                          alignment: Alignment.center,
                          child: Loading(),
                        )),
                        Container(
                          color: Colors.transparent,
                          width: 130,
                          height: 150,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(7),
                            child: FadeInImage.memoryNetwork(
                              placeholder: kTransparentImage,
                              image: category.image,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              width: 135,
              bottom: 1.0,
              height: 50,
              // left: 0.0,
              // right: 1.0,
              child: Card(
                color: Colors.black.withOpacity(0.37),
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 10.0,
                  ),
                  child: CustomText(
                    text: category.name,
                    colors: white,
                    size: 17,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
