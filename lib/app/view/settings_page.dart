import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Settings画面
class SettingsPage extends ConsumerWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('設定')),
      body: ListView(
        children: [
          const ListTile(
            leading: Icon(Icons.info_outline),
            title: Text('バージョン'),
            trailing: Text('1.0.0'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('アプリについて'),
            subtitle: const Text('アーキテクチャの概要・使用技術'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/about'),
          ),
          ListTile(
            leading: const Icon(Icons.gavel),
            title: const Text('ライセンス情報'),
            subtitle: const Text('使用しているOSSのライセンス'),
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.go('/settings/licenses'),
          ),
          const Divider(),
          const ListTile(
            leading: Icon(Icons.architecture),
            title: Text('アーキテクチャ'),
            subtitle: Text('Clean Architecture + Riverpod + GoRouter'),
          ),
          const ListTile(
            leading: Icon(Icons.code),
            title: Text('状態管理'),
            subtitle: Text('hooks_riverpod (AsyncNotifier + freezed)'),
          ),
          const ListTile(
            leading: Icon(Icons.route),
            title: Text('ルーティング'),
            subtitle: Text('go_router (StatefulShellRoute)'),
          ),
        ],
      ),
    );
  }
}
