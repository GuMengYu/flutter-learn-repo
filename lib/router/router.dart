import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_app/BasicComponent.dart';
import 'package:my_app/Gesture.dart';
import 'package:my_app/Home.dart';
import 'package:my_app/HttpRequestDemo.dart';
import 'package:my_app/Playground.dart';
import 'package:my_app/Routes.dart';
import 'package:my_app/StateLifecycleTest.dart';
import 'package:my_app/animation/basic.dart';
import 'package:my_app/animation/hero_page_a.dart';
import 'package:my_app/animation/index.dart';
import 'package:my_app/animation/stage_page.dart';
import 'package:my_app/event/index.dart';
import 'package:my_app/event/my_notification.dart';
import 'package:my_app/function_components/alert_page.dart';
import 'package:my_app/function_components/future_builder_page.dart';
import 'package:my_app/function_components/index.dart';
import 'package:my_app/function_components/inherited_widget_page.dart';
import 'package:my_app/function_components/willpopscope_page.dart';
import 'package:my_app/layout.dart';
import 'package:my_app/layout2.dart';
import 'package:my_app/layoutTest/container.dart';
import 'package:my_app/layoutTest/flex.dart';
import 'package:my_app/layoutTest/layoutTest.dart';
import 'package:my_app/layoutTest/layout_builder_page.dart';
import 'package:my_app/layoutTest/stack.dart';
import 'package:my_app/layoutTest/wrap.dart';
import 'package:my_app/scrollcomponent/animate_list.dart';
import 'package:my_app/scrollcomponent/custom_scroll_view_page.dart';
import 'package:my_app/scrollcomponent/custom_sliver.dart';
import 'package:my_app/scrollcomponent/grid_view_page.dart';
import 'package:my_app/scrollcomponent/infinite_list.dart';
import 'package:my_app/scrollcomponent/tab_view.dart';
import 'package:my_app/scrollcomponent/list_view_page.dart';
import 'package:my_app/scrollcomponent/page_view_page.dart';
import 'package:my_app/scrollcomponent/scroll_controler.dart';
import 'package:my_app/scrollcomponent/scroll_listener.dart';
import 'package:my_app/scrollcomponent/scroll_page.dart';
import 'package:my_app/scrollcomponent/single_child_scroll_page.dart';
import 'package:my_app/time_picker_page.dart';

import '../animation/hero_page_b.dart';
import '../date_pick_page.dart';
import '../event/eventbus.dart';
import '../shopperScreens/Cart.dart';
import '../shopperScreens/Catalog.dart';

GoRouter router() {
  return GoRouter(initialLocation: '/route', routes: [
    GoRoute(path: '/', builder: (context, state) => const HomePage()),
    GoRoute(path: '/catlog', builder: (context, state) => const Catalog()),
    GoRoute(
      path: '/route',
      builder: (context, state) => const Routes(),
    ),
    GoRoute(
      path: '/gesture',
      builder: (context, state) => Gesture(),
    ),
    GoRoute(
      path: '/layout',
      builder: (context, state) => const Layout(),
    ),
    GoRoute(
      path: '/layout2',
      builder: (context, state) => const Layout2Page(),
    ),
    GoRoute(
        path: '/http', builder: (context, state) => const HttpRequestDemo()),
    GoRoute(
      path: '/playground',
      builder: (context, state) => const Playground(),
    ),
    GoRoute(
      path: '/statelife',
      builder: (context, state) => const StateLifecycleTest(),
    ),
    GoRoute(
      path: '/basic_components',
      builder: (context, state) => const BasicComponent(),
    ),
    GoRoute(
      path: '/timepicker',
      builder: (context, state) => const ShowTimePickerApp(),
    ),
    GoRoute(
      path: '/datepicker',
      builder: (context, state) => const DatePickerApp(),
    ),
    GoRoute(
        path: '/catalog',
        builder: (context, state) => const Catalog(),
        routes: [
          GoRoute(
            path: 'cart',
            builder: (context, state) => const Cart(),
          ),
        ]),
    GoRoute(
        path: '/layouttest',
        builder: (context, state) => const LayoutTest(),
        routes: [
          GoRoute(
            path: 'flex',
            builder: (context, state) => const FlexPage(),
          ),
          GoRoute(
            path: 'wrap',
            builder: (context, state) => const WrapPage(),
          ),
          GoRoute(
            path: 'stack',
            builder: (context, state) => const StackPage(),
          ),
          GoRoute(
            path: 'layoutbuilder',
            builder: (context, state) => const LayoutBuilderPage(),
          )
        ]),
    GoRoute(
      path: '/container',
      builder: (context, state) => const ContainerPage(),
    ),
    GoRoute(
        path: '/scroll',
        builder: (context, state) => const ScrollPage(),
        routes: [
          GoRoute(
            path: 'single',
            builder: (context, state) => const SingleChildScrollPage(),
          ),
          GoRoute(
            path: 'list',
            builder: (context, state) => const ListViewPage(),
          ),
          GoRoute(
            path: 'infinite',
            builder: (context, state) => const InfiniteList(),
          ),
          GoRoute(
            path: 'scrollcontroller',
            builder: (context, state) => const ScrollControler(),
          ),
          GoRoute(
            path: 'scrolllistener',
            builder: (context, state) => const ScrollListener(),
          ),
          GoRoute(
            path: 'animated',
            builder: (context, state) => const AnimateList(),
          ),
          GoRoute(
            path: 'grid',
            builder: (context, state) => const GridViewPage(),
          ),
          GoRoute(
            path: 'page',
            builder: (context, state) => const PageViewPage(),
          ),
          GoRoute(
            path: 'tab',
            builder: (context, state) => const TabViewPage(),
          ),
          GoRoute(
            path: 'custom',
            builder: (context, state) => CustomScrollViewPage(),
          ),
          GoRoute(
            path: 'customsliver',
            builder: (context, state) => const CustomSliver(),
          ),
        ]),
    GoRoute(
        path: '/function_c',
        builder: (context, state) => FunctionComponents(),
        routes: [
          GoRoute(
            path: 'willpop',
            builder: (context, state) => const WillpopscopePage(),
          ),
          GoRoute(
            path: 'futurebuilder',
            builder: (context, state) => const FutureBuilderPage(),
          ),
          GoRoute(
            path: 'dialog',
            builder: (context, state) => const AlertPage(),
          ),
          GoRoute(
            path: 'inherited',
            builder: (context, state) => InheritedWidgetPage(),
          )
        ]),
    GoRoute(
        path: '/event',
        builder: (context, state) => const EventPage(),
        routes: [
          GoRoute(
            path: 'bus',
            builder: (context, state) => EventBusPage(),
          ),
          GoRoute(
            path: 'notification',
            builder: (context, state) => MyNotificationPage(),
          ),
        ]),
    GoRoute(
        path: '/animation',
        builder: (context, state) => const AnimationPage(),
        routes: [
          GoRoute(
            path: 'basic',
            builder: (context, state) => ScaleAnimationRoute(),
          ),
          GoRoute(
            path: 'router',
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                  child: ScaleAnimationRoute(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    return FadeTransition(
                      opacity: animation,
                      child: child,
                    );
                  });
            },
          ),
          GoRoute(
            path: 'hero/a',
            builder: (context, state) => const HeroPageA(),
          ),
          GoRoute(
            path: 'hero/b',
            builder: (context, state) => const HeroPageB(),
          ),
          GoRoute(
            path: 'stage',
            builder: (context, state) => const StagePage(),
          )
        ])
  ]);
}
