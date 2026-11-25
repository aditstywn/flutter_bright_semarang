import 'package:geolocator/geolocator.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';

class LocationStatusCard extends StatelessWidget {
  final Position? position;
  final bool isLoading;
  final String? errorMessage;
  final VoidCallback onRefresh;

  const LocationStatusCard({
    super.key,
    required this.position,
    required this.isLoading,
    required this.errorMessage,
    required this.onRefresh,
  });

  @override
  Widget build(BuildContext context) {
    final bool hasLocation = position != null;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F7FF),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFDBEAFE)),
      ),
      child: Row(
        children: [
          Container(
            width: 44,
            height: 44,
            decoration: const BoxDecoration(
              color: Color(0xFFDBEAFE),
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2.2,
                      color: Color(0xFF2563EB),
                    ),
                  )
                : Icon(
                    hasLocation
                        ? Icons.location_on_rounded
                        : Icons.location_off_rounded,
                    color: hasLocation
                        ? const Color(0xFF2563EB)
                        : ColorsApp.primary,
                    size: 22,
                  ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Lokasi Anda',
                  style: TextStyle(
                    fontSize: 14.5,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.gray900,
                  ),
                ),
                const SizedBox(height: 3),
                if (isLoading)
                  const Text(
                    'Mendeteksi akurasi GPS...',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: ColorsApp.gray500,
                    ),
                  )
                else if (hasLocation) ...[
                  Text(
                    'Akurasi GPS: ${position!.accuracy.round()} meter',
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF16A34A),
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    '${position!.latitude.toStringAsFixed(5)}, ${position!.longitude.toStringAsFixed(5)}',
                    style: const TextStyle(
                      fontSize: 11,
                      color: ColorsApp.gray500,
                    ),
                  ),
                ] else
                  Text(
                    errorMessage ?? 'Lokasi belum ditemukan',
                    style: const TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w600,
                      color: ColorsApp.primary,
                    ),
                  ),
              ],
            ),
          ),
          IconButton(
            onPressed: isLoading ? null : onRefresh,
            tooltip: 'Perbarui lokasi',
            icon: const Icon(
              Icons.refresh_rounded,
              color: Color(0xFF2563EB),
              size: 20,
            ),
          ),
        ],
      ),
    );
  }
}
