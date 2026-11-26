import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';

class LeaveDatePickerField extends StatelessWidget {
  final String label;
  final String dateText;
  final VoidCallback onTap;

  const LeaveDatePickerField({
    super.key,
    required this.label,
    required this.dateText,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 11.5,
            fontWeight: FontWeight.w600,
            color: ColorsApp.gray500,
          ),
        ),
        const SizedBox(height: 5),
        Material(
          color: ColorsApp.white,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: ColorsApp.gray300),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      dateText,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: ColorsApp.gray900,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  const Icon(
                    Icons.calendar_today_outlined,
                    size: 16,
                    color: ColorsApp.gray500,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
