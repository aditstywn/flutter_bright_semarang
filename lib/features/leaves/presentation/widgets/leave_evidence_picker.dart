import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/style/color/colors_app.dart';

class LeaveEvidencePicker extends StatelessWidget {
  final XFile? file;
  final VoidCallback onPickTap;
  final VoidCallback onRemoveTap;

  const LeaveEvidencePicker({
    super.key,
    required this.file,
    required this.onPickTap,
    required this.onRemoveTap,
  });

  @override
  Widget build(BuildContext context) {
    if (file == null) {
      return Material(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        child: InkWell(
          onTap: onPickTap,
          borderRadius: BorderRadius.circular(14),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: ColorsApp.gray300, width: 1.2),
            ),
            child: Column(
              children: [
                const Icon(
                  Icons.add_photo_alternate_outlined,
                  size: 34,
                  color: ColorsApp.gray400,
                ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 5,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF2F2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'Pilih File',
                    style: TextStyle(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w700,
                      color: ColorsApp.primary,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                const Text(
                  'PNG, JPG (Max. 2MB)',
                  style: TextStyle(fontSize: 11.5, color: ColorsApp.gray500),
                ),
              ],
            ),
          ),
        ),
      );
    }

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: ColorsApp.gray200),
      ),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.file(
              File(file!.path),
              width: double.infinity,
              height: 190,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: Button.outlined(
                  label: 'Ganti Foto',
                  height: 38,
                  fontSize: 12.5,
                  borderRadius: 10,
                  borderColor: ColorsApp.gray300,
                  textColor: ColorsApp.gray700,
                  onPressed: onPickTap,
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Button.outlined(
                  label: 'Hapus',
                  height: 38,
                  fontSize: 12.5,
                  borderRadius: 10,
                  borderColor: ColorsApp.primary.withAlpha(110),
                  textColor: ColorsApp.primary,
                  onPressed: onRemoveTap,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
