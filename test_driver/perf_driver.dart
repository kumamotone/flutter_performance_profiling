// ignore: depend_on_referenced_packages
import 'package:flutter_driver/flutter_driver.dart' as driver;
import 'package:integration_test/integration_test_driver.dart';
import 'package:intl/intl.dart';

Future<void> main() {
  return integrationDriver(
    responseDataCallback: (data) async {
      if (data != null) {
        final timeline = driver.Timeline.fromJson(
          data['scrolling_timeline'] as Map<String, dynamic>,
        );

        DateTime now = DateTime.now();
        // 日時をフォーマット
        String formattedDate = DateFormat('yyyy-MM-dd_hh-mm-ss').format(now);

        // ファイル名に組み込む
        String fileName = 'scrolling_$formattedDate';

        // タイムラインを、読みやすく理解しやすいタイムラインサマリーに変換
        final summary = driver.TimelineSummary.summarize(timeline);

        // その後、タイムライン全体をjson形式でディスクに書き込む
        // このファイルは、Chromeブラウザのトレーシングツールで開くことができる
        // トレーシングツールは chrome://tracingに移動して開く
        // オプションで、includeSummaryをtrueに設定することでサマリーもディスクに保存する
        await summary.writeTimelineToFile(
          fileName,
          pretty: true,
        );
      }
    },
  );
}
