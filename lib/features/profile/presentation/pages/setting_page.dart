import 'package:material_ui/material_ui.dart';

import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/profile_response_model.dart';
import 'change_password_page.dart';
import 'update_profile_academic_page.dart';
import 'update_profile_page.dart';

class SettingPage extends StatefulWidget {
  final Profile? profile;

  const SettingPage({super.key, this.profile});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(title: const Text('Pengaturan')),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Informasi Akun',
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: ColorsApp.gray600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorsApp.gray200),
              ),
              child: Column(
                children: [
                  _SettingMenuTile(
                    icon: Icons.person_outline_rounded,
                    title: 'Update Profile',
                    subtitle: 'Nama, tanggal lahir, nomor HP, dan alamat',
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(16),
                    ),
                    onTap: () {
                      context.push(UpdateProfilePage(profile: widget.profile));
                    },
                  ),
                  const Divider(height: 1, color: ColorsApp.gray100),
                  _SettingMenuTile(
                    icon: Icons.school_outlined,
                    title: 'Update Profile Academic',
                    subtitle: 'Universitas, fakultas, prodi, NIM, dan semester',
                    borderRadius: const BorderRadius.vertical(
                      bottom: Radius.circular(16),
                    ),
                    onTap: () {
                      context.push(
                        UpdateProfileAcademicPage(
                          academic: widget.profile?.academic,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 18),
            const Text(
              'Keamanan',
              style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w700,
                color: ColorsApp.gray600,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: ColorsApp.gray200),
              ),
              child: _SettingMenuTile(
                icon: Icons.lock_reset_rounded,
                title: 'Ganti Password',
                subtitle: 'Perbarui password akun secara berkala',
                borderRadius: BorderRadius.circular(16),
                onTap: () {
                  context.push(const ChangePasswordPage());
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SettingMenuTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final BorderRadius borderRadius;
  final VoidCallback onTap;

  const _SettingMenuTile({
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.borderRadius,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        borderRadius: borderRadius,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEF2F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: ColorsApp.primary, size: 21),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.gray900,
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 11.5,
                        color: ColorsApp.gray500,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              const Icon(
                Icons.chevron_right_rounded,
                color: ColorsApp.gray400,
                size: 22,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
