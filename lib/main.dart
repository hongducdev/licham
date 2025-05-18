import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:licham/features/calendar/presentation/screens/calendar_screen.dart';
import 'package:licham/core/theme/app_theme.dart';
import 'package:licham/widgets/lunar_calendar_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('vi_VN', null);

  // Initialize and start widget updates
  await LunarCalendarWidget.updateWidget();
  LunarCalendarWidget.startPeriodicUpdate();

  runApp(
    const ProviderScope(
      child: LichAmApp(),
    ),
  );
}

class LichAmApp extends ConsumerWidget {
  const LichAmApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      title: 'Lịch Âm',
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('vi', 'VN'), // Vietnamese
      ],
      locale: const Locale('vi', 'VN'),
      home: const CalendarScreen(),
    );
  }
}

// Placeholder for the initial screen
// class PlaceholderWidget extends StatelessWidget {
//   const PlaceholderWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: const Text('Lịch Âm Việt'),
//       ),
//       body: const Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Text('Sắp ra mắt!'),
//       ),
//     );
//   }
// }
