/// ナビゲーションサービスのInterface
/// Domain層に定義することで、ViewModelがBuildContextやGoRouterに依存しなくなる。
abstract class NavigationService {
  void navigateTo(String path);
  void goBack();
}
