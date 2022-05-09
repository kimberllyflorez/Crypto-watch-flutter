import 'package:flutter/material.dart';
import 'dart:convert';

class CoinModel {
  CoinModel({
    required this.id,
    required this.symbol,
    required this.name,
    required this.image,
    required this.currentPrice,
    required this.marketCap,
    required this.marketCapRank,
    this.fullyDilutedValuation,
    required this.totalVolume,
    required this.high24H,
    required this.low24H,
    required this.priceChange24H,
    required this.priceChangePercentage24H,
    required this.marketCapChange24H,
    required this.marketCapChangePercentage24H,
    required this.circulatingSupply,
    this.totalSupply,
    this.maxSupply,
    required this.ath,
    required this.athChangePercentage,
    required this.athDate,
    required this.atl,
    required this.atlChangePercentage,
    required this.atlDate,
    this.roi,
    required this.lastUpdated,
    required this.sparklineIn7D,
  });

  String id;
  String symbol;
  String name;
  String image;
  double currentPrice;
  int marketCap;
  int marketCapRank;
  int? fullyDilutedValuation;
  double totalVolume;
  double high24H;
  double low24H;
  double priceChange24H;
  double priceChangePercentage24H;
  double marketCapChange24H;
  double marketCapChangePercentage24H;
  double circulatingSupply;
  double? totalSupply;
  double? maxSupply;
  double ath;
  double athChangePercentage;
  DateTime athDate;
  double atl;
  double atlChangePercentage;
  DateTime atlDate;
  Roi? roi;
  DateTime lastUpdated;
  SparklineIn7D sparklineIn7D;

  factory CoinModel.fromJson(String str) => CoinModel.fromMap(json.decode(str));

  factory CoinModel.fromMap(Map<String, dynamic> json) => CoinModel(
        id: json["id"],
        symbol: json["symbol"],
        name: json["name"],
        image: json["image"],
        currentPrice: json["current_price"].toDouble(),
        marketCap: json["market_cap"],
        marketCapRank: json["market_cap_rank"],
        fullyDilutedValuation: json["fully_diluted_valuation"],
        totalVolume: json["total_volume"].toDouble(),
        high24H: json["high_24h"].toDouble(),
        low24H: json["low_24h"].toDouble(),
        priceChange24H: json["price_change_24h"].toDouble(),
        priceChangePercentage24H:
            json["price_change_percentage_24h"].toDouble(),
        marketCapChange24H: json["market_cap_change_24h"].toDouble(),
        marketCapChangePercentage24H:
            json["market_cap_change_percentage_24h"].toDouble(),
        circulatingSupply: json["circulating_supply"].toDouble(),
        totalSupply: json["total_supply"] == null
            ? null
            : json["total_supply"].toDouble(),
        maxSupply:
            json["max_supply"] == null ? null : json["max_supply"].toDouble(),
        ath: json["ath"].toDouble(),
        athChangePercentage: json["ath_change_percentage"].toDouble(),
        athDate: DateTime.parse(json["ath_date"]),
        atl: json["atl"].toDouble(),
        atlChangePercentage: json["atl_change_percentage"].toDouble(),
        atlDate: DateTime.parse(json["atl_date"]),
        roi: json["roi"] == null ? null : Roi.fromMap(json["roi"]),
        lastUpdated: DateTime.parse(json["last_updated"]),
        sparklineIn7D: SparklineIn7D.fromMap(json["sparkline_in_7d"]),
      );
}

class Roi {
  Roi({
    required this.times,
    this.currency,
    required this.percentage,
  });

  double times;
  Currency? currency;
  double percentage;

  factory Roi.fromJson(String str) => Roi.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Roi.fromMap(Map<String, dynamic> json) => Roi(
        times: json["times"].toDouble(),
        currency: json["currency"] == null
            ? null
            : currencyValues.map[json["currency"]],
        percentage: json["percentage"].toDouble(),
      );

  Map<String, dynamic> toMap() => {
        "times": times,
        "currency": currencyValues.reverse![currency],
        "percentage": percentage,
      };
}

enum Currency { BTC, USD, ETH }

final currencyValues =
    EnumValues({"btc": Currency.BTC, "eth": Currency.ETH, "usd": Currency.USD});

class SparklineIn7D {
  SparklineIn7D({
    required this.price,
  });

  List<double>? price;

  SparklineIn7D copyWith({
     List<double>? price,
  }) =>
      SparklineIn7D(
        price: price ?? this.price,
      );

  factory SparklineIn7D.fromJson(String str) =>
      SparklineIn7D.fromMap(json.decode(str));


  factory SparklineIn7D.fromMap(Map<String, dynamic> json) => SparklineIn7D(
        price: List<double>.from(json["price"].map((x) => x.toDouble())),
      );

}


class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String>? get reverse {
    if (reverseMap == null) {
      reverseMap = map.map((k, v) => new MapEntry(v, k));
    }
    return reverseMap;
  }
}
