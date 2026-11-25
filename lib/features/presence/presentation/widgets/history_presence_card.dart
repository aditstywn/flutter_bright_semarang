import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/presence_history_response_model.dart';

class HistoryPresenceCard extends StatelessWidget {
  final RecordHistory? record;

  const HistoryPresenceCard({super.key, this.record});

  String _formatDate(String? rawDate) {
    if (rawDate == null || rawDate.trim().isEmpty) return '-';
    try {
      final parsed = DateTime.parse(rawDate);
      return DateFormat('dd MMMM yyyy').format(parsed);
    } catch (_) {
      return rawDate;
    }
  }

  String _formatTime(String? rawTime) {
    if (rawTime == null || rawTime.trim().isEmpty) return '--:--';
    final parts = rawTime.split(':');
    if (parts.length >= 2) {
      return '${parts[0]}:${parts[1]}';
    }
    return rawTime;
  }

  (Color bg, Color border, Color text) _statusColors(String? value) {
    final normalized = (value ?? '').toLowerCase();
    if (normalized.contains('tepat')) {
      return (
        const Color(0xFFF0FDF4),
        const Color(0xFFBBF7D0),
        const Color(0xFF15803D),
      );
    }
    if (normalized.contains('terlambat') || normalized.contains('telat')) {
      return (
        const Color(0xFFFEF2F2),
        ColorsApp.primary.withAlpha(70),
        ColorsApp.primary,
      );
    }
    return (ColorsApp.gray100, ColorsApp.gray200, ColorsApp.gray700);
  }

  void _showPhotoPreview(BuildContext context, String title, String imageUrl) {
    showDialog<void>(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: ColorsApp.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.gray900,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: const Icon(Icons.close_rounded, size: 20),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: double.infinity,
                  height: 300,
                  fit: BoxFit.cover,
                  placeholder: (_, _) => const SizedBox(
                    height: 220,
                    child: Center(
                      child: CircularProgressIndicator(
                        color: ColorsApp.primary,
                        strokeWidth: 2,
                      ),
                    ),
                  ),
                  errorWidget: (_, _, _) => Container(
                    height: 180,
                    color: ColorsApp.gray100,
                    alignment: Alignment.center,
                    child: const Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.broken_image_outlined,
                          size: 32,
                          color: ColorsApp.gray400,
                        ),
                        SizedBox(height: 6),
                        Text(
                          'Foto tidak dapat dimuat',
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorsApp.gray500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final (badgeBg, badgeBorder, badgeText) = _statusColors(record?.status);
    final bool hasFotoMasuk = record?.fotoMasukUrl != null;
    final bool hasFotoPulang = record?.fotoPulangUrl != null;
    final bool hasKeterangan = record?.keterangan != null;

    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsApp.gray200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 34,
                height: 34,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.calendar_today_rounded,
                  size: 16,
                  color: ColorsApp.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  _formatDate(record?.date?.toIso8601String()),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13.5,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.gray900,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: badgeBg,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: badgeBorder),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Container(
                      width: 6,
                      height: 6,
                      decoration: BoxDecoration(
                        color: badgeText,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      record?.status ?? '-',
                      style: TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: badgeText,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorsApp.gray200),
            ),
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Expanded(
                    child: _HistoryTimeItem(
                      label: 'Masuk',
                      time: _formatTime(record?.waktuAbsen),
                      subStatus: record?.status ?? '-',
                    ),
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    color: ColorsApp.gray200,
                  ),
                  Expanded(
                    child: _HistoryTimeItem(
                      label: 'Pulang',
                      time: _formatTime(record?.waktuPulang),
                      subStatus: record?.statusPulang ?? '-',
                    ),
                  ),
                ],
              ),
            ),
          ),

          if (hasKeterangan || hasFotoMasuk || hasFotoPulang) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                if (hasKeterangan)
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.notes_rounded,
                          size: 15,
                          color: ColorsApp.gray400,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            record?.keterangan ?? '-',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 12,
                              color: ColorsApp.gray600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const Spacer(),
                if (hasFotoMasuk) ...[
                  const SizedBox(width: 8),
                  _PhotoChipButton(
                    label: 'Masuk',
                    onTap: () => _showPhotoPreview(
                      context,
                      'Foto Masuk — ${_formatDate(record?.date?.toIso8601String())}',
                      record?.fotoMasukUrl ?? '',
                    ),
                  ),
                ],
                if (hasFotoPulang) ...[
                  const SizedBox(width: 6),
                  _PhotoChipButton(
                    label: 'Pulang',
                    onTap: () => _showPhotoPreview(
                      context,
                      'Foto Pulang — ${_formatDate(record?.date?.toIso8601String())}',
                      record?.fotoPulangUrl ?? '',
                    ),
                  ),
                ],
              ],
            ),
          ],
        ],
      ),
    );
  }
}

class _HistoryTimeItem extends StatelessWidget {
  final String label;
  final String time;
  final String subStatus;

  const _HistoryTimeItem({
    required this.label,
    required this.time,
    required this.subStatus,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            color: ColorsApp.gray500,
          ),
        ),
        const SizedBox(height: 4),
        Row(
          crossAxisAlignment: CrossAxisAlignment.baseline,
          textBaseline: TextBaseline.alphabetic,
          children: [
            Text(
              time,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w800,
                color: ColorsApp.gray900,
              ),
            ),
            if (time != '--:--') ...[
              const SizedBox(width: 3),
              const Text(
                'WIB',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.gray400,
                ),
              ),
            ],
          ],
        ),
        const SizedBox(height: 2),
        Text(
          subStatus,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: const TextStyle(fontSize: 11, color: ColorsApp.gray500),
        ),
      ],
    );
  }
}

class _PhotoChipButton extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _PhotoChipButton({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: const Color(0xFFFEF2F2),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.photo_outlined,
                size: 13,
                color: ColorsApp.primary,
              ),
              const SizedBox(width: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  color: ColorsApp.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
