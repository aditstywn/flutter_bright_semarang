import 'package:cached_network_image/cached_network_image.dart';
import 'package:material_ui/material_ui.dart';

import '../../../../core/style/color/colors_app.dart';
import '../../data/models/response/dashboard_response_model.dart';

class LeaderboardCard extends StatelessWidget {
  final String monthTitle;
  final List<Leaderboard>? leaderboard;
  final int? totalWorkDays;

  const LeaderboardCard({
    super.key,
    required this.monthTitle,
    this.leaderboard,
    this.totalWorkDays,
  });

  @override
  Widget build(BuildContext context) {
    final items = leaderboard ?? const <Leaderboard>[];
    final int maxDays = items.fold<int>(
      1,
      (prev, item) =>
          (item.totalHadir ?? 0) > prev ? (item.totalHadir ?? 0) : prev,
    );

    return Container(
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
                Icons.emoji_events_outlined,
                color: ColorsApp.primary,
                size: 20,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  'Leaderboard — $monthTitle',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.gray900,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),

          if (items.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Text(
                  'Belum ada data leaderboard',
                  style: TextStyle(fontSize: 12.5, color: ColorsApp.gray500),
                ),
              ),
            )
          else
            ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: items.length,
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemBuilder: (context, index) {
                final item = items[index];
                return LeaderboardTile(
                  data: item,
                  maxDays: maxDays,
                  totalWorkDays: totalWorkDays,
                );
              },
            ),
        ],
      ),
    );
  }
}

class LeaderboardTile extends StatelessWidget {
  final Leaderboard data;
  final int maxDays;
  final int? totalWorkDays;

  const LeaderboardTile({
    super.key,
    required this.data,
    required this.maxDays,
    this.totalWorkDays,
  });

  @override
  Widget build(BuildContext context) {
    final int rank = data.rank ?? 0;
    final bool isFirst = rank == 1;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFF8FAFC),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: isFirst ? ColorsApp.primary.withAlpha(70) : ColorsApp.gray200,
        ),
      ),
      child: Row(
        children: [
          // Clean rank badge
          Container(
            width: 28,
            height: 28,
            decoration: BoxDecoration(
              color: isFirst ? ColorsApp.primary : ColorsApp.gray200,
              shape: BoxShape.circle,
            ),
            alignment: Alignment.center,
            child: Text(
              '#$rank',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w700,
                color: isFirst ? ColorsApp.white : ColorsApp.gray700,
              ),
            ),
          ),
          const SizedBox(width: 10),

          // Avatar initials
          Container(
            width: 38,
            height: 38,
            decoration: BoxDecoration(
              color: ColorsApp.gray900,
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: data.fotoUrl ?? '',
                imageBuilder: (context, imageProvider) => Container(
                  width: 38,
                  height: 38,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: imageProvider,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                placeholder: (context, url) =>
                    const CircularProgressIndicator(),
                errorWidget: (context, url, error) => Text(
                  data.nama != null && data.nama!.isNotEmpty
                      ? data.nama![0].toUpperCase()
                      : '-',
                  style: const TextStyle(
                    color: ColorsApp.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),

          // Name, institution & progress bar
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.nama ?? '-',
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                    color: ColorsApp.gray900,
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 2),
                  child: Text(
                    data.universitas ?? '-',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: 10.5,
                      color: ColorsApp.gray500,
                    ),
                  ),
                ),
                const SizedBox(height: 6),
                ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: LinearProgressIndicator(
                    value: data.persentase != null && data.persentase! > 0
                        ? (data.persentase! / 100)
                        : 0,
                    minHeight: 5,
                    backgroundColor: ColorsApp.gray200,
                    valueColor: AlwaysStoppedAnimation<Color>(
                      isFirst ? ColorsApp.primary : ColorsApp.gray500,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),

          // Right-side count & optional percentage
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                '${data.totalHadir ?? 0} hari',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w700,
                  color: ColorsApp.gray900,
                ),
              ),

              const SizedBox(height: 2),
              Text(
                '${data.persentase ?? 0}%',
                style: const TextStyle(fontSize: 11, color: ColorsApp.gray500),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
