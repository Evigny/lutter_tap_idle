class Upgrade {
  final String id;
  final String name;
  final String description;
  final double cost;
  final UpgradeType type;
  final double value;

  bool isPurchased;

  Upgrade({
    required this.id,
    required this.name,
    required this.description,
    required this.cost,
    required this.type,
    required this.value,
    this.isPurchased = false,
  });

  Upgrade copyWith({bool? isPurchased}) {
    return Upgrade(
      id: id,
      name: name,
      description: description,
      cost: cost,
      type: type,
      value: value,
      isPurchased: isPurchased ?? this.isPurchased,
    );
  }
}

enum UpgradeType {
  tapMultiplier, // Умножает силу тапа
  globalMultiplier, // Умножает весь доход
  offlineBonus, // Увеличивает офлайн доход
}
