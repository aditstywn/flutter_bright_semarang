import 'package:camera/camera.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import 'package:material_ui/material_ui.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../core/component/buttons.dart';
import '../../../core/extensions/build_context_ext.dart';
import '../../../core/services/location_service.dart';
import '../../../core/style/color/colors_app.dart';
import '../../auth/data/datasource/auth_local_datasource.dart';
import '../../auth/presentation/pages/login_page.dart';
import '../../leaves/presentation/pages/leaves_page.dart';
import '../../presence/presentation/pages/camera_page.dart';
import '../../presence/presentation/pages/history_presence_page.dart';
import '../../profile/presentation/bloc/profile/profile_bloc.dart';
import 'bloc/home_bloc.dart';
import 'widgets/attendance_trend_card.dart';
import 'widgets/daily_attendance_card.dart';
import 'widgets/dashboard_header.dart';
import 'widgets/leaderboard_card.dart';
import 'widgets/menu_card.dart';
import 'widgets/monthly_stats_card.dart';
import 'widgets/shift_reminder_banner.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _showReminder = true;

  Future<void> _loadData() async {
    context.read<HomeBloc>().add(const HomeEvent.getDashboard());
    context.read<ProfileBloc>().add(const ProfileEvent.getProfile());
  }

  void _showFeedback(String message) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(message),
          behavior: SnackBarBehavior.floating,
          backgroundColor: ColorsApp.gray900,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          duration: const Duration(seconds: 2),
        ),
      );
  }

  List<CameraDescription>? cameras;
  Future<void> _initCamera() async {
    final status = await Permission.camera.status;

    if (status.isPermanentlyDenied) {
      // User sudah pilih "jangan tanya lagi"
      if (mounted) {
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
        context.showAlertError(
          message: 'Berikan izin akses kamera pada aplikasi ini',
        );
        return;
      }
    }

    try {
      cameras = await availableCameras();
    } catch (e) {
      if (mounted) {
        context.showAlertError(message: e.toString());
      }
    }
  }

  final LocationService _loc = LocationService();
  Position? currentPosition;

  Future<void> _getCurrentLocation() async {
    final status = await Permission.location.status;

    if (status.isPermanentlyDenied) {
      // User sudah pilih "jangan tanya lagi"
      if (mounted) {
        context.showAlertError(
          message: 'Berikan izin akses lokasi pada aplikasi ini',
        );
      }
      return;
    }

    if (status.isDenied || status.isRestricted) {
      // Minta izin dulu, biar modal OS yang muncul
      final result = await Permission.location.request();
      if (!result.isGranted && mounted) {
        context.showAlertError(
          message: 'Berikan izin akses lokasi pada aplikasi ini',
        );
        return;
      }
    }

    if (!await Geolocator.isLocationServiceEnabled()) {
      await Geolocator.openLocationSettings();
      if (mounted) {
        context.showAlertError(
          message: 'Aktifkan layanan lokasi pada perangkat Anda',
        );
      }
      return;
    }
    try {
      final position = await _loc.getCurrentLocation();
      setState(() {
        currentPosition = position;
      });
    } catch (e) {
      if (mounted) {
        context.showAlertError(message: e.toString());
      }
    }
  }

  @override
  void initState() {
    _loadData();
    _getCurrentLocation();
    _initCamera();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            switch (state) {
              case LoadingDashboard():
                return const Center(child: CircularProgressIndicator());
              case ErrorHome(:final message):
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        message,
                        style: const TextStyle(
                          fontSize: 14,
                          color: ColorsApp.gray700,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Button.filled(
                        width: 120,
                        label: 'Coba Lagi',
                        onPressed: _loadData,
                        color: ColorsApp.primary,
                      ),
                    ],
                  ),
                );
              case DashboardSucces(:final dashboard):
                return RefreshIndicator(
                  color: ColorsApp.primary,
                  onRefresh: _loadData,
                  child: SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Stack(
                      children: [
                        // Clean solid brand hero banner
                        Container(
                          height: 150,
                          width: double.infinity,
                          decoration: const BoxDecoration(
                            color: ColorsApp.primary,
                            borderRadius: BorderRadius.vertical(
                              bottom: Radius.circular(24),
                            ),
                          ),
                        ),

                        // Main content
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 28),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              //  Header
                              BlocBuilder<ProfileBloc, ProfileState>(
                                builder: (context, state) {
                                  switch (state) {
                                    case LoadingProfile():
                                      return const SizedBox.shrink();
                                    case ErrorProfile(:final message):
                                      return Text(
                                        message,
                                        style: const TextStyle(
                                          fontSize: 14,
                                          color: ColorsApp.gray700,
                                        ),
                                      );
                                    case ProfileSuccess(:final profile):
                                      return DashboardHeader(
                                        user: profile.data,
                                        onLogoutTap: () {
                                          context.pushAndRemoveUntil(
                                            LoginPage(),
                                            (route) => false,
                                          );
                                          AuthLocalDatasource().clearAllData();
                                        },
                                      );
                                    case _:
                                      return const SizedBox.shrink();
                                  }
                                },
                              ),
                              const SizedBox(height: 18),

                              //  Attendance Card
                              DailyAttendanceCard(
                                hariIni: dashboard.data?.hariIni,

                                onCheckInTap: () {
                                  context.push(CameraPage(type: true));
                                },
                                onCheckOutTap: () {
                                  context.push(CameraPage(type: false));
                                },
                              ),
                              const SizedBox(height: 14),

                              // Shift Reminder
                              if (_showReminder &&
                                  dashboard
                                          .data
                                          ?.hariIni
                                          ?.statusPresensi
                                          ?.sudahPulang !=
                                      true) ...[
                                ShiftReminderBanner(
                                  sudahMasuk:
                                      dashboard
                                          .data
                                          ?.hariIni
                                          ?.statusPresensi
                                          ?.sudahMasuk ??
                                      false,
                                  time: dashboard
                                      .data
                                      ?.hariIni
                                      ?.jamKerja
                                      ?.batasPulang,
                                  onDismiss: () =>
                                      setState(() => _showReminder = false),
                                ),
                                const SizedBox(height: 16),
                              ],

                              // Menu
                              MenuCard(
                                onLeaveRequestTap: () {
                                  context.push(const LeavesPage());
                                },
                                onMyTasksTap: () =>
                                    _showFeedback('Membuka Tugas Saya'),
                                onPresenceHistoryTap: () {
                                  context.push(const HistoryPresencePage());
                                },
                              ),
                              const SizedBox(height: 18),

                              // Monthly Statistics & Attendance Percentage
                              MonthlyStatsCard(
                                stats: dashboard.data?.statistikBulanan,
                              ),
                              const SizedBox(height: 16),

                              //  Attendance Trend Bar Chart
                              AttendanceTrendCard(
                                trendData: dashboard.data?.trendKehadiran,
                              ),
                              const SizedBox(height: 16),

                              //  Monthly Leaderboard
                              LeaderboardCard(
                                monthTitle: DateFormat('MMMM yyyy')
                                    .format(DateTime.now()),
                                leaderboard: dashboard.data?.leaderboard,
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
