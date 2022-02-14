import 'app.dart';
import 'configs/flavors.dart';

void main() async {
  // Set global flavor
  FlavorConfig(
      flavor: Flavor.PRODUCTION,
      values: FlavorValues(
        appUrl: "https://pro-demo-api.com",
      ));

  // Start app
  return MyApp.appRunner();
}
