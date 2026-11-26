import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/component/custom_dropdown.dart';
import '../../../../core/component/custom_textformfield.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../data/models/request/create_leaves_request_model.dart';
import '../bloc/leaves/leaves_bloc.dart';
import '../bloc/submit_leaves/submit_leaves_bloc.dart';
import '../widgets/leave_date_picker_field.dart';
import '../widgets/leave_evidence_picker.dart';
import '../widgets/leave_field_label.dart';

class CreateLeavesPage extends StatefulWidget {
  const CreateLeavesPage({super.key});

  @override
  State<CreateLeavesPage> createState() => _CreateLeavesPageState();
}

class _CreateLeavesPageState extends State<CreateLeavesPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _alasanController = TextEditingController();
  final ImagePicker _imagePicker = ImagePicker();

  static const List<String> _jenisOptions = [
    'Sakit',
    'Izin Tidak Berangkat',
    'Izin Terlambat',
  ];

  String? _selectedJenis;
  DateTime _tanggalMulai = DateTime.now();
  DateTime _tanggalSelesai = DateTime.now();
  XFile? _buktiFile;

  Future<void> _pickDate({required bool isStart}) async {
    final now = DateTime.now();
    final initialDate = isStart ? _tanggalMulai : _tanggalSelesai;
    final firstDate = isStart
        ? DateTime(now.year - 1)
        : DateTime(_tanggalMulai.year, _tanggalMulai.month, _tanggalMulai.day);

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(firstDate) ? firstDate : initialDate,
      firstDate: firstDate,
      lastDate: DateTime(now.year + 2),
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
      if (isStart) {
        _tanggalMulai = picked;
        if (_tanggalSelesai.isBefore(_tanggalMulai)) {
          _tanggalSelesai = picked;
        }
      } else {
        _tanggalSelesai = picked;
      }
    });
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final picked = await _imagePicker.pickImage(
        source: source,
        imageQuality: 80,
      );
      if (picked == null || !mounted) return;
      setState(() => _buktiFile = picked);
    } catch (_) {
      if (mounted) {
        context.showAlertError(message: 'Gagal memilih foto bukti');
      }
    }
  }

  void _showImageSourceSheet() {
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
                'Pilih Sumber Foto Bukti',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.gray900,
                ),
              ),
              const SizedBox(height: 14),
              _buildSourceTile(
                icon: Icons.camera_alt_outlined,
                title: 'Ambil Foto dari Kamera',
                source: ImageSource.camera,
              ),
              const SizedBox(height: 6),
              _buildSourceTile(
                icon: Icons.photo_library_outlined,
                title: 'Pilih dari Galeri',
                source: ImageSource.gallery,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSourceTile({
    required IconData icon,
    required String title,
    required ImageSource source,
  }) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: const Color(0xFFFEF2F2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: ColorsApp.primary, size: 20),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w600,
          color: ColorsApp.gray900,
        ),
      ),
      onTap: () {
        Navigator.of(context).pop();
        _pickImage(source);
      },
    );
  }

  @override
  void dispose() {
    _alasanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final dateFmt = DateFormat('dd/MM/yyyy');

    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(title: const Text('Ajukan Izin')),
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
                  Center(
                    child: Column(
                      children: [
                        Container(
                          width: 56,
                          height: 56,
                          decoration: const BoxDecoration(
                            color: Color(0xFFFEF2F2),
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.mark_email_unread_outlined,
                            color: ColorsApp.primary,
                            size: 26,
                          ),
                        ),
                        const SizedBox(height: 12),
                        const Text(
                          'Pengajuan Izin / Terlambat',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800,
                            color: ColorsApp.gray900,
                          ),
                        ),
                        const SizedBox(height: 4),
                        const Text(
                          'Isi form di bawah ini dan sertakan bukti pendukung.',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 12.5,
                            color: ColorsApp.gray500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 22),

                  const LeaveFieldLabel(
                    icon: Icons.format_list_bulleted_rounded,
                    label: 'Jenis Pengajuan',
                  ),
                  const SizedBox(height: 8),
                  CustomDropdown<String>(
                    value: _selectedJenis,
                    selectedLabel: _selectedJenis,
                    hintText: '-- Pilih Jenis --',
                    items: _jenisOptions
                        .map(
                          (jenis) => DropdownMenuItem<String>(
                            value: jenis,
                            child: Text(
                              jenis,
                              style: const TextStyle(
                                fontSize: 13.5,
                                color: ColorsApp.gray900,
                              ),
                            ),
                          ),
                        )
                        .toList(),
                    onChanged: (value) =>
                        setState(() => _selectedJenis = value),
                  ),
                  const SizedBox(height: 16),

                  const LeaveFieldLabel(
                    icon: Icons.calendar_today_rounded,
                    label: 'Rentang Tanggal',
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Expanded(
                        child: LeaveDatePickerField(
                          label: 'Tanggal Mulai',
                          dateText: dateFmt.format(_tanggalMulai),
                          onTap: () => _pickDate(isStart: true),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: LeaveDatePickerField(
                          label: 'Tanggal Selesai',
                          dateText: dateFmt.format(_tanggalSelesai),
                          onTap: () => _pickDate(isStart: false),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  const LeaveFieldLabel(
                    icon: Icons.notes_rounded,
                    label: 'Alasan Lengkap',
                  ),
                  const SizedBox(height: 8),
                  CustomTextFormField(
                    controller: _alasanController,
                    hintText:
                        'Jelaskan alasan Anda secara singkat dan jelas...',
                    maxLines: 4,
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return 'Alasan tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),

                  const LeaveFieldLabel(
                    icon: Icons.upload_file_rounded,
                    label: 'Upload Bukti',
                    subtitle: '(Surat Dokter / Foto Bukti)',
                  ),
                  const SizedBox(height: 8),
                  LeaveEvidencePicker(
                    file: _buktiFile,
                    onPickTap: _showImageSourceSheet,
                    onRemoveTap: () => setState(() => _buktiFile = null),
                  ),
                  const SizedBox(height: 22),

                  BlocConsumer<SubmitLeavesBloc, SubmitLeavesState>(
                    listener: (context, state) {
                      switch (state) {
                        case SubmitLeavesSuccess(:final response):
                          context.showAlertSuccess(
                            message:
                                response.message ??
                                'Pengajuan izin berhasil dikirim',
                          );
                          context.read<LeavesBloc>().add(
                            const LeavesEvent.getLeaves(),
                          );
                          Navigator.of(context).pop();
                        case ErrorSubmitLeaves(:final message):
                          context.showAlertError(message: message);
                        default:
                      }
                    },
                    builder: (context, state) {
                      if (state is LoadingSubmitLeaves) {
                        return Button.filled(
                          label: 'Kirim Pengajuan',
                          height: 48,
                          borderRadius: 12,
                          color: ColorsApp.primary,
                          icon: const Icon(
                            Icons.send_rounded,
                            color: ColorsApp.white,
                            size: 18,
                          ),
                          onPressed: () {},
                          loading: true,
                        );
                      }
                      return Button.filled(
                        label: 'Kirim Pengajuan',
                        height: 48,
                        borderRadius: 12,
                        color: ColorsApp.primary,
                        icon: const Icon(
                          Icons.send_rounded,
                          color: ColorsApp.white,
                          size: 18,
                        ),
                        onPressed: () {
                          if (_selectedJenis == null) {
                            context.showAlertError(
                              message: 'Pilih jenis pengajuan terlebih dahulu',
                            );
                            return;
                          }
                          if (!_formKey.currentState!.validate()) {
                            return;
                          }

                          final create = CreateLeavesRequestModel(
                            jenis: _selectedJenis,
                            tanggalMulai: _tanggalMulai,
                            tanggalSelesai: _tanggalSelesai,
                            alasan: _alasanController.text.trim(),
                            bukti: _buktiFile,
                          );

                          context.read<SubmitLeavesBloc>().add(
                            SubmitLeavesEvent.submit(create),
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
