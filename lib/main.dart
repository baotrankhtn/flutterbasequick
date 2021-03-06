import 'app.dart';
import 'configs/flavors.dart';

void main() async {
  // Set global flavor
  FlavorConfig(
      flavor: Flavor.DEV,
      values: FlavorValues(
        appUrl: "https://dev-demo-api.com",
      ));
  // Start app
  return MyApp.appRunner();
}
