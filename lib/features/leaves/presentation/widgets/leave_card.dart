import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/leaves_response_model.dart';

class LeaveCard extends StatelessWidget {
  final Datum? leave;

  const LeaveCard({super.key, this.leave});

  String _formatDateRange(DateTime? start, DateTime? end) {
    if (start == null && end == null) return '-';
    final fmt = DateFormat('dd MMM yyyy');
    if (start != null && end != null) {
      final isSameDay =
          start.year == end.year &&
          start.month == end.month &&
          start.day == end.day;
      if (isSameDay) return fmt.format(start);
      return '${fmt.format(start)} – ${fmt.format(end)}';
    }
    return fmt.format((start ?? end)!);
  }

  int? _durationDays(DateTime? start, DateTime? end) {
    if (start == null || end == null) return null;
    final startDate = DateTime(start.year, start.month, start.day);
    final endDate = DateTime(end.year, end.month, end.day);
    final diff = endDate.difference(startDate).inDays + 1;
    return diff > 0 ? diff : 1;
  }

  String _formatCreatedAt(String? raw) {
    if (raw == null || raw.trim().isEmpty) return '';
    try {
      final parsed = DateTime.parse(raw);
      return DateFormat('dd MMM yyyy, HH:mm').format(parsed);
    } catch (_) {
      return raw;
    }
  }

  (Color bg, Color border, Color text) _statusColors(String? value) {
    final normalized = (value ?? '').toLowerCase();
    if (normalized.contains('setuju') || normalized.contains('approve')) {
      return (
        const Color(0xFFF0FDF4),
        const Color(0xFFBBF7D0),
        const Color(0xFF15803D),
      );
    }
    if (normalized.contains('tolak') || normalized.contains('reject')) {
      return (
        const Color(0xFFFEF2F2),
        ColorsApp.primary.withAlpha(70),
        ColorsApp.primary,
      );
    }
    if (normalized.contains('tunggu') || normalized.contains('pending')) {
      return (
        const Color(0xFFFFFBEB),
        const Color(0xFFFDE68A),
        const Color(0xFFB45309),
      );
    }
    return (ColorsApp.gray100, ColorsApp.gray200, ColorsApp.gray700);
  }

  IconData _jenisIcon(String? jenis) {
    final normalized = (jenis ?? '').toLowerCase();
    if (normalized.contains('sakit')) {
      return Icons.medical_services_outlined;
    }
    return Icons.event_note_outlined;
  }

  void _showPhotoPreview(BuildContext context, String imageUrl) {
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
                      'Bukti ${leave?.jenis ?? 'Izin'}',
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
                          'Foto bukti tidak dapat dimuat',
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
    final (badgeBg, badgeBorder, badgeText) = _statusColors(leave?.status);
    final int? days = _durationDays(leave?.tanggalMulai, leave?.tanggalSelesai);
    final String createdAtText = _formatCreatedAt(leave?.createdAt);

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
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  _jenisIcon(leave?.jenis),
                  size: 18,
                  color: ColorsApp.primary,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      leave?.jenis ?? '-',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.gray900,
                      ),
                    ),
                    if (days != null)
                      Text(
                        'Durasi $days hari',
                        style: const TextStyle(
                          fontSize: 11,
                          color: ColorsApp.gray500,
                        ),
                      ),
                  ],
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
                      leave?.status ?? '-',
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
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            decoration: BoxDecoration(
              color: const Color(0xFFF8FAFC),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: ColorsApp.gray200),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.date_range_rounded,
                  size: 16,
                  color: ColorsApp.gray500,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: Text(
                    _formatDateRange(
                      leave?.tanggalMulai,
                      leave?.tanggalSelesai,
                    ),
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.gray800,
                    ),
                  ),
                ),
              ],
            ),
          ),

          if (leave?.alasan != null) ...[
            const SizedBox(height: 10),
            Text(
              leave!.alasan!,
              style: const TextStyle(
                fontSize: 12.5,
                height: 1.45,
                color: ColorsApp.gray700,
              ),
            ),
          ],

          if (leave?.catatanAdmin != null) ...[
            const SizedBox(height: 10),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              decoration: BoxDecoration(
                color: const Color(0xFFF8FAFC),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorsApp.gray200),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.chat_bubble_outline_rounded,
                    size: 14,
                    color: ColorsApp.gray500,
                  ),
                  const SizedBox(width: 7),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        style: const TextStyle(
                          fontSize: 11.5,
                          height: 1.35,
                          color: ColorsApp.gray600,
                        ),
                        children: [
                          const TextSpan(
                            text: 'Catatan Admin: ',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              color: ColorsApp.gray800,
                            ),
                          ),
                          TextSpan(text: leave!.catatanAdmin!),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],

          if (createdAtText.isNotEmpty || leave?.buktiFotoUrl != null) ...[
            const SizedBox(height: 10),
            Row(
              children: [
                if (createdAtText.isNotEmpty)
                  Expanded(
                    child: Row(
                      children: [
                        const Icon(
                          Icons.schedule_rounded,
                          size: 13,
                          color: ColorsApp.gray400,
                        ),
                        const SizedBox(width: 5),
                        Expanded(
                          child: Text(
                            createdAtText,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 11,
                              color: ColorsApp.gray500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                else
                  const Spacer(),
                if (leave?.buktiFotoUrl != null) ...[
                  const SizedBox(width: 8),
                  Material(
                    color: const Color(0xFFFEF2F2),
                    borderRadius: BorderRadius.circular(8),
                    child: InkWell(
                      onTap: () =>
                          _showPhotoPreview(context, leave!.buktiFotoUrl!),
                      borderRadius: BorderRadius.circular(8),
                      child: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 5,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.photo_outlined,
                              size: 14,
                              color: ColorsApp.primary,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Lihat Bukti',
                              style: TextStyle(
                                fontSize: 11.5,
                                fontWeight: FontWeight.w600,
                                color: ColorsApp.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
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
