import 'package:aq_prime/models/content_model.dart';
import 'package:flutter/material.dart';

class TrailersAndMoreTab extends StatelessWidget {
  const TrailersAndMoreTab({
    required this.trailers,
    Key? key,
  }) : super(key: key);
  final List<Content> trailers;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      child: trailers.isNotEmpty
          ? GridView.builder(
              itemCount: trailers.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
              itemBuilder: (context, index) {
                return FlutterLogo();
              },
            )
          : SizedBox(
              width: double.infinity,
              child: Center(
                child: SizedBox(
                  width: 25,
                  height: 25,
                  child: CircularProgressIndicator(
                    color: Colors.red,
                    strokeWidth: 2.5,
                  ),
                ),
              ),
            ),
    );
  }
}
