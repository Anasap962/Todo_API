// To parse this JSON data, do
//
//     final todooModels = todooModelsFromJson(jsonString);

import 'dart:convert';

TodooModels todooModelsFromJson(String str) => TodooModels.fromJson(json.decode(str));

String todooModelsToJson(TodooModels data) => json.encode(data.toJson());

class TodooModels {
    int code;
    bool success;
    int timestamp;
    String message;
    List<Item> items;
    Meta meta;

    TodooModels({
        required this.code,
        required this.success,
        required this.timestamp,
        required this.message,
        required this.items,
        required this.meta,
    });

    factory TodooModels.fromJson(Map<String, dynamic> json) => TodooModels(
        code: json["code"],
        success: json["success"],
        timestamp: json["timestamp"],
        message: json["message"],
        items: List<Item>.from(json["items"].map((x) => Item.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
    );

    Map<String, dynamic> toJson() => {
        "code": code,
        "success": success,
        "timestamp": timestamp,
        "message": message,
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "meta": meta.toJson(),
    };
}

class Item {
    String? id;
    String title;
    String description;
    bool isCompleted;
    DateTime? createdAt;
    DateTime? updatedAt;

    Item({
         this.id,
        required this.title,
        required this.description,
        required this.isCompleted,
         this.createdAt,
         this.updatedAt,
    });

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        id: json["_id"],
        title: json["title"],
        description: json["description"],
        isCompleted: json["is_completed"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

    Map<String, dynamic> toJson() => {
        "title": title,
        "description": description,
        "is_completed": isCompleted,
    };
}

class Meta {
    int totalItems;
    int totalPages;
    int perPageItem;
    int currentPage;
    int pageSize;
    bool hasMorePage;

    Meta({
        required this.totalItems,
        required this.totalPages,
        required this.perPageItem,
        required this.currentPage,
        required this.pageSize,
        required this.hasMorePage,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalItems: json["total_items"],
        totalPages: json["total_pages"],
        perPageItem: json["per_page_item"],
        currentPage: json["current_page"],
        pageSize: json["page_size"],
        hasMorePage: json["has_more_page"],
    );

    Map<String, dynamic> toJson() => {
        "total_items": totalItems,
        "total_pages": totalPages,
        "per_page_item": perPageItem,
        "current_page": currentPage,
        "page_size": pageSize,
        "has_more_page": hasMorePage,
    };
}
