import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/profile_response_model.dart';

class ProfileInternshipCard extends StatelessWidget {
  final Internship? internship;

  const ProfileInternshipCard({super.key, this.internship});

  String _formatDate(DateTime? date) {
    if (date == null) return '-';
    return DateFormat('dd MMM yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    final int progress = (internship?.progressPersen ?? 0).clamp(0, 100);
    final int sisaHari = internship?.sisaHari ?? 0;
    final int durasiBulan = internship?.durasiMagangBulan ?? 0;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
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
              const Icon(
                Icons.work_outline_rounded,
                size: 19,
                color: ColorsApp.primary,
              ),
              const SizedBox(width: 8),
              const Expanded(
                child: Text(
                  'Progres Magang',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.gray900,
                  ),
                ),
              ),
              Text(
                '$progress%',
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w800,
                  color: ColorsApp.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: LinearProgressIndicator(
              value: progress / 100,
              minHeight: 7,
              backgroundColor: ColorsApp.gray200,
              valueColor: const AlwaysStoppedAnimation<Color>(
                ColorsApp.primary,
              ),
            ),
          ),
          const SizedBox(height: 14),
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
                    child: _InternshipMetric(
                      label: 'Durasi',
                      value: '$durasiBulan Bulan',
                    ),
                  ),
                  const VerticalDivider(
                    width: 20,
                    thickness: 1,
                    color: ColorsApp.gray200,
                  ),
                  Expanded(
                    child: _InternshipMetric(
                      label: 'Sisa Waktu',
                      value: '$sisaHari Hari',
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.date_range_rounded,
                size: 15,
                color: ColorsApp.gray400,
              ),
              const SizedBox(width: 6),
              Expanded(
                child: Text(
                  '${_formatDate(internship?.tglMasukMagang)} – ${_formatDate(internship?.tglSelesaiMagang)}',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                    color: ColorsApp.gray600,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InternshipMetric extends StatelessWidget {
  final String label;
  final String value;

  const _InternshipMetric({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11,
            fontWeight: FontWeight.w500,
            color: ColorsApp.gray500,
          ),
        ),
        const SizedBox(height: 3),
        Text(
          value,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w700,
            color: ColorsApp.gray900,
          ),
        ),
      ],
    );
  }
}
