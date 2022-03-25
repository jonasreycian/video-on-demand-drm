import 'package:aq_prime/widgets/fetured_section.dart';
import 'package:aq_prime/widgets/top_ten_section.dart';
import 'package:flutter/material.dart';

class CatergoriesScreen extends StatelessWidget {
  const CatergoriesScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Categories'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FeaturedSection(),
              const SizedBox(height: 15),
              TopTenSection(),
            ],
          ),
        ),
      ),
    );
  }
}
