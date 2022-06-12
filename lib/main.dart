import '/data/repisotories/base/i_data_repository.dart';
import '/data/repisotories/fake_data_repository.dart';
import '/ui/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put<IDataRepository>(FakeDataRepository());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      routes: {
        HomeScreen.route: (_) => const HomeScreen(),
      },
      initialRoute: HomeScreen.route,
    );
  }
}
