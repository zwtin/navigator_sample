import 'package:flutter/material.dart';

/// アプリについて画面
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('アプリについて')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Clean Architecture Sample',
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Version 1.0.0',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 16),
          Text('アーキテクチャ概要', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const _ArchitectureItem(
            layer: 'Domain 層',
            description: 'Entity・Repository Interface・UseCase を定義。'
                'Pure Dart で Flutter に依存しない。',
            icon: Icons.hub,
          ),
          const _ArchitectureItem(
            layer: 'Data 層',
            description: 'Repository の実装。API・DB・フェイクデータなど'
                'データソースの詳細がここに入る。',
            icon: Icons.storage,
          ),
          const _ArchitectureItem(
            layer: 'Presentation 層',
            description: 'State (freezed) + ViewModel (AsyncNotifier)'
                ' + View (HookConsumerWidget) の3点セット。',
            icon: Icons.web,
          ),
          const SizedBox(height: 16),
          Text('使用技術', style: Theme.of(context).textTheme.titleMedium),
          const SizedBox(height: 8),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              Chip(label: Text('hooks_riverpod')),
              Chip(label: Text('go_router')),
              Chip(label: Text('freezed')),
              Chip(label: Text('flutter_hooks')),
              Chip(label: Text('convex_bottom_bar')),
            ],
          ),
        ],
      ),
    );
  }
}

class _ArchitectureItem extends StatelessWidget {
  const _ArchitectureItem({
    required this.layer,
    required this.description,
    required this.icon,
  });

  final String layer;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Theme.of(context).colorScheme.primary),
      title: Text(layer, style: const TextStyle(fontWeight: FontWeight.bold)),
      subtitle: Text(description),
      contentPadding: EdgeInsets.zero,
    );
  }
}
