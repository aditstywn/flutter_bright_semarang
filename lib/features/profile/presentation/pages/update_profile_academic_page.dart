import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/component/custom_textformfield.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../data/models/request/update_perofile_academic_request_model.dart';
import '../../data/models/response/profile_response_model.dart';
import '../bloc/profile/profile_bloc.dart';
import '../bloc/submit_profile/submit_profile_bloc.dart';

class UpdateProfileAcademicPage extends StatefulWidget {
  final Academic? academic;

  const UpdateProfileAcademicPage({super.key, this.academic});

  @override
  State<UpdateProfileAcademicPage> createState() =>
      _UpdateProfileAcademicPageState();
}

class _UpdateProfileAcademicPageState extends State<UpdateProfileAcademicPage> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _universitasController;
  late final TextEditingController _fakultasController;
  late final TextEditingController _prodiController;
  late final TextEditingController _nimController;
  late final TextEditingController _jenjangController;
  late final TextEditingController _semesterController;

  @override
  void initState() {
    super.initState();
    _universitasController = TextEditingController(
      text: widget.academic?.universitas ?? '',
    );
    _fakultasController = TextEditingController(
      text: widget.academic?.fakultas ?? '',
    );
    _prodiController = TextEditingController(
      text: widget.academic?.prodi ?? '',
    );
    _nimController = TextEditingController(text: widget.academic?.nim ?? '');
    _jenjangController = TextEditingController(
      text: widget.academic?.jenjang ?? '',
    );
    _semesterController = TextEditingController(
      text: widget.academic?.semester?.toString() ?? '',
    );
  }

  @override
  void dispose() {
    _universitasController.dispose();
    _fakultasController.dispose();
    _prodiController.dispose();
    _nimController.dispose();
    _jenjangController.dispose();
    _semesterController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(title: const Text('Update Profile Akademik')),
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
                        Icons.school_outlined,
                        size: 20,
                        color: ColorsApp.primary,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Data Akademik',
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
                    'Perbarui data universitas dan pendidikan Anda saat ini.',
                    style: TextStyle(fontSize: 12, color: ColorsApp.gray500),
                  ),
                  const SizedBox(height: 18),

                  CustomTextFormField(
                    controller: _universitasController,
                    label: 'Universitas',
                    isRequired: true,
                    hintText: 'Contoh: Universitas Dian Nuswantoro',
                    prefixIcon: const Icon(
                      Icons.account_balance_outlined,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Universitas tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  CustomTextFormField(
                    controller: _fakultasController,
                    label: 'Fakultas',
                    isRequired: true,
                    hintText: 'Contoh: Ekonomi dan Bisnis',
                    prefixIcon: const Icon(
                      Icons.domain_outlined,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Fakultas tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  CustomTextFormField(
                    controller: _prodiController,
                    label: 'Program Studi',
                    isRequired: true,
                    hintText: 'Contoh: Manajemen',
                    prefixIcon: const Icon(
                      Icons.menu_book_outlined,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Program studi tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  CustomTextFormField(
                    controller: _nimController,
                    label: 'NIM',
                    isRequired: true,
                    hintText: 'Contoh: B11.2021.01234',
                    prefixIcon: const Icon(
                      Icons.badge_outlined,
                      size: 19,
                      color: ColorsApp.gray400,
                    ),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'NIM tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 14),

                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: CustomTextFormField(
                          controller: _jenjangController,
                          label: 'Jenjang',
                          isRequired: true,
                          hintText: 'Contoh: S1',
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Wajib diisi';
                            }
                            return null;
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: CustomTextFormField(
                          controller: _semesterController,
                          label: 'Semester',
                          isRequired: true,
                          hintText: 'Contoh: 6',
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Wajib diisi';
                            }
                            if (int.tryParse(value.trim()) == null) {
                              return 'Harus berupa angka';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
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

                          final request = UpdateProfileAcademicRequestModel(
                            universitas: _universitasController.text.trim(),
                            fakultas: _fakultasController.text.trim(),
                            prodi: _prodiController.text.trim(),
                            nim: _nimController.text.trim(),
                            jenjang: _jenjangController.text.trim(),
                            semester: int.tryParse(
                              _semesterController.text.trim(),
                            ),
                          );

                          context.read<SubmitProfileBloc>().add(
                            SubmitProfileEvent.updateProfileAcademic(request),
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
