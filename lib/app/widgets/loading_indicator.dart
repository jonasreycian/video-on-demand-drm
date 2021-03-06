import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class AQLoadingIndicator extends StatelessWidget {
  const AQLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AnimationConfiguration.staggeredList(
      position: 0,
      duration: Duration(milliseconds: 100),
      child: FadeInAnimation(
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Center(
              child: SizedBox(
                width: 25,
                height: 25,
                child: CircularProgressIndicator.adaptive(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class AQLoadingIndicatorScaffold extends StatelessWidget {
  const AQLoadingIndicatorScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: CircularProgressIndicator.adaptive(
          backgroundColor: Colors.red,
        ),
      ),
    );
  }
}
