void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter(); 
  await Hive.openBox('settingsBox'); 

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}