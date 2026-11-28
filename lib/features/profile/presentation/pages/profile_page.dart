import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../../auth/data/datasource/auth_local_datasource.dart';
import '../../../auth/presentation/pages/login_page.dart';
import '../../data/models/response/profile_response_model.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/submit_profile/submit_profile_bloc.dart';
import '../widgets/profile_header_card.dart';
import '../widgets/profile_info_card.dart';
import '../widgets/profile_internship_card.dart';
import 'setting_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ImagePicker _imagePicker = ImagePicker();

  Future<void> _loadData() async {
    context.read<ProfileBloc>().add(const ProfileEvent.getProfile());
  }

  void _openSettings(Profile? profile) {
    context.push(SettingPage(profile: profile));
  }

  Future<void> _pickAndUploadPhoto(ImageSource source) async {
    try {
      final picked = await _imagePicker.pickImage(
        source: source,
        imageQuality: 80,
      );
      if (picked == null || !mounted) return;
      context.read<SubmitProfileBloc>().add(
        SubmitProfileEvent.uploadFoto(picked),
      );
    } catch (_) {
      if (mounted) {
        context.showAlertError(message: 'Gagal memilih foto profil');
      }
    }
  }

  void _showUploadPhotoSheet() {
    showModalBottomSheet<void>(
      context: context,
      backgroundColor: ColorsApp.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 12, 16, 16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: ColorsApp.gray300,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 14),
              const Text(
                'Ubah Foto Profil',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.gray900,
                ),
              ),
              const SizedBox(height: 14),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF2F2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.camera_alt_outlined,
                    color: ColorsApp.primary,
                    size: 20,
                  ),
                ),
                title: const Text(
                  'Ambil Foto dari Kamera',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorsApp.gray900,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickAndUploadPhoto(ImageSource.camera);
                },
              ),
              const SizedBox(height: 6),
              ListTile(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                leading: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFEF2F2),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(
                    Icons.photo_library_outlined,
                    color: ColorsApp.primary,
                    size: 20,
                  ),
                ),
                title: const Text(
                  'Pilih dari Galeri',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: ColorsApp.gray900,
                  ),
                ),
                onTap: () {
                  Navigator.of(context).pop();
                  _pickAndUploadPhoto(ImageSource.gallery);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _confirmLogout() async {
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
  void initState() {
    super.initState();
    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: SafeArea(
        child: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            switch (state) {
              case LoadingProfile():
                return const Center(
                  child: CircularProgressIndicator(color: ColorsApp.primary),
                );
              case ErrorProfile(:final message):
                return Center(
                  child: Padding(
                    padding: const EdgeInsets.all(24),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: ColorsApp.gray700,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Button.filled(
                          width: 130,
                          label: 'Coba Lagi',
                          onPressed: _loadData,
                          color: ColorsApp.primary,
                          borderRadius: 10,
                        ),
                      ],
                    ),
                  ),
                );
              case ProfileSuccess(:final profile):
                final data = profile.data;
                final academic = data?.academic;
                final String prodiSummary = [
                  if (academic?.jenjang?.isNotEmpty ?? false)
                    academic!.jenjang!,
                  if (academic?.prodi?.isNotEmpty ?? false) academic!.prodi!,
                  if (academic?.semester != null)
                    '• Semester ${academic!.semester}',
                ].join(' ');

                return RefreshIndicator(
                  color: ColorsApp.primary,
                  onRefresh: _loadData,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Stack(
                      children: [
                        Container(
                          height: 132,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: ColorsApp.primary,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(24),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 14, 16, 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Expanded(
                                    child: Text(
                                      'Profil Saya',
                                      style: TextStyle(
                                        fontSize: 19,
                                        fontWeight: FontWeight.w800,
                                        color: ColorsApp.white,
                                      ),
                                    ),
                                  ),
                                  Material(
                                    color: ColorsApp.white.withAlpha(42),
                                    borderRadius: BorderRadius.circular(12),
                                    child: InkWell(
                                      onTap: () => _openSettings(data),
                                      borderRadius: BorderRadius.circular(12),
                                      child: Container(
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          border: Border.all(
                                            color: ColorsApp.white.withAlpha(
                                              70,
                                            ),
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.settings_outlined,
                                          color: ColorsApp.white,
                                          size: 21,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 18),

                              BlocConsumer<
                                SubmitProfileBloc,
                                SubmitProfileState
                              >(
                                listener: (context, submitState) {
                                  switch (submitState) {
                                    case UploadFotoSuccess(:final message):
                                      context.showAlertSuccess(
                                        message: message,
                                      );
                                      _loadData();
                                      break;
                                    case ErrorUploadFoto(:final message):
                                      context.showAlertError(message: message);
                                      break;
                                    default:
                                      break;
                                  }
                                },
                                builder: (context, submitState) {
                                  return ProfileHeaderCard(
                                    profile: data,
                                    isUploadingFoto:
                                        submitState is LoadingUploadFoto,
                                    onEditFotoTap: _showUploadPhotoSheet,
                                  );
                                },
                              ),
                              const SizedBox(height: 14),

                              ProfileInternshipCard(
                                internship: data?.internship,
                              ),
                              const SizedBox(height: 14),

                              ProfileInfoCard(
                                title: 'Informasi Akademik',
                                headerIcon: Icons.school_outlined,
                                items: [
                                  ProfileInfoItem(
                                    icon: Icons.account_balance_outlined,
                                    label: 'Universitas',
                                    value: academic?.universitas ?? '-',
                                  ),
                                  ProfileInfoItem(
                                    icon: Icons.menu_book_outlined,
                                    label: 'Program Studi',
                                    value: prodiSummary.isNotEmpty
                                        ? prodiSummary
                                        : '-',
                                  ),
                                  ProfileInfoItem(
                                    icon: Icons.badge_outlined,
                                    label: 'NIM',
                                    value: academic?.nim ?? '-',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              ProfileInfoCard(
                                title: 'Kontak',
                                headerIcon: Icons.contact_phone_outlined,
                                items: [
                                  ProfileInfoItem(
                                    icon: Icons.phone_outlined,
                                    label: 'Nomor HP',
                                    value: data?.noHp ?? '-',
                                  ),
                                  ProfileInfoItem(
                                    icon: Icons.location_on_outlined,
                                    label: 'Alamat',
                                    value: data?.alamat ?? '-',
                                  ),
                                ],
                              ),
                              const SizedBox(height: 14),

                              Container(
                                decoration: BoxDecoration(
                                  color: ColorsApp.white,
                                  borderRadius: BorderRadius.circular(16),
                                  border: Border.all(color: ColorsApp.gray200),
                                ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      onTap: () => _openSettings(data),
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          top: Radius.circular(16),
                                        ),
                                      ),
                                      leading: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFF8FAFC),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          border: Border.all(
                                            color: ColorsApp.gray200,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.settings_outlined,
                                          size: 18,
                                          color: ColorsApp.gray700,
                                        ),
                                      ),
                                      title: const Text(
                                        'Pengaturan Akun',
                                        style: TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsApp.gray900,
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.chevron_right_rounded,
                                        color: ColorsApp.gray400,
                                      ),
                                    ),
                                    const Divider(
                                      height: 1,
                                      color: ColorsApp.gray100,
                                    ),
                                    ListTile(
                                      onTap: _confirmLogout,
                                      shape: const RoundedRectangleBorder(
                                        borderRadius: BorderRadius.vertical(
                                          bottom: Radius.circular(16),
                                        ),
                                      ),
                                      leading: Container(
                                        width: 36,
                                        height: 36,
                                        decoration: BoxDecoration(
                                          color: const Color(0xFFFEF2F2),
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                        ),
                                        child: const Icon(
                                          Icons.logout_rounded,
                                          size: 18,
                                          color: ColorsApp.primary,
                                        ),
                                      ),
                                      title: const Text(
                                        'Keluar',
                                        style: TextStyle(
                                          fontSize: 13.5,
                                          fontWeight: FontWeight.w600,
                                          color: ColorsApp.primary,
                                        ),
                                      ),
                                      trailing: const Icon(
                                        Icons.chevron_right_rounded,
                                        color: ColorsApp.primary,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              case _:
                return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
