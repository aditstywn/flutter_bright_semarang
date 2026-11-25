import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';

class MenuCard extends StatelessWidget {
  final VoidCallback onLeaveRequestTap;
  final VoidCallback onMyTasksTap;
  final VoidCallback onPresenceHistoryTap;

  const MenuCard({
    super.key,
    required this.onLeaveRequestTap,
    required this.onMyTasksTap,
    required this.onPresenceHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Menu',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w700,
            color: ColorsApp.gray900,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: _MenuTile(
                icon: Icons.event_note_outlined,
                label: 'Pengajuan Izin',
                onTap: onLeaveRequestTap,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _MenuTile(
                icon: Icons.task_alt_rounded,
                label: 'Tugas Saya',
                onTap: onMyTasksTap,
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: _MenuTile(
                icon: Icons.history_rounded,
                label: 'Riwayat Presensi',
                onTap: onPresenceHistoryTap,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _MenuTile extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ColorsApp.gray200),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(14),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 14),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 42,
                  height: 42,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF2F2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: ColorsApp.primary, size: 22),
                ),
                const SizedBox(height: 9),
                FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Text(
                    label,
                    maxLines: 1,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 11.5,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.gray800,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
