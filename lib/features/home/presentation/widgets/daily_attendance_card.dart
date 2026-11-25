import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/dashboard_response_model.dart';

class DailyAttendanceCard extends StatelessWidget {
  final HariIni? hariIni;
  final VoidCallback onCheckInTap;
  final VoidCallback onCheckOutTap;

  const DailyAttendanceCard({
    super.key,
    this.hariIni,
    required this.onCheckInTap,
    required this.onCheckOutTap,
  });

  String _formatJam(String? time) {
    if (time == null || time.isEmpty) return '--:--';
    final parts = time.split(':');
    if (parts.length >= 2) {
      return '${parts[0]}:${parts[1]}';
    }
    return time;
  }

  @override
  Widget build(BuildContext context) {
    final statusPresensi = hariIni?.statusPresensi;
    final jamKerja = hariIni?.jamKerja;

    final (String shiftLabel, Color dotColor) = switch ((
      statusPresensi?.sudahMasuk ?? false,
      statusPresensi?.sudahPulang ?? false,
    )) {
      (true, true) => ('Selesai', const Color(0xFF16A34A)),
      (true, false) => ('Dalam Shift', ColorsApp.primary),
      _ => ('Belum Masuk', ColorsApp.gray400),
    };

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColorsApp.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.calendar_today_rounded,
                  color: ColorsApp.primary,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      DateFormat('dd MMMM yyyy')
                          .format(hariIni?.tanggal ?? DateTime.now()),
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.gray900,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      'Jam : ${_formatJam(jamKerja?.batasMasuk)} - ${_formatJam(jamKerja?.batasPulang)} WIB',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 11, color: ColorsApp.gray500),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 5,
                ),
                decoration: BoxDecoration(
                  color: ColorsApp.gray100,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 7,
                      height: 7,
                      decoration: BoxDecoration(
                        color: dotColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      shiftLabel,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: ColorsApp.gray800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          Container(
            padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 14),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ColorsApp.gray200),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: _TimeColumn(
                      title: 'Masuk',
                      time: _formatJam(statusPresensi?.waktuMasuk),
                      statusLabel: statusPresensi?.waktuMasuk != null
                          ? 'Hadir'
                          : 'Belum',
                      isDone: statusPresensi?.waktuMasuk != null,
                    ),
                  ),
                  const VerticalDivider(
                    width: 24,
                    thickness: 1,
                    color: ColorsApp.gray200,
                  ),
                  Expanded(
                    child: _TimeColumn(
                      title: 'Pulang',
                      time: _formatJam(statusPresensi?.waktuPulang),
                      statusLabel: statusPresensi?.waktuPulang != null
                          ? 'Selesai'
                          : 'Belum',
                      isDone: statusPresensi?.waktuPulang != null,
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 14),

          Row(
            children: [
              Expanded(
                child: _AttendanceActionButton(
                  label: statusPresensi?.waktuMasuk != null
                      ? 'Telah Masuk'
                      : 'Absen Masuk',
                  icon: statusPresensi?.waktuMasuk != null
                      ? Icons.check_circle_rounded
                      : Icons.login_rounded,
                  isCompleted: statusPresensi?.sudahMasuk == true,
                  isEnabled: statusPresensi?.sudahMasuk == false,
                  activeColor: ColorsApp.primary,
                  onTap: onCheckInTap,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: _AttendanceActionButton(
                  label: statusPresensi?.waktuPulang != null
                      ? 'Telah Pulang'
                      : 'Absen Pulang',
                  icon: statusPresensi?.waktuPulang != null
                      ? Icons.check_circle_rounded
                      : Icons.logout_rounded,
                  isCompleted: statusPresensi?.sudahPulang == true,
                  isEnabled: statusPresensi?.sudahPulang == false,
                  activeColor: ColorsApp.primary,
                  onTap: onCheckOutTap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimeColumn extends StatelessWidget {
  final String title;
  final String time;
  final String statusLabel;
  final bool isDone;

  const _TimeColumn({
    required this.title,
    required this.time,
    required this.statusLabel,
    required this.isDone,
  });

  @override
  Widget build(BuildContext context) {
    final Color statusColor = isDone
        ? const Color(0xFF16A34A)
        : ColorsApp.gray500;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: ColorsApp.gray500,
              ),
            ),
            const Spacer(),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6,
                  height: 6,
                  decoration: BoxDecoration(
                    color: statusColor,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  statusLabel,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: statusColor,
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 8),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w800,
                color: ColorsApp.gray900,
                letterSpacing: 0.4,
              ),
            ),
            const SizedBox(width: 4),
            const Text(
              'WIB',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: ColorsApp.gray400,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _AttendanceActionButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final bool isCompleted;
  final bool isEnabled;
  final Color activeColor;
  final VoidCallback onTap;

  const _AttendanceActionButton({
    required this.label,
    required this.icon,
    required this.isCompleted,
    required this.isEnabled,
    required this.activeColor,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final BoxDecoration decoration;
    final Color contentColor;

    if (isCompleted) {
      decoration = BoxDecoration(
        color: const Color(0xFFF0FDF4),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: const Color(0xFFBBF7D0), width: 1.2),
      );
      contentColor = const Color(0xFF15803D);
    } else if (isEnabled) {
      decoration = BoxDecoration(
        color: activeColor,
        borderRadius: BorderRadius.circular(12),
      );
      contentColor = ColorsApp.white;
    } else {
      decoration = BoxDecoration(
        color: ColorsApp.gray100,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorsApp.gray200),
      );
      contentColor = ColorsApp.gray400;
    }

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: isEnabled ? onTap : null,
        borderRadius: BorderRadius.circular(12),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeOut,
          height: 46,
          decoration: decoration,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 17, color: contentColor),
              const SizedBox(width: 7),
              Flexible(
                child: Text(
                  label,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: contentColor,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
