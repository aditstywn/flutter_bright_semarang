import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';

class LeaveFieldLabel extends StatelessWidget {
  final IconData icon;
  final String label;
  final String? subtitle;

  const LeaveFieldLabel({
    super.key,
    required this.icon,
    required this.label,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: 16, color: ColorsApp.primary),
        const SizedBox(width: 6),
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: ColorsApp.gray800,
          ),
        ),
        if (subtitle != null) ...[
          const SizedBox(width: 6),
          Expanded(
            child: Text(
              subtitle!,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 11.5,
                color: ColorsApp.gray500,
              ),
            ),
          ),
        ],
      ],
    );
  }
}
