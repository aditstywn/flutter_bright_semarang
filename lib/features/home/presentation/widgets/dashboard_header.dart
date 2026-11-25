import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../../auth/data/models/response/login_response_model.dart';

class DashboardHeader extends StatelessWidget {
  final User? user;
  final VoidCallback? onLogoutTap;

  const DashboardHeader({super.key, this.user, this.onLogoutTap});

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
              imageUrl: user?.fotoUrl ?? '',
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
              placeholder: (context, url) => const CircularProgressIndicator(),
              errorWidget: (context, url, error) => Text(
                user?.nama != null && user!.nama!.isNotEmpty
                    ? user!.nama![0].toUpperCase()
                    : '-',
                style: const TextStyle(
                  color: ColorsApp.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 14),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user?.nama ?? '-',
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
                user?.universitas ?? '-',
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
            onTap: onLogoutTap,
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
