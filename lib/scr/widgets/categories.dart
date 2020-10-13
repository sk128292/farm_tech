// import 'package:farm_tech/scr/helpers/commans.dart';
// import 'package:farm_tech/scr/models/category_model.dart';
// import 'package:farm_tech/scr/providers/category_provider.dart';
// import 'package:farm_tech/scr/widgets/custom_text.dart';
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// // List<CategoryModel> categoriesList = [];

// class Categories extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final categoryProvider = Provider.of<CategoryProvider>(context);
//     return Container(
//       height: 162,
//       child: ListView.builder(
//         scrollDirection: Axis.horizontal,
//         itemCount: categoryProvider.categories.length,
//         itemBuilder: (_, index) {
//           return Column(
//             children: [
//               Stack(
//                 children: <Widget>[
//                   Container(
//                     color: Colors.transparent,
//                     margin:
//                         EdgeInsets.only(left: 2, right: 5, top: 7, bottom: 5),
//                     child: Material(
//                       color: Colors.transparent,
//                       child: InkWell(
//                         onTap: () {},
//                         child: Padding(
//                           padding: EdgeInsets.all(0),
//                           child: Column(
//                             children: <Widget>[
//                               Container(
//                                 color: Colors.transparent,
//                                 width: 130,
//                                 height: 150,
//                                 child: ClipRRect(
//                                   borderRadius: BorderRadius.circular(7),
//                                   child: Image.network(
//                                     categoryProvider.categories[index].image,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Positioned(
//                     width: 135,
//                     bottom: 1.0,
//                     height: 50,
//                     // left: 0.0,
//                     // right: 1.0,
//                     child: Card(
//                       color: Colors.black.withOpacity(0.37),
//                       child: Padding(
//                         padding: const EdgeInsets.only(
//                           top: 10.0,
//                         ),
//                         child: CustomText(
//                           text: categoryProvider.categories[index].name,
//                           colors: white,
//                           size: 17,
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }
