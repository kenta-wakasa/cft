// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EdgeImpl _$$EdgeImplFromJson(Map<String, dynamic> json) => _$EdgeImpl(
      sourceId: json['sourceId'] as String,
      destinationId: json['destinationId'] as String,
      fee: (json['fee'] as num).toInt(),
      time: (json['time'] as num).toInt(),
    );

Map<String, dynamic> _$$EdgeImplToJson(_$EdgeImpl instance) =>
    <String, dynamic>{
      'sourceId': instance.sourceId,
      'destinationId': instance.destinationId,
      'fee': instance.fee,
      'time': instance.time,
    };
