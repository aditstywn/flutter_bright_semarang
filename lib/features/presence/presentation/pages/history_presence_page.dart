import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/component/custom_dropdown.dart';
import '../../../../core/component/custom_pagination.dart';
import '../../../../core/style/color/colors_app.dart';
import '../../data/models/request/presence_history_request_model.dart';
import '../bloc/presence_history/presence_history_bloc.dart';
import '../widgets/history_presence_card.dart';

class HistoryPresencePage extends StatefulWidget {
  const HistoryPresencePage({super.key});

  @override
  State<HistoryPresencePage> createState() => _HistoryPresencePageState();
}

class _HistoryPresencePageState extends State<HistoryPresencePage> {
  static const Map<int, String> _months = {
    1: 'Januari',
    2: 'Februari',
    3: 'Maret',
    4: 'April',
    5: 'Mei',
    6: 'Juni',
    7: 'Juli',
    8: 'Agustus',
    9: 'September',
    10: 'Oktober',
    11: 'November',
    12: 'Desember',
  };

  late final List<String> _status = [
    'Semua',
    'Tepat Waktu',
    'Terlambat',
    'Izin',
    'Sakit',
  ];

  late final List<int> _years = List.generate(
    3,
    (index) => DateTime.now().year - index,
  );

  int? selectedMonth = DateTime.now().month;
  int? selectedYear = DateTime.now().year;
  String? selectedStatus;
  String? search;
  int? page;

  void loadData() {
    final requestModel = PresenceHistoryRequestModel(
      bulan: selectedMonth,
      tahun: selectedYear,
      status: selectedStatus,
      page: 1,
      limit: 10,
    );

    context.read<PresenceHistoryBloc>().add(
      PresenceHistoryEvent.getHistory(requestModel),
    );
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
      appBar: AppBar(title: const Text('Riwayat Presensi')),
      body: RefreshIndicator(
        onRefresh: () async {
          loadData();
        },
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Row(
                children: [
                  Expanded(
                    child: CustomDropdown<int>(
                      value: selectedMonth,
                      selectedLabel: _months[selectedMonth],
                      items: _months.entries
                          .map(
                            (entry) => DropdownMenuItem<int>(
                              value: entry.key,
                              child: Text(
                                entry.value,
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  color: ColorsApp.gray900,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedMonth = value;
                        });
                        loadData();
                      },
                      hintText: 'Pilih Bulan',
                      prefixIcon: const Icon(
                        Icons.calendar_month_outlined,
                        size: 18,
                        color: ColorsApp.primary,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: CustomDropdown<int>(
                      value: selectedYear,
                      selectedLabel: selectedYear?.toString(),
                      items: _years
                          .map(
                            (year) => DropdownMenuItem<int>(
                              value: year,
                              child: Text(
                                '$year',
                                style: const TextStyle(
                                  fontSize: 13.5,
                                  color: ColorsApp.gray900,
                                ),
                              ),
                            ),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedYear = value;
                        });
                        loadData();
                      },
                      hintText: 'Pilih Tahun',
                      prefixIcon: const Icon(
                        Icons.calendar_today_outlined,
                        size: 18,
                        color: ColorsApp.primary,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              CustomDropdown<String>(
                value: selectedStatus,
                selectedLabel: selectedStatus,
                items: _status
                    .map(
                      (status) => DropdownMenuItem<String>(
                        value: status,
                        child: Text(
                          status,
                          style: const TextStyle(
                            fontSize: 13.5,
                            color: ColorsApp.gray900,
                          ),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedStatus = value;
                  });
                  loadData();
                },
                hintText: 'Pilih Status',
              ),
              const SizedBox(height: 8),
              SizedBox(
                height: 48,
                child: TextFormField(
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {
                    setState(() {
                      search = value;
                    });
                    loadData();
                  },
                  decoration: InputDecoration(
                    suffixIcon: const Icon(
                      Icons.search_rounded,
                      color: ColorsApp.gray400,
                    ),
                    hintText: 'Pencarian keterangan...',
                    hintStyle: const TextStyle(
                      color: ColorsApp.gray400,
                      fontSize: 13.5,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 12,
                      horizontal: 14,
                    ),
                    filled: true,
                    fillColor: ColorsApp.white,
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: ColorsApp.gray300,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(
                        color: ColorsApp.primary,
                        width: 1.2,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              BlocBuilder<PresenceHistoryBloc, PresenceHistoryState>(
                builder: (context, state) {
                  switch (state) {
                    case LoadingPresenceHistory():
                      return const Center(child: CircularProgressIndicator());
                    case ErrorPresenceHistory(:final message):
                      return Center(child: Text(message));
                    case PresenceHistorySuccess(:final history):
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: history.data?.records?.length ?? 0,
                            separatorBuilder: (_, _) =>
                                const SizedBox(height: 12),
                            itemBuilder: (context, index) {
                              final item = history.data?.records?[index];
                              return HistoryPresenceCard(record: item);
                            },
                          ),
                          if ((history.data?.totalPages ?? 0) > 1) ...[
                            const SizedBox(height: 20),
                            CustomPagination(
                              currentPage: page ?? 1,
                              totalPages: history.data?.totalPages ?? 0,
                              onPageChanged: (pages) {
                                setState(() {
                                  page = pages;
                                });

                                final requestModel =
                                    PresenceHistoryRequestModel(
                                      bulan: selectedMonth,
                                      tahun: selectedYear,
                                      status: selectedStatus,
                                      page: pages,
                                      limit: 10,
                                    );

                                context.read<PresenceHistoryBloc>().add(
                                  PresenceHistoryEvent.getHistory(requestModel),
                                );
                              },
                            ),
                          ],
                        ],
                      );
                    case _:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
