import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../../auth/data/datasource/auth_local_datasource.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../../profile/data/models/response/profile_response_model.dart';
import '../../../profile/presentation/widgets/profile_header_card.dart';

class DashboardHeader extends StatefulWidget {
  final Profile? user;
  final VoidCallback? onLogoutTap;

  const DashboardHeader({super.key, this.user, this.onLogoutTap});

  @override
  State<DashboardHeader> createState() => _DashboardHeaderState();
}

class _DashboardHeaderState extends State<DashboardHeader> {
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

  Future<void> confirmLogout() async {
    final bool? confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: ColorsApp.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: const Text(
          'Keluar dari Akun',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
        ),
        content: const Text(
          'Apakah Anda yakin ingin keluar dari aplikasi?',
          style: TextStyle(fontSize: 13.5, color: ColorsApp.gray600),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text(
              'Batal',
              style: TextStyle(color: ColorsApp.gray600),
            ),
          ),
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: ColorsApp.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: () => Navigator.of(context).pop(true),
            child: const Text('Keluar'),
          ),
        ],
      ),
    );

    if (confirmed == true && mounted) {
      await AuthLocalDatasource().clearAllData();
      if (!mounted) return;
      context.pushAndRemoveUntil(const LoginPage(), (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: ColorsApp.white,
            borderRadius: BorderRadius.circular(14),
          ),
          alignment: Alignment.center,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: widget.user?.fotoUrl ?? '',
              imageBuilder: (context, imageProvider) => Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              placeholder: (_, _) =>
                  AvatarFallback(initials: _getInitials(widget.user?.nama)),
              errorWidget: (_, _, _) =>
                  AvatarFallback(initials: _getInitials(widget.user?.nama)),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.user?.nama ?? '-',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 19,
                  fontWeight: FontWeight.w800,
                  color: ColorsApp.white,
                  letterSpacing: 0.2,
                ),
              ),
              const SizedBox(height: 2),

              Text(
                widget.user?.academic?.universitas ?? '-',
                style: TextStyle(
                  fontSize: 12.5,
                  color: ColorsApp.white.withAlpha(220),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
        Material(
          color: ColorsApp.white.withAlpha(42),
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: confirmLogout,
            borderRadius: BorderRadius.circular(12),
            child: Container(
              width: 42,
              height: 42,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: ColorsApp.white.withAlpha(70)),
              ),
              child: const Icon(Icons.logout, color: ColorsApp.white, size: 22),
            ),
          ),
        ),
      ],
    );
  }
}
