// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: json['id'] as int?,
      brand: json['brand'] as String?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      priceSign: json['priceSign'] as String?,
      currency: json['currency'] as String?,
      imageLink: json['imageLink'] as String?,
      productLink: json['productLink'] as String?,
      websiteLink: json['websiteLink'] as String?,
      description: json['description'] as String?,
      rating: json['rating'],
      category: json['category'] as String?,
      productType: json['productType'] as String?,
      tagList:
          (json['tagList'] as List<dynamic>?)?.map((e) => e as String).toList(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      productApiUrl: json['productApiUrl'] as String?,
      apiFeaturedImage: json['apiFeaturedImage'] as String?,
      productColors: (json['productColors'] as List<dynamic>?)
          ?.map((e) => ProductColor.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'brand': instance.brand,
      'name': instance.name,
      'price': instance.price,
      'priceSign': instance.priceSign,
      'currency': instance.currency,
      'imageLink': instance.imageLink,
      'productLink': instance.productLink,
      'websiteLink': instance.websiteLink,
      'description': instance.description,
      'rating': instance.rating,
      'category': instance.category,
      'productType': instance.productType,
      'tagList': instance.tagList,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
      'productApiUrl': instance.productApiUrl,
      'apiFeaturedImage': instance.apiFeaturedImage,
      'productColors': instance.productColors,
    };
