import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/profile_response_model.dart';

class ProfileHeaderCard extends StatelessWidget {
  final Profile? profile;
  final VoidCallback? onEditFotoTap;
  final bool isUploadingFoto;

  const ProfileHeaderCard({
    super.key,
    this.profile,
    this.onEditFotoTap,
    this.isUploadingFoto = false,
  });

  String _getInitials(String? name) {
    final trimmed = name?.trim() ?? '';
    if (trimmed.isEmpty) return '?';
    final parts = trimmed.split(RegExp(r'\s+'));
    if (parts.length >= 2) {
      return '${parts[0][0]}${parts[1][0]}'.toUpperCase();
    }
    return trimmed.length >= 2
        ? trimmed.substring(0, 2).toUpperCase()
        : trimmed[0].toUpperCase();
  }

  String _capitalize(String? text) {
    final trimmed = text?.trim() ?? '';
    if (trimmed.isEmpty) return '-';
    return '${trimmed[0].toUpperCase()}${trimmed.substring(1).toLowerCase()}';
  }

  @override
  Widget build(BuildContext context) {
    final fotoUrl = profile?.fotoUrl?.trim() ?? '';
    final statusMagang = profile?.internship?.statusMagang?.trim() ?? '';
    final bool isActive = statusMagang.toLowerCase() == 'aktif';
    final String roleText = _capitalize(profile?.role);
    final String statusText = statusMagang.isNotEmpty
        ? _capitalize(statusMagang)
        : '';

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: ColorsApp.gray200),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: isUploadingFoto ? null : onEditFotoTap,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: fotoUrl.isNotEmpty
                      ? CachedNetworkImage(
                          imageUrl: fotoUrl,
                          width: 68,
                          height: 68,
                          fit: BoxFit.cover,
                          placeholder: (_, _) => AvatarFallback(
                            initials: _getInitials(profile?.nama),
                          ),
                          errorWidget: (_, _, _) => AvatarFallback(
                            initials: _getInitials(profile?.nama),
                          ),
                        )
                      : AvatarFallback(initials: _getInitials(profile?.nama)),
                ),
                if (isUploadingFoto)
                  Positioned.fill(
                    child: Container(
                      decoration: BoxDecoration(
                        color: ColorsApp.black.withAlpha(110),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 22,
                        height: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2.2,
                          color: ColorsApp.white,
                        ),
                      ),
                    ),
                  ),
                if (onEditFotoTap != null && !isUploadingFoto)
                  Positioned(
                    right: -5,
                    bottom: -5,
                    child: Container(
                      width: 26,
                      height: 26,
                      decoration: BoxDecoration(
                        color: ColorsApp.primary,
                        shape: BoxShape.circle,
                        border: Border.all(color: ColorsApp.white, width: 2),
                      ),
                      child: const Icon(
                        Icons.edit_rounded,
                        size: 13,
                        color: ColorsApp.white,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  profile?.nama ?? '-',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    color: ColorsApp.gray900,
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  profile?.email ?? '-',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 12.5,
                    color: ColorsApp.gray500,
                  ),
                ),
                const SizedBox(height: 8),
                Wrap(
                  spacing: 6,
                  runSpacing: 6,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 9,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: const Color(0xFFFEF2F2),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Text(
                        roleText,
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w700,
                          color: ColorsApp.primary,
                        ),
                      ),
                    ),
                    if (statusText.isNotEmpty)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 9,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: isActive
                              ? const Color(0xFFF0FDF4)
                              : ColorsApp.gray100,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isActive
                                ? const Color(0xFFBBF7D0)
                                : ColorsApp.gray200,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                              width: 6,
                              height: 6,
                              decoration: BoxDecoration(
                                color: isActive
                                    ? const Color(0xFF16A34A)
                                    : ColorsApp.gray500,
                                shape: BoxShape.circle,
                              ),
                            ),
                            const SizedBox(width: 5),
                            Text(
                              statusText,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: isActive
                                    ? const Color(0xFF15803D)
                                    : ColorsApp.gray600,
                              ),
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AvatarFallback extends StatelessWidget {
  final String initials;

  const AvatarFallback({super.key, required this.initials});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 68,
      height: 68,
      decoration: BoxDecoration(
        color: const Color(0xFFFEF2F2),
        borderRadius: BorderRadius.circular(16),
      ),
      alignment: Alignment.center,
      child: Text(
        initials,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w800,
          color: ColorsApp.primary,
        ),
      ),
    );
  }
}
