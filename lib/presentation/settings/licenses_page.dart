import 'package:flutter/material.dart';

/// ライセンス情報画面
/// Flutter 標準の LicensePage をラップする
class LicensesPage extends StatelessWidget {
  const LicensesPage({super.key});

  @override
  Widget build(BuildContext context) {
    // LicensePage は Scaffold を内包しているため直接返す
    return const LicensePage(
      applicationName: 'Clean Architecture Sample',
      applicationVersion: '1.0.0',
    );
  }
}
