import 'package:flutter/material.dart';

class AQLoadingIndicator extends StatelessWidget {
  const AQLoadingIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
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
