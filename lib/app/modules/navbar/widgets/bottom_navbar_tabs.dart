import 'package:firebase/app/core/extenstions/build_context_extenstion.dart';
import 'package:flutter/material.dart';

///[BottomNavBarTabs] custome bottom nabe bar items class
abstract class BottomNavBarTabs {
  static List<BottomNavigationBarItem> tabs(BuildContext context) {
    return [
      BottomNavigationBarItem(
        icon: const Icon(Icons.message_outlined),
        label: context.translate.home,
        activeIcon: const Icon(Icons.message_outlined),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.location_history),
        label: context.translate.location,
        activeIcon: const Icon(Icons.location_history),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.person),
        label: context.translate.profile,
        activeIcon: const Icon(Icons.person),
      ),
    ];
  }
}
