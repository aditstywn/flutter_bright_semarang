import 'dart:async';
import 'dart:io';
import 'dart:math' as math;

import 'package:camera/camera.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bright_semarang/features/presence/presentation/pages/form_presence_page.dart';
import 'package:material_ui/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';

class CameraPage extends StatefulWidget {
  final bool type; // true for check-in, false for check-out
  const new({super.key, required this.type});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  CameraController? _cameraController;
  List<CameraDescription>? cameras;

  XFile? imageFile;

  bool _isCameraInitialized = false;
  bool _isCameraInitializing = false;

  Future<void> initCamera() async {
    if (_isCameraInitializing || _isCameraInitialized) {
      return;
    }

    setState(() {
      _isCameraInitializing = true;
    });

    try {
      final status = await Permission.camera.status;

      if (status.isPermanentlyDenied) {
        // User sudah pilih "jangan tanya lagi"
        if (mounted) {
          setState(() {
            _isCameraInitializing = false;
          });
          context.pop();
          context.showAlertError(
            message: 'Berikan izin akses kamera pada aplikasi ini',
          );
        }
        return;
      }

      if (status.isDenied || status.isRestricted) {
        // Minta izin dulu, biar modal OS yang muncul
        final result = await Permission.camera.request();
        if (!result.isGranted && mounted) {
          setState(() {
            _isCameraInitializing = false;
          });
          context.pop();
          context.showAlertError(
            message: 'Berikan izin akses kamera pada aplikasi ini',
          );
          return;
        }
      }

      cameras = await availableCameras();
      if (cameras == null || cameras!.isEmpty) {
        if (mounted) {
          setState(() {
            _isCameraInitializing = false;
          });
          context.showAlertError(
            message: 'Tidak ada kamera tersedia di device ini',
          );
        }
        return;
      }

      CameraDescription? frontCamera;
      CameraDescription? backCamera;

      for (var camera in cameras!) {
        if (camera.lensDirection == CameraLensDirection.front) {
          frontCamera = camera;
        } else if (camera.lensDirection == CameraLensDirection.back) {
          backCamera = camera;
        }
      }

      CameraDescription selectedCamera;
      if (frontCamera != null) {
        selectedCamera = frontCamera;
        _isFrontCamera = true;
      } else if (backCamera != null) {
        selectedCamera = backCamera;
        _isFrontCamera = false;
      } else {
        selectedCamera = cameras!.first;
        _isFrontCamera = false;
      }

      _cameraController = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      await _cameraController!.initialize();
      await _cameraController!.setFlashMode(_flashMode);

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
          _isCameraInitializing = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isCameraInitialized = false;
          _isCameraInitializing = false;
        });
        context.showAlertError(
          message: 'Berikan izin akses kamera pada aplikasi ini',
        );
      }
    }

    // await _cameraController!.initialize();
    if (mounted) {
      setState(() {});
    }
  }

  bool _isFrontCamera = true;
  bool _isTogglingCamera = false;

  Future<void> toggleCamera() async {
    if (!_isCameraInitialized || _isTogglingCamera) {
      return;
    }

    if (cameras == null || cameras!.isEmpty) {
      if (mounted) {
        context.showAlertError(
          message: 'Berikan izin akses kamera pada aplikasi ini',
        );
      }
      return;
    }

    try {
      setState(() {
        _isTogglingCamera = true;
      });

      // Dispose controller lama
      final oldController = _cameraController;
      _cameraController = null;
      await oldController?.dispose();

      // Add delay to ensure resources are released
      await Future.delayed(const Duration(milliseconds: 100));

      // Toggle direction
      _isFrontCamera = !_isFrontCamera;

      final lensDirection = _isFrontCamera
          ? CameraLensDirection.front
          : CameraLensDirection.back;

      final selectedCamera = cameras!.firstWhere(
        (camera) => camera.lensDirection == lensDirection,
        orElse: () => cameras!.first,
      );

      // Buat controller baru
      _cameraController = CameraController(
        selectedCamera,
        ResolutionPreset.high,
        enableAudio: false,
      );

      // Initialize controller baru
      await _cameraController!.initialize();
      await _cameraController!.setFlashMode(_flashMode);

      if (mounted) {
        setState(() {
          _isCameraInitialized = true;
          _isTogglingCamera = false;
        });
      }
    } catch (e) {
      if (mounted) {
        setState(() {
          _isCameraInitialized = false;
          _isTogglingCamera = false;
        });
        context.showAlertError(message: 'Gagal mengganti kamera');

        // Coba reinit kamera dengan posisi sebelumnya
        _isFrontCamera = !_isFrontCamera;
        await initCamera();
      }
    }
  }

  FlashMode _flashMode = FlashMode.off;

  Future<void> toggleFlash() async {
    if (_cameraController == null) return;
    if (_flashMode == FlashMode.off) {
      await _cameraController!.setFlashMode(FlashMode.torch);
      setState(() {
        _flashMode = FlashMode.torch;
      });
    } else {
      await _cameraController!.setFlashMode(FlashMode.off);
      setState(() {
        _flashMode = FlashMode.off;
      });
    }
  }

  // Countdown state
  int? _countdownValue;
  bool _isCountingDown = false;

  void _startCountdown() {
    final countdownDurationMs = 3000; // 3 detik dalam milidetik

    setState(() {
      _isCountingDown = true;
      _countdownValue = (countdownDurationMs / 1000).ceil();
    });

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_countdownValue! > 1) {
        setState(() {
          _countdownValue = _countdownValue! - 1;
        });
      } else {
        timer.cancel();
        setState(() {
          _isCountingDown = false;
          _countdownValue = null;
        });
        _takePicture();
      }
    });
  }

  Future<void> _takePicture() async {
    try {
      if (_cameraController == null ||
          !_cameraController!.value.isInitialized) {
        return;
      }

      final image = await _cameraController!.takePicture();

      setState(() => imageFile = XFile(image.path));
    } catch (e) {
      if (mounted) {
        context.showAlertError(message: 'Gagal mengambil foto: $e');
      }
    }
  }

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Kamera')),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              padding: EdgeInsets.all(21),
              decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.circular(4),
                boxShadow: [
                  BoxShadow(
                    color: ColorsApp.grey.withAlpha(50),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Center(
                    child: Text(
                      widget.type ? 'Absen Masuk' : 'Absen Pulang',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ColorsApp.black,
                      ),
                    ),
                  ),
                  const SizedBox(height: 21),
                  if (_isTogglingCamera)
                    Container(
                      height: 450,
                      decoration: BoxDecoration(
                        color: ColorsApp.grey,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorsApp.white,
                        ),
                      ),
                    )
                  else if (_cameraController != null &&
                      _cameraController!.value.isInitialized)
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        imageFile != null
                            ? Transform(
                                alignment: Alignment.center,
                                transform: _isFrontCamera
                                    ? Matrix4.rotationY(math.pi)
                                    : Matrix4.identity(),
                                child: Container(
                                  height: 450,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: ColorsApp.grey,
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(4),
                                    child: Image.file(
                                      File(imageFile!.path),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              )
                            : SizedBox(
                                height: 450,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(4),
                                  child: FittedBox(
                                    fit: BoxFit.cover,
                                    child: SizedBox(
                                      width: _cameraController!
                                          .value
                                          .previewSize!
                                          .height,
                                      height: _cameraController!
                                          .value
                                          .previewSize!
                                          .width,

                                      child: CameraPreview(_cameraController!),
                                    ),
                                  ),
                                ),
                              ),
                        Positioned(
                          top: 10,
                          right: 10,
                          child: Container(
                            width: 40,
                            height: 40,
                            decoration: BoxDecoration(
                              color: ColorsApp.white,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: _isTogglingCamera
                                ? Center(
                                    child: SizedBox(
                                      width: 20,
                                      height: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 2,
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                              ColorsApp.white,
                                            ),
                                      ),
                                    ),
                                  )
                                : IconButton(
                                    icon: Icon(Icons.flip_camera_android),
                                    onPressed: _isTogglingCamera
                                        ? null
                                        : () {
                                            toggleCamera();
                                          },
                                  ),
                          ),
                        ),

                        Positioned(
                          bottom: 130,
                          child: Container(
                            width: 450 * 0.6,
                            height: 450 * 0.6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: ColorsApp.white,
                                width: 3, // Ketebalan garis
                              ),
                            ),
                          ),
                        ),
                        // countdown timer
                        Positioned(
                          bottom: 230,
                          child: _isCountingDown && _countdownValue != null
                              ? Container(
                                  decoration: BoxDecoration(),
                                  child: Text(
                                    '$_countdownValue',
                                    style: TextStyle(
                                      fontSize: 40,
                                      fontWeight: FontWeight.w700,
                                      color: ColorsApp.white,
                                    ),
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),

                        Positioned(
                          bottom: 15,
                          child: InkWell(
                            onTap: () {
                              _startCountdown();
                            },
                            child: Container(
                              height: 65,
                              width: 65,
                              decoration: BoxDecoration(
                                color: Color(0xFFE5E5E5),
                                borderRadius: BorderRadius.circular(32.5),
                              ),
                              child: Container(
                                margin: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Color(0xFFF2F2F2),
                                  borderRadius: BorderRadius.circular(50),
                                ),
                                child: Icon(
                                  Icons.camera_alt,
                                  color: Colors.black54,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    )
                  else
                    Container(
                      height: 450,
                      decoration: BoxDecoration(
                        color: ColorsApp.gray200,
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                  if (imageFile != null) ...[
                    const SizedBox(height: 16),
                    Button.outlined(
                      height: 32,
                      borderRadius: 4,
                      fontSize: 12,
                      label: 'Ambil ulang Foto',
                      onPressed: () {
                        setState(() {
                          imageFile = null;
                        });
                      },
                      color: ColorsApp.white,
                      borderColor: ColorsApp.primary,
                    ),
                    const SizedBox(height: 8),
                    Button.filled(
                      borderRadius: 4,
                      label: 'Lanjutkan',
                      onPressed: () {
                        context.push(
                          FormPresencePage(
                            imageFile: imageFile,
                            type: widget.type,
                          ),
                        );
                        setState(() {
                          imageFile = null;
                        });
                      },
                      color: ColorsApp.primary,
                    ),
                  ],
                  const SizedBox(height: 16),
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(14),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFFBEB),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xFFFDE68A)),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Row(
                          children: [
                            Icon(
                              Icons.lightbulb_rounded,
                              color: Color(0xFFF59E0B),
                              size: 18,
                            ),
                            SizedBox(width: 8),
                            Text(
                              'Tips Foto Terbaik:',
                              style: TextStyle(
                                fontSize: 13.5,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF92400E),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                        ...[
                          'Posisikan wajah di tengah frame',
                          'Pastikan pencahayaan cukup terang',
                          'Tatap langsung ke kamera',
                          'Hindari menggunakan aksesoris yang menutupi wajah',
                        ].map(
                          (tip) => Padding(
                            padding: const EdgeInsets.only(left: 26, bottom: 4),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  '• ',
                                  style: TextStyle(
                                    fontSize: 12.5,
                                    color: Color(0xFF92400E),
                                    height: 1.4,
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    tip,
                                    style: const TextStyle(
                                      fontSize: 12.5,
                                      color: Color(0xFF92400E),
                                      height: 1.4,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
