import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';
import 'package:workmanager/workmanager.dart';

import 'core/firebase_initializer.dart';
import 'core/notification_service.dart';
import 'core/navigation/app_router.dart';
import 'core/theme/app_theme.dart';

// 使用 Logger 進行日誌記錄
final logger = Logger(
  printer: PrettyPrinter(
    methodCount: 1,
    errorMethodCount: 5,
    lineLength: 80,
    printTime: true, // Re-enable printTime as it's a valid parameter for PrettyPrinter
  ),
);

// 1. WorkManager 的頂層回呼函式
@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((task, inputData) async {
    // 在此處處理背景任務
    logger.i('Executing background task: $task');
    // TODO: 根據 task 名稱執行具體的背景同步邏輯
    return Future.value(true);
  });
}

void main() async {
  // 2. 確保 Flutter 綁定已初始化
  WidgetsFlutterBinding.ensureInitialized();

  // 3. 初始化 Firebase
  await FirebaseInitializer().initialize();

  // 4. 初始化本地通知服務
  await NotificationService.initialize();

  // 5. 初始化 WorkManager
  await Workmanager().initialize(
    callbackDispatcher,
    isInDebugMode: kDebugMode,
  );

  // 6. 註冊一個週期性任務
  await Workmanager().registerPeriodicTask(
    '1',
    'backgroundSync',
    frequency: const Duration(hours: 12),
  );

  runApp(
    ProviderScope(
      // 7. 在 Debug 模式下啟用 ProviderObserver
      observers: [if (kDebugMode) LoggerProviderObserver()],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouterProvider);

    return MaterialApp.router(
      routerConfig: router,
      title: 'Prostate Cancer Self-Management',
      theme: AppTheme.lightTheme,
    );
  }
}

// 8. LoggerProviderObserver 用於監控 Riverpod Provider 狀態
class LoggerProviderObserver extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderBase<Object?> provider,
    Object? previousValue,
    Object? newValue,
    ProviderContainer container,
  ) {
    logger.t(
      '''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "newValue": "$newValue"
}''',
    );
  }

  @override
  void didAddProvider(
    ProviderBase<Object?> provider,
    Object? value,
    ProviderContainer container,
  ) {
    logger.t(
      '''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "value": "$value"
}''',
    );
  }

  @override
  void didDisposeProvider(
    ProviderBase<Object?> provider,
    ProviderContainer container,
  ) {
    logger.t(
      '''
{
  "provider": "${provider.name ?? provider.runtimeType}",
  "action": "disposed"
}''',
    );
  }
}
