import 'package:bookly/core/constants/app_styles.dart';
import 'package:flutter/material.dart';

class BookDetailViewBookPreview extends StatelessWidget {
  const BookDetailViewBookPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          height: 48,
          width: 150,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              bottomLeft: Radius.circular(25),
            ),
          ),
          child: Text(
            '1999\$',
            style: AppStyles.textStyleRegular18.copyWith(color: Colors.black),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          height: 48,
          width: 150,
          alignment: Alignment.center,
          decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: Radius.circular(25),
            ),
          ),
          child: Text(
            'Free Preview',
            style: AppStyles.textStyleRegular18.copyWith(color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
