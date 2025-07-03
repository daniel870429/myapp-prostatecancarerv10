import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:myapp/main.dart' as app;
import 'package:myapp/presentation/features/psa_tracker/widgets/add_psa_log_dialog.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end test', () {
    testWidgets(
      'tap through the app, add a symptom and a PSA log, and see them reflected on the dashboard',
      (tester) async {
        // Start the app.
        app.main();
        await tester.pumpAndSettle();

        // We assume the user is logged in.

        // 1. Verify initial dashboard state
        expect(find.text('守護之光儀表板'), findsOneWidget);
        expect(find.text('您目前共記錄了 0 筆症狀。'), findsOneWidget);
        expect(find.text('尚無 PSA 紀錄'), findsOneWidget);

        // 2. Navigate to the Symptom Tracker page
        await tester.tap(find.byIcon(Icons.assignment_outlined));
        await tester.pumpAndSettle();

        // 3. Add a new symptom
        await tester.tap(find.byType(FloatingActionButton));
        await tester.pumpAndSettle();
        await tester.enterText(
          find.widgetWithText(TextFormField, 'Symptom Name'),
          '輕微頭痛',
        );
        await tester.tap(find.text('Add'));
        await tester.pumpAndSettle();

        // 4. Verify the new symptom is in the list
        expect(find.text('輕微頭痛'), findsOneWidget);

        // 5. Navigate back to the Home page
        await tester.tap(find.byIcon(Icons.home_outlined));
        await tester.pumpAndSettle();

        // 6. Verify the dashboard has updated for symptoms
        expect(find.text('您目前共記錄了 1 筆症狀。'), findsOneWidget);

        // 7. Add a new PSA log from the dashboard
        await tester.tap(find.descendant(
          of: find.text('PSA 趨勢'),
          matching: find.byType(IconButton),
        ));
        await tester.pumpAndSettle();

        expect(find.byType(AddPsaLogDialog), findsOneWidget);
        await tester.enterText(
          find.widgetWithText(TextFormField, 'PSA 數值'),
          '4.2',
        );
        await tester.tap(find.text('儲存'));
        await tester.pumpAndSettle();

        // 8. Verify the new PSA log is reflected in the chart
        // (A more robust test would inspect the chart data itself)
        expect(find.text('尚無 PSA 紀錄'), findsNothing);
        expect(find.byType(LineChart), findsOneWidget);
      },
    );
  });
}
