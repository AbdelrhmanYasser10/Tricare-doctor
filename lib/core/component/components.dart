import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loader_overlay/loader_overlay.dart';


import '../globle/color/shared_color.dart';

Center buildOverlayLoading(double height,{required BuildContext context}) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         const SpinKitCubeGrid(
          color: AppColor.primaryColor,
          size: 50.0,
        ),
        SizedBox(
          height: height * 0.03,
        ),
        // Text(
        // context.read<GlobalCubit>().local == 'en'? 'Loading Please Wait': 'جاري تحميل من فضلك انتظر',
        // ),
      ],
    ),
  );
}

LoaderOverlay buildGlobOverLay({required Widget widget}) {
  return LoaderOverlay(
    useDefaultLoading: false,
    overlayWidgetBuilder: (progress) => const Center(
      child: SpinKitCubeGrid(
        color: AppColor.primaryColor,
        size: 50.0,
      ),
    ),
    overlayColor: Colors.black87,
    //overlayOpacity: 0.8,

    child: widget,
  );
}

// class BuildShimmer extends StatelessWidget {
//   final Widget widget;
//
//   BuildShimmer({
//     super.key,
//     required this.widget,
//
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     return Shimmer.fromColors(
//       child: widget,
//       baseColor: context.read<GlobalCubit>().isDark? DarkAppColor.foreGroundColors:Colors.grey.shade300,
//       highlightColor: context.read<GlobalCubit>().isDark?Colors.white12 :Colors.grey.shade600,
//     );
//   }
// }







