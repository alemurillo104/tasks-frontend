import 'package:flutter/material.dart';
import 'package:frontend/src/core/utils/layout/dimensions.dart';

import '../../../../core/helpers/string_to_enum.dart';
import '../../../../core/utils/enums/enum.dart';
import '../../../../core/utils/theme/sizes.dart';
import '../../../../core/utils/theme/theme.dart';

class ItemListWidget extends StatelessWidget {
  final double width;
  final String title, subtitle;
  final Priority priority;
  const ItemListWidget({
    super.key,
    required this.width,
    required this.title,
    required this.subtitle,
    required this.priority,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width,
      child: Container(
        decoration: BoxDecoration(
          color: colorByPriority(priority),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: EdgeInsets.all(
          AppSizes.mediumPadding,
        ),
        child: Row(
          children: [
            Container(
              width: (screenWidth > narrowWidth) ? width * 0.1 : width * 0.3,
              height: (screenWidth > narrowWidth) ? width * 0.1 : width * 0.3,
              decoration: BoxDecoration(
                color: Colors.lightBlue.shade50,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Center(
                child: Text(
                  priorityToString(priority).substring(0, 1).toUpperCase(),
                  style: AppTheme.lightTheme.primaryTextTheme.headline4,
                ),
              ),
            ),
            SizedBox(
              width: AppSizes.dividerHeight,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: AppTheme.lightTheme.primaryTextTheme.headline4,
                ),
                SizedBox(
                  height: AppSizes.minimunHeight,
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Row(
                      children: [
                        Text(
                          subtitle,
                          style: AppTheme.lightTheme.textTheme.bodyText1,
                          maxLines: 2,
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color colorByPriority(Priority pr) {
    switch (pr) {
      case Priority.alta:
        return Colors.red.shade200;
      case Priority.media:
        return Colors.yellow.shade200;
      default:
        return Colors.blueAccent.shade100;
    }
  }
}
