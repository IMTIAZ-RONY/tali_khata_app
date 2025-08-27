class UserModel {
  final String id;
  final String name;
  final String initials;
  final double amount;
  final String duration;
  final bool isReceivable;
  final DateTime createdAt;

  UserModel({
    required this.id,
    required this.name,
    required this.initials,
    required this.amount,
    required this.duration,
    required this.isReceivable,
    DateTime? createdAt,
  }) : createdAt = createdAt ?? DateTime.now();

  // Convert from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
      initials: json['initials'] ?? '',
      amount: (json['amount'] ?? 0.0).toDouble(),
      duration: json['duration'] ?? '',
      isReceivable: json['isReceivable'] ?? true,
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime.now(),
    );
  }

  // Convert to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'initials': initials,
      'amount': amount,
      'duration': duration,
      'isReceivable': isReceivable,
      'createdAt': createdAt.toIso8601String(),
    };
  }

  // Copy with new values
  UserModel copyWith({
    String? id,
    String? name,
    String? initials,
    double? amount,
    String? duration,
    bool? isReceivable,
    DateTime? createdAt,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      initials: initials ?? this.initials,
      amount: amount ?? this.amount,
      duration: duration ?? this.duration,
      isReceivable: isReceivable ?? this.isReceivable,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, amount: $amount, isReceivable: $isReceivable)';
  }
}