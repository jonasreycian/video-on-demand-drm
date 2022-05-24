import 'package:aq_prime/app/screens/category_contents_screen.dart';
import 'package:aq_prime/domain/entities/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({
    Key? key,
    required this.index,
    required this.category,
    required this.color,
  }) : super(key: key);
  final int index;
  final Category category;
  final Color color;
  final Duration duration = const Duration(milliseconds: 500);
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredGrid(
      columnCount: 3,
      position: index,
      duration: duration,
      child: ScaleAnimation(
        duration: duration,
        child: FadeInAnimation(
          duration: duration,
          child: FlipAnimation(
            duration: duration,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed(
                    CategoryContentsScreen.routeName,
                    arguments: category);
              },
              child: Center(
                child: Container(
                  margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0),
                  width: MediaQuery.of(context).size.width * 0.50,
                  child: Card(
                    semanticContainer: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    clipBehavior: Clip.antiAlias,
                    color: color,
                    child: Container(
                      height: 300,
                      width: double.infinity,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          category.name ?? '',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w600,
                            fontStyle: FontStyle.normal,
                            fontSize: 17,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
