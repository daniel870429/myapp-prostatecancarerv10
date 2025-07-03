import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import '../../domain/entities/symptom_log.dart';

class PdfReportService {
  Future<Uint8List> generateSymptomReport(List<SymptomLog> logs) async {
    final pdf = pw.Document();

    // Load the font that supports CJK characters.
    final fontData = await rootBundle.load(
      'assets/fonts/NotoSansTC-Regular.ttf',
    );
    final ttf = pw.Font.ttf(fontData);

    // Define table headers
    final headers = ['日期', '症狀名稱', '嚴重程度', '筆記'];

    // Convert logs to a list of lists for the table
    final data =
        logs.map((log) {
          return [
            DateFormat.yMd().format(log.recordedAt),
            log.symptomName,
            log.severity.toString(),
            log.notes ?? '',
          ];
        }).toList();

    pdf.addPage(
      pw.MultiPage(
        pageFormat: PdfPageFormat.a4,
        build: (pw.Context context) {
          return [
            pw.Header(
              level: 0,
              child: pw.Text(
                '症狀日誌總結報告',
                style: pw.TextStyle(font: ttf, fontSize: 24),
              ),
            ),
            pw.TableHelper.fromTextArray(
              headers: headers,
              data: data,
              headerStyle: pw.TextStyle(
                font: ttf,
                fontWeight: pw.FontWeight.bold,
              ),
              cellStyle: pw.TextStyle(font: ttf),
              border: pw.TableBorder.all(),
              headerDecoration: const pw.BoxDecoration(
                color: PdfColors.grey300,
              ),
              cellAlignment: pw.Alignment.centerLeft,
              cellAlignments: {
                2: pw.Alignment.center, // Center align severity
              },
            ),
          ];
        },
      ),
    );

    return pdf.save();
  }
}
