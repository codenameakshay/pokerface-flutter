import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pokerface/presentation/app/app_extensions/app_extension.dart';
import 'package:pokerface/presentation/views/blank_screen/view.dart';
import 'package:pokerface/presentation/views/card_photo_screen/view.dart';
import 'package:pokerface/presentation/views/game_screen/view.dart';
import 'package:pokerface/presentation/views/game_screen/widgets/bottom_sheet/view.dart';
import 'package:pokerface/presentation/views/game_screen/widgets/bottom_sheet/widgets/bottom_sheet/view.dart';
import 'package:pokerface/presentation/views/home_screen/view.dart';
import 'package:pokerface/presentation/views/splash_screen/view.dart';

part 'intrinsic_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page|Screen|View,Route')
class IntrinsicRouter extends _$IntrinsicRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive(); //.cupertino, .adaptive ..etc

  @override
  final List<AutoRoute> routes = MyAppRoutesRegistry.routes;
}
