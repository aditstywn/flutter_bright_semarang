import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';

class ProfileInfoItem {
  final IconData icon;
  final String label;
  final String value;

  const ProfileInfoItem({
    required this.icon,
    required this.label,
    required this.value,
  });
}

class ProfileInfoCard extends StatelessWidget {
  final String title;
  final IconData headerIcon;
  final List<ProfileInfoItem> items;

  const ProfileInfoCard({
    super.key,
    required this.title,
    required this.headerIcon,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
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
              Icon(headerIcon, size: 19, color: ColorsApp.primary),
              const SizedBox(width: 8),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.gray900,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          ...items.asMap().entries.map((entry) {
            final index = entry.key;
            final item = entry.value;
            final isLast = index == items.length - 1;
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 32,
                        height: 32,
                        decoration: BoxDecoration(
                          color: const Color(0xFFF8FAFC),
                          borderRadius: BorderRadius.circular(9),
                          border: Border.all(color: ColorsApp.gray200),
                        ),
                        child: Icon(
                          item.icon,
                          size: 16,
                          color: ColorsApp.gray600,
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.label,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: ColorsApp.gray500,
                              ),
                            ),
                            const SizedBox(height: 2),
                            Text(
                              item.value,
                              style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                height: 1.35,
                                color: ColorsApp.gray900,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                if (!isLast) const Divider(height: 1, color: ColorsApp.gray100),
              ],
            );
          }),
        ],
      ),
    );
  }
}
