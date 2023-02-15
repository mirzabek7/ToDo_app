class RejaModeli {
  final String id;
  final String nomi;
  final DateTime kuni;
  bool isDone = false;

  RejaModeli({
    required this.id,
    required this.nomi,
    required this.kuni,
  });

  void changeDone() {
    isDone = !isDone;
  }
}

class Rejalar {
  List<RejaModeli> _ruyxat = [
    RejaModeli(id: "r1", nomi: "Kitob oqish", kuni: DateTime.now()),
    RejaModeli(id: "r2", nomi: "Flutter ni organish", kuni: DateTime.now()),
    RejaModeli(id: "r3", nomi: "Magazinga borib kelish", kuni: DateTime.now()),
  ];

  List<RejaModeli> get ruyxat {
    // ignore: recursive_getters
    return _ruyxat;
  }

  List<RejaModeli> todoByDay(DateTime date) {
    return _ruyxat
        .where((day) =>
            day.kuni.day == date.day &&
            day.kuni.month == date.month &&
            day.kuni.year == date.year)
        .toList();
  }

  void addToDo(String RejaNomi, DateTime RejaKuni) {
    _ruyxat.add(RejaModeli(
        id: "r${_ruyxat.length + 1}", nomi: RejaNomi, kuni: RejaKuni));
  }

  void removeToDo(String id) {
    _ruyxat.removeWhere((reja) => reja.id == id);
  }
}
