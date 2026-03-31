import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// タブナビゲーションのシェルWidget
/// - GoRouterのStatefulNavigationShellを包み、ConvexAppBarで装飾する
/// - タブ再タップでpop-to-root（iOSと同様の動作）
class ShellScaffold extends StatelessWidget {
  const ShellScaffold({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.react,
        items: const [
          TabItem(icon: Icons.checklist_rounded, title: 'Todo'),
          TabItem(icon: Icons.settings, title: '設定'),
        ],
        initialActiveIndex: navigationShell.currentIndex,
        onTap: (index) => _onTabTap(index),
      ),
    );
  }

  void _onTabTap(int index) {
    // 現在のタブを再タップした場合はpop-to-root
    // iOSのUINavigationControllerのpopToRootViewControllerと同等の動作
    navigationShell.goBranch(
      index,
      initialLocation: index == navigationShell.currentIndex,
    );
  }
}
