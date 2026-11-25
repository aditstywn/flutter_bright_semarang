import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:material_ui/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/component/custom_textformfield.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/services/location_service.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../data/models/request/presence_request_model.dart';
import '../bloc/presence/presence_bloc.dart';
import '../widgets/location_status_card.dart';

class FormPresencePage extends StatefulWidget {
  final bool? type;
  final XFile? imageFile;
  const FormPresencePage({super.key, this.imageFile, this.type});

  @override
  State<FormPresencePage> createState() => _FormPresencePageState();
}

class _FormPresencePageState extends State<FormPresencePage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _descriptionController = TextEditingController();

  final LocationService _loc = LocationService();
  Position? currentPosition;
  bool _isLoadingLocation = true;
  String? _locationError;

  Future<void> _getCurrentLocation() async {
    if (mounted) {
      setState(() {
        _isLoadingLocation = true;
        _locationError = null;
      });
    }

    final status = await Permission.location.status;

    if (status.isPermanentlyDenied) {
      if (mounted) {
        setState(() {
          _isLoadingLocation = false;
          _locationError = 'Izin lokasi ditolak permanen';
        });
        context.showAlertError(
          message: 'Berikan izin akses lokasi pada aplikasi ini',
        );
      }
      return;
    }

    if (status.isDenied || status.isRestricted) {
      final result = await Permission.location.request();
      if (!result.isGranted && mounted) {
        setState(() {
          _isLoadingLocation = false;
          _locationError = 'Izin lokasi belum diberikan';
        });
        context.showAlertError(
          message: 'Berikan izin akses lokasi pada aplikasi ini',
        );
        return;
      }
    }

    if (!await Geolocator.isLocationServiceEnabled()) {
      await Geolocator.openLocationSettings();
      if (mounted) {
        setState(() {
          _isLoadingLocation = false;
          _locationError = 'Layanan GPS belum aktif';
        });
        context.showAlertError(
          message: 'Aktifkan layanan lokasi pada perangkat Anda',
        );
      }
      return;
    }

    try {
      final position = await _loc.getCurrentLocation();
      if (!mounted) return;
      setState(() {
        currentPosition = position;
        _isLoadingLocation = false;
      });
    } catch (e) {
      if (!mounted) return;
      setState(() {
        _isLoadingLocation = false;
        _locationError = 'Gagal mendapatkan lokasi';
      });
      context.showAlertError(message: e.toString());
    }
  }

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
    _descriptionController.text = 'Hadir';
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, result) {
        if (didPop) return;
        context.popToRoot();
      },
      child: Scaffold(
        backgroundColor: const Color(0xFFF6F7F9),
        appBar: AppBar(
          title: Text(
            'Form Absensi ${widget.type == true ? 'Masuk' : 'Pulang'}',
          ),
        ),
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
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
                            const Icon(
                              Icons.photo_camera_outlined,
                              size: 18,
                              color: ColorsApp.primary,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'Foto Presensi',
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: ColorsApp.gray900,
                                ),
                              ),
                            ),
                            TextButton.icon(
                              onPressed: () => Navigator.of(context).pop(),
                              style: TextButton.styleFrom(
                                foregroundColor: ColorsApp.primary,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 8,
                                  vertical: 4,
                                ),
                                minimumSize: Size.zero,
                                tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                              icon: const Icon(Icons.refresh_rounded, size: 15),
                              label: const Text(
                                'Ambil Ulang',
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        if (widget.imageFile != null)
                          ClipRRect(
                            borderRadius: BorderRadius.circular(14),
                            child: Image.file(
                              File(widget.imageFile!.path),
                              width: double.infinity,
                              height: 450,
                              fit: BoxFit.cover,
                            ),
                          )
                        else
                          Container(
                            width: double.infinity,
                            height: 180,
                            decoration: BoxDecoration(
                              color: ColorsApp.gray100,
                              borderRadius: BorderRadius.circular(14),
                              border: Border.all(color: ColorsApp.gray200),
                            ),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.image_not_supported_outlined,
                                  size: 32,
                                  color: ColorsApp.gray400,
                                ),
                                SizedBox(height: 8),
                                Text(
                                  'Belum ada foto presensi',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: ColorsApp.gray500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 14),

                  LocationStatusCard(
                    position: currentPosition,
                    isLoading: _isLoadingLocation,
                    errorMessage: _locationError,
                    onRefresh: _getCurrentLocation,
                  ),
                  const SizedBox(height: 14),

                  Container(
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
                        CustomTextFormField(
                          controller: _descriptionController,
                          label: 'Keterangan Absensi',
                          hintText: 'Masukkan keterangan absensi',
                          prefixIcon: const Icon(
                            Icons.description_outlined,
                            size: 20,
                            color: ColorsApp.gray400,
                          ),
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return 'Keterangan tidak boleh kosong';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 20),
                        BlocConsumer<PresenceBloc, PresenceState>(
                          listener: (context, state) {
                            switch (state) {
                              case PresenceSuccess():
                                context.showAlertSuccess(
                                  message: 'Presensi berhasil dikirim',
                                );

                                break;
                              case ErrorPresence(:final message):
                                context.showAlertError(message: message);
                                break;
                            }
                          },
                          builder: (context, state) {
                            if (state is LoadingPresence) {
                              return Button.filled(
                                label: 'Kirim Presensi',
                                height: 48,
                                borderRadius: 12,
                                color: ColorsApp.primary,
                                onPressed: () {},
                                loading: true,
                              );
                            }
                            return Button.filled(
                              label: 'Kirim Presensi',
                              height: 48,
                              borderRadius: 12,
                              color: ColorsApp.primary,
                              onPressed: () {
                                if (currentPosition == null) {
                                  context.showAlertError(
                                    message: 'Lokasi GPS belum tersedia, silakan muat ulang lokasi',
                                  );
                                  return;
                                }
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }

                                final presence = PresenceRequestModel(
                                  fotoBase64: XFile(widget.imageFile!.path),
                                  keterangan: _descriptionController.text
                                      .trim(),
                                  latitude: currentPosition!.latitude,
                                  longitude: currentPosition!.longitude,
                                );

                                if (widget.type == true) {
                                  context.read<PresenceBloc>().add(
                                    PresenceEvent.checkIn(presence),
                                  );
                                } else {
                                  context.read<PresenceBloc>().add(
                                    PresenceEvent.checkOut(presence),
                                  );
                                }
                              },
                            );
                          },
                        ),
                      ],
                    ),
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
