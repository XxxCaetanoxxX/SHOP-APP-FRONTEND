import 'package:json_annotation/json_annotation.dart';
import 'package:shop_card/src/features/gerencia_de_produtos/domain/entities/produto.entity.dart';

part 'produto.model.g.dart';

@JsonSerializable()
class ProdutoModel extends ProdutoEntity {
  const ProdutoModel({
    int? id,
    String? nome,
    double? preco,
    double? desconto,
  }) : super(
          id,
          nome,
          preco,
          desconto,
        );

    factory ProdutoModel.fromJson(Map<String, dynamic> json) => _$ProdutoModelFromJson(json);

    Map<String, dynamic> toJson() => _$ProdutoModelToJson(this);

    @override
    List<Object?> get props => [];

}
