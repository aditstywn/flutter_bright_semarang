import 'package:material_ui/material_ui.dart';

import '../style/color/colors_app.dart';

class CustomPagination extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageChanged;
  final bool? shadow;

  const CustomPagination({
    super.key,
    required this.currentPage,
    required this.totalPages,
    required this.onPageChanged,
    this.shadow = true,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [];

    // Tombol Prev
    pages.add(
      IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: currentPage > 1
            ? () => onPageChanged(currentPage - 1)
            : null,
      ),
    );

    // Tambah halaman pertama
    int startPage = (currentPage - 1).clamp(1, totalPages - 1);
    int endPage = (startPage + 2).clamp(1, totalPages);

    if (startPage > 1) {
      pages.add(_buildPage(1));
      if (startPage > 2) {
        pages.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4),
            child: Text("..."),
          ),
        );
      }
    }

    // Range halaman yang ditampilkan (maksimal 3)
    // int startPage = (currentPage - 1).clamp(1, totalPages - 2);
    // int endPage = (startPage + 2).clamp(1, totalPages);

    for (int i = startPage; i <= endPage; i++) {
      pages.add(_buildPage(i, isCurrent: i == currentPage));
    }

    // Tambah "..." dan halaman terakhir
    if (endPage < totalPages - 1) {
      pages.add(
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 4),
          child: Text("..."),
        ),
      );
      pages.add(_buildPage(totalPages));
    } else if (endPage == totalPages - 1) {
      pages.add(_buildPage(totalPages));
    }

    // Tombol Next
    pages.add(
      IconButton(
        icon: const Icon(Icons.chevron_right),
        onPressed: currentPage < totalPages
            ? () => onPageChanged(currentPage + 1)
            : null,
      ),
    );

    return Container(
      decoration: BoxDecoration(
        color: ColorsApp.white,
        borderRadius: BorderRadius.circular(4),
        boxShadow: shadow == true
            ? [
                BoxShadow(
                  color: ColorsApp.black.withAlpha(50),
                  blurRadius: 2,
                  offset: const Offset(0, 0.5),
                ),
              ]
            : null,
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: pages),
    );
  }

  Widget _buildPage(int page, {bool isCurrent = false}) {
    return Flexible(
      child: InkWell(
        onTap: isCurrent ? null : () => onPageChanged(page),
        child: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
            color: isCurrent ? ColorsApp.grey : Colors.transparent,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Center(
            child: Text(
              '$page',
              style: TextStyle(
                fontWeight: isCurrent ? FontWeight.bold : FontWeight.normal,
                color: isCurrent ? ColorsApp.black : ColorsApp.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
