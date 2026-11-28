import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/component/custom_textformfield.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../data/models/request/update_profile_request_model.dart';
import '../../data/models/response/profile_response_model.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/submit_profile/submit_profile_bloc.dart';

class UpdateProfilePage extends StatefulWidget {
  final Profile? profile;

  const UpdateProfilePage({super.key, this.profile});

  @override
  State<UpdateProfilePage> createState() => _UpdateProfilePageState();
}

class _UpdateProfilePageState extends State<UpdateProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _namaController;
  late final TextEditingController _ttlController;
  late final TextEditingController _noHpController;
  late final TextEditingController _alamatController;

  DateTime? _selectedTtl;

  @override
  void initState() {
    super.initState();
    _selectedTtl = widget.profile?.ttl;
    _namaController = TextEditingController(text: widget.profile?.nama ?? '');
    _ttlController = TextEditingController(
      text: _selectedTtl != null
          ? DateFormat('dd/MM/yyyy').format(_selectedTtl!)
          : '',
    );
    _noHpController = TextEditingController(text: widget.profile?.noHp ?? '');
    _alamatController = TextEditingController(
      text: widget.profile?.alamat ?? '',
    );
  }

  Future<void> _pickBirthDate() async {
    final now = DateTime.now();
    final initialDate = _selectedTtl ?? DateTime(now.year - 20, 1, 1);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1960),
      lastDate: now,
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: ColorsApp.primary,
              onPrimary: ColorsApp.white,
              onSurface: ColorsApp.gray900,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked == null) return;

    setState(() {
      _selectedTtl = picked;
      _ttlController.text = DateFormat('dd/MM/yyyy').format(picked);
    });
  }

  @override
  void dispose() {
    _namaController.dispose();
    _ttlController.dispose();
    _noHpController.dispose();
    _alamatController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(title: const Text('Update Profile')),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: ColorsApp.white,
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: ColorsApp.gray200),
            ),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    children: [
                      Icon(
                        Icons.person_outline_rounded,
                        size: 20,
                        color: ColorsApp.primary,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Data Pribadi',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: ColorsApp.gray900,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Perbarui informasi data diri Anda dengan benar.',
                    style: TextStyle(fontSize: 12, color: ColorsApp.gray500),
                  ),
                  const SizedBox(height: 18),

                  CustomTextFormField(
                    controller: _namaController,
                    label: 'Nama Lengkap',
                    isRequired: true,
                    hintText: 'Masukkan nama lengkap',
                    prefixIcon: const Icon(
                      Icons.person_outline_rounded,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nama lengkap tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  GestureDetector(
                    onTap: _pickBirthDate,
                    child: AbsorbPointer(
                      child: CustomTextFormField(
                        controller: _ttlController,
                        label: 'Tanggal Lahir',
                        isRequired: true,
                        hintText: 'Pilih tanggal lahir',
                        readOnly: true,
                        fillColor: ColorsApp.white,
                        prefixIcon: const Icon(
                          Icons.cake_outlined,
                          size: 19,
                          color: ColorsApp.gray400,
                        ),
                        suffixIcon: const Icon(
                          Icons.calendar_today_outlined,
                          size: 18,
                          color: ColorsApp.gray500,
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Tanggal lahir tidak boleh kosong';
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 14),

                  CustomTextFormField(
                    controller: _noHpController,
                    label: 'Nomor HP',
                    isRequired: true,
                    hintText: 'Contoh: 082255357872',
                    keyboardType: TextInputType.phone,
                    prefixIcon: const Icon(
                      Icons.phone_outlined,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Nomor HP tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  CustomTextFormField(
                    controller: _alamatController,
                    label: 'Alamat',
                    isRequired: true,
                    hintText: 'Masukkan alamat lengkap Anda',
                    maxLines: 3,
                    prefixIcon: const Icon(
                      Icons.location_on_outlined,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Alamat tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 22),

                  BlocConsumer<SubmitProfileBloc, SubmitProfileState>(
                    listener: (context, state) {
                      switch (state) {
                        case SubmitProfileSuccess(:final message):
                          context.showAlertSuccess(message: message);
                          context.read<ProfileBloc>().add(
                            const ProfileEvent.getProfile(),
                          );

                          context.pop();
                          context.pop();
                          break;
                        case ErrorSubmitProfile(:final message):
                          context.showAlertError(message: message);
                          break;
                        default:
                          break;
                      }
                    },
                    builder: (context, state) {
                      final isLoading = state is LoadingSubmitProfile;
                      return Button.filled(
                        label: 'Simpan Perubahan',
                        height: 48,
                        borderRadius: 12,
                        color: ColorsApp.primary,
                        loading: isLoading,
                        disabled: isLoading,
                        onPressed: () {
                          if (!_formKey.currentState!.validate()) return;
                          if (_selectedTtl == null) {
                            context.showAlertError(
                              message: 'Pilih tanggal lahir terlebih dahulu',
                            );
                            return;
                          }

                          final request = UpdateProfileRequestModel(
                            nama: _namaController.text.trim(),
                            ttl: _selectedTtl,
                            alamat: _alamatController.text.trim(),
                            noHp: _noHpController.text.trim(),
                          );

                          context.read<SubmitProfileBloc>().add(
                            SubmitProfileEvent.updateProfile(request),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
