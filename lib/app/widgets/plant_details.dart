import 'package:aq_prime/app/widgets/catalogs_card.dart';
import 'package:aq_prime/device/utils/hex_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:intl/intl.dart';

import 'primary_button.dart';

class PlanDetailsCard extends StatefulWidget {
  const PlanDetailsCard({
    required this.plan,
    Key? key,
  }) : super(key: key);
  final Map<String, dynamic> plan;

  @override
  State<PlanDetailsCard> createState() => _PlanDetailsCardState();
}

class _PlanDetailsCardState extends State<PlanDetailsCard> {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimationConfiguration.staggeredList(
      position: 1,
      duration: const Duration(milliseconds: 500),
      child: FadeInAnimation(
        child: SlideAnimation(
          verticalOffset: 100,
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(20),
            ),
            margin: const EdgeInsets.only(left: 25, right: 25, top: 20, bottom: 10),
            child: Theme(
              data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
              child: ExpansionTile(
                childrenPadding: const EdgeInsets.only(left: 20, right: 20, bottom: 0, top: 0),
                tilePadding: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 10),
                expandedAlignment: Alignment.centerLeft,
                onExpansionChanged: (value) {
                  isExpanded = value;
                  setState(() {});
                },
                trailing: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 100),
                  child: Icon(Icons.arrow_drop_down, color: Colors.white),
                ),
                title: Text(
                  'Account Plan',
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    fontSize: 20,
                    color: Colors.white,
                  ),
                ),
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Divider(
                        color: Colors.red,
                        thickness: 1.5,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        widget.plan['name'],
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.normal,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Wrap(
                        direction: Axis.vertical,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.70,
                                child: Text(
                                  widget.plan['description'] ?? 'not_available',
                                  maxLines: 3,
                                  softWrap: false,
                                  overflow: TextOverflow.ellipsis,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontWeight: FontWeight.w300,
                                    fontStyle: FontStyle.normal,
                                    fontSize: 18,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              Padding(padding: const EdgeInsets.only(left: 10), child: Icon(Icons.tv_sharp)),
                            ],
                          ),
                          const SizedBox(height: 15),
                          Catalogs(list: widget.plan['excluded_catalogs']),
                          const SizedBox(height: 15),
                          Text(
                            widget.plan['price_monthly'] != null ? '₱${NumberFormat("#,##0.00", "en_US").format(double.parse(widget.plan['price_monthly']))} / Month' : 'not_available',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            widget.plan['price_monthly'] != null ? '₱${NumberFormat("#,##0.00", "en_US").format(double.parse(widget.plan['price_yearly']))} / Year' : 'not_available',
                            textAlign: TextAlign.center,
                            softWrap: true,
                            style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w300,
                              fontStyle: FontStyle.normal,
                              fontSize: 18,
                              color: Colors.white,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      PrimaryButton(
                        height: 50,
                        action: () {},
                        width: double.infinity,
                        label: 'Change Plan',
                      ),
                      const SizedBox(height: 25),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
