import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/buttons.dart';
import '../../../../core/extensions/build_context_ext.dart';
import '../../../../core/style/color/colors_app.dart';
import '../bloc/leaves/leaves_bloc.dart';
import '../widgets/leave_card.dart';
import 'create_leaves_page.dart';

class LeavesPage extends StatefulWidget {
  const LeavesPage({super.key});

  @override
  State<LeavesPage> createState() => _LeavesPageState();
}

class _LeavesPageState extends State<LeavesPage> {
  void loadData() {
    context.read<LeavesBloc>().add(const LeavesEvent.getLeaves());
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF6F7F9),
      appBar: AppBar(title: const Text('Pengajuan Izin')),
      body: RefreshIndicator(
        color: ColorsApp.primary,
        onRefresh: () async {
          loadData();
        },
        child: ListView(
          padding: const EdgeInsets.all(16),
          physics: const AlwaysScrollableScrollPhysics(),
          children: [
            Button.filled(
              label: 'Ajukan Izin',
              onPressed: () {
                context.push(const CreateLeavesPage());
              },
              color: ColorsApp.primary,
              borderRadius: 10,
              icon: const Icon(Icons.add_rounded, color: ColorsApp.white),
            ),
            const SizedBox(height: 16),

            BlocBuilder<LeavesBloc, LeavesState>(
              builder: (context, state) {
                switch (state) {
                  case LoadingLeaves():
                    return const Padding(
                      padding: EdgeInsets.symmetric(vertical: 48),
                      child: Center(
                        child: CircularProgressIndicator(
                          color: ColorsApp.primary,
                        ),
                      ),
                    );
                  case ErrorLeaves(:final message):
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 48),
                      child: Center(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              message,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 13.5,
                                color: ColorsApp.gray600,
                              ),
                            ),
                            const SizedBox(height: 12),
                            Button.filled(
                              width: 130,
                              label: 'Coba Lagi',
                              onPressed: loadData,
                              color: ColorsApp.primary,
                              borderRadius: 10,
                            ),
                          ],
                        ),
                      ),
                    );
                  case LeavesSuccess(:final leaves):
                    final items = leaves.data ?? [];
                    if (items.isEmpty) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: 40,
                          horizontal: 16,
                        ),
                        decoration: BoxDecoration(
                          color: ColorsApp.white,
                          borderRadius: BorderRadius.circular(16),
                          border: Border.all(color: ColorsApp.gray200),
                        ),
                        child: const Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.event_note_outlined,
                              size: 40,
                              color: ColorsApp.gray400,
                            ),
                            SizedBox(height: 10),
                            Text(
                              'Belum ada pengajuan izin',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                                color: ColorsApp.gray700,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Riwayat pengajuan izin atau sakit Anda akan muncul di sini.',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorsApp.gray500,
                              ),
                            ),
                          ],
                        ),
                      );
                    }
                    return ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: items.length,
                      separatorBuilder: (_, _) => const SizedBox(height: 12),
                      itemBuilder: (context, index) {
                        return LeaveCard(leave: items[index]);
                      },
                    );
                  case _:
                    return const SizedBox.shrink();
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
