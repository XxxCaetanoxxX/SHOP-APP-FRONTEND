// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'produto.model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProdutoModel _$ProdutoModelFromJson(Map<String, dynamic> json) => ProdutoModel(
      id: (json['id'] as num?)?.toInt(),
      nome: json['nome'] as String?,
      preco: (json['preco'] as num?)?.toDouble(),
      desconto: (json['desconto'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ProdutoModelToJson(ProdutoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nome': instance.nome,
      'preco': instance.preco,
      'desconto': instance.desconto,
    };
