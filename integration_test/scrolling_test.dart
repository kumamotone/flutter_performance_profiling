import 'package:flutter/material.dart';
import 'package:flutter_application_integration_perf/main.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('Perform scrolling', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    await binding.traceAction(
      () async {
        final gesture = await tester
            .startGesture(tester.getCenter(find.byType(Scrollable)));
        final startTime = DateTime.now();

        while (DateTime.now().difference(startTime) <
            const Duration(seconds: 10)) {
          await gesture.moveBy(const Offset(0, -10));
          await Future.delayed(const Duration(milliseconds: 16)); // 画面リフレッシュレート
        }

        // スクロール終了
        await gesture.up();
      },
      reportKey: 'scrolling_timeline',
    );
  });
}
