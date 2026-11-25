import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';

class ShiftReminderBanner extends StatelessWidget {
  final VoidCallback? onDismiss;
  final String? time;
  final bool sudahMasuk;

  const ShiftReminderBanner({
    super.key,
    this.onDismiss,
    this.time,
    this.sudahMasuk = false,
  });

  String _formatJam(String? rawTime) {
    if (rawTime == null || rawTime.isEmpty) return '16:00';
    final parts = rawTime.split(':');
    if (parts.length >= 2) {
      return '${parts[0]}:${parts[1]}';
    }
    return rawTime;
  }

  @override
  Widget build(BuildContext context) {
    final bool isWarning = !sudahMasuk;

    return Container(
      decoration: BoxDecoration(
        color: isWarning ? const Color(0xFFFEF2F2) : ColorsApp.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isWarning
              ? ColorsApp.primary.withAlpha(55)
              : ColorsApp.gray200,
        ),
      ),
      child: IntrinsicHeight(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              width: 4,
              decoration: const BoxDecoration(
                color: ColorsApp.primary,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(14),
                  bottomLeft: Radius.circular(14),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(12, 12, 8, 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: isWarning
                            ? ColorsApp.primary.withAlpha(28)
                            : const Color(0xFFFEF2F2),
                        borderRadius: BorderRadius.circular(9),
                      ),
                      child: Icon(
                        isWarning
                            ? Icons.error_rounded
                            : Icons.notifications_active_rounded,
                        color: ColorsApp.primary,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            isWarning
                                ? 'Peringatan Presensi'
                                : 'Pengingat Shift',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w700,
                              color: isWarning
                                  ? const Color(0xFF991B1B)
                                  : ColorsApp.gray900,
                            ),
                          ),
                          const SizedBox(height: 3),
                          if (isWarning)
                            RichText(
                              text: const TextSpan(
                                style: TextStyle(
                                  fontSize: 12,
                                  height: 1.4,
                                  color: Color(0xFFB91C1C),
                                ),
                                children: [
                                  TextSpan(text: 'Anda belum melakukan '),
                                  TextSpan(
                                    text: 'Presensi Masuk',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' hari ini. Silakan lakukan absensi terlebih dahulu sebelum mulai bekerja atau mengerjakan tugas.',
                                  ),
                                ],
                              ),
                            )
                          else
                            RichText(
                              text: TextSpan(
                                style: const TextStyle(
                                  fontSize: 12,
                                  height: 1.4,
                                  color: ColorsApp.gray600,
                                ),
                                children: [
                                  const TextSpan(
                                    text: 'Pastikan unggah laporan di menu ',
                                  ),
                                  const TextSpan(
                                    text: 'Tugas Saya',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: ColorsApp.gray800,
                                    ),
                                  ),
                                  const TextSpan(text: ' dan lakukan '),
                                  const TextSpan(
                                    text: 'Presensi Pulang',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: ColorsApp.gray800,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        ' sebelum ${_formatJam(time)} WIB.',
                                  ),
                                ],
                              ),
                            ),
                        ],
                      ),
                    ),
                    if (onDismiss != null)
                      GestureDetector(
                        onTap: onDismiss,
                        child: Padding(
                          padding: const EdgeInsets.all(4),
                          child: Icon(
                            Icons.close_rounded,
                            size: 16,
                            color: isWarning
                                ? const Color(0xFFB91C1C)
                                : ColorsApp.gray400,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
