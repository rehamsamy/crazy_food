import 'package:crazy_food/controller/app_controller.dart';
import 'package:crazy_food/helper/result.dart';
import 'package:flutter/material.dart';

import 'connection_error_view.dart';
import 'empty_view.dart';
import 'error_view.dart';
import 'loading_view.dart';

class AppResultHandler extends StatelessWidget {
  final AppController appController;
  final Widget child;
  final bool? inSlivers;
  final bool? showLoading;

  const AppResultHandler({
    Key? key,
    required this.appController,
    required this.child,
    this.inSlivers = false,
    this.showLoading = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if ((inSlivers ?? false)) {
      return (appController.result is LoadingResult && !(showLoading!)) ||
              (appController.result is SuccessResult)
          ? child
          : SliverList(
              delegate: SliverChildListDelegate(
                [
                  (appController.result is LoadingResult)
                      ? const LoadingView()
                      : (appController.result is EmptyResult)
                          ? const EmptyView()
                          : (appController.result is ErrorResult)
                              ? ErrorView(errorMessage: (appController.result as ErrorResult).errorMsg)
                              : (appController.result is ConnectionErrorResult)
                                  ? const ConnectionErrorView()
                                  : const SizedBox(),
                ],
              ),
            );
    } else {
      return (appController.result is LoadingResult)
          ? const LoadingView()
          : (appController.result is EmptyResult)
              ? const EmptyView()
              : (appController.result is ErrorResult)
                  ? ErrorView(errorMessage: (appController.result as ErrorResult).errorMsg)
                  : (appController.result is ConnectionErrorResult)
                      ? const ConnectionErrorView()
                      : (appController.result is SuccessResult) ||
                              (appController.result is LoadingResult && !(showLoading!))
                          ? child
                          : const SizedBox();
    }
  }
}
