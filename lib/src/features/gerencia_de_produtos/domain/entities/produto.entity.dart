import 'package:equatable/equatable.dart';

abstract class ProdutoEntity extends Equatable {
  final int? id;
  final String? nome;
  final double? preco;
  final double? desconto;

  const ProdutoEntity(
    this.id,
    this.nome,
    this.preco,
    this.desconto,
  );

  @override
  List<Object?> get props => [
        id,
        nome,
        preco,
        desconto,
      ];
}
