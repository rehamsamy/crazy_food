import 'package:shimmer/shimmer.dart';

import 'package:flutter/material.dart';

class HomeLoading extends StatelessWidget {
  const HomeLoading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      SizedBox(
        width: 200.0,
        height: 100.0,
        child: Shimmer.fromColors(
          baseColor: Colors.red,
          highlightColor: Colors.yellow,
          child: Text(
            'Shimmer',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40.0,
              fontWeight:
              FontWeight.bold,
            ),
          ),
        ),
      );

    //   Column(
    //   children: [
    //     Flexible(
    //       child: ClipRRect(
    //           borderRadius: BorderRadius.all(Radius.circular(8)),
    //           child: MyShimmerEffectUI.rectangular(height: 100)),
    //     ),
    //     Padding(
    //       padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 8.0),
    //       child: ClipRRect(
    //         borderRadius: BorderRadius.all(Radius.circular(8)),
    //         child: MyShimmerEffectUI.rectangular(height: 20),
    //       ),
    //     ),
    //   ],
    // );
  }
}
