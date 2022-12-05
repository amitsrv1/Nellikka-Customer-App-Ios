

// To parse this JSON data, do
//
//     final mainMenuModel = mainMenuModelFromJson(jsonString);

import 'dart:convert';

MainMenuModel mainMenuModelFromJson(String str) => MainMenuModel.fromJson(json.decode(str));

String mainMenuModelToJson(MainMenuModel data) => json.encode(data.toJson());

class MainMenuModel {
    MainMenuModel({
        this.success,
        this.menus,
        this.walletBalance,
    });

    bool? success;
    List<Menu>? menus;
    String? walletBalance;

    factory MainMenuModel.fromJson(Map<String, dynamic> json) => MainMenuModel(
        success: json["success"],
        menus: List<Menu>.from(json["Menus"].map((x) => Menu.fromJson(x))),
        walletBalance: json["wallet_balance"],
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "Menus": List<dynamic>.from(menus!.map((x) => x.toJson())),
        "wallet_balance": walletBalance,
    };
}

class Menu {
    Menu({
        this.id,
        this.menuEnglishName,
        this.menuMalayalamName,
        this.menuOrder,
    });

    String? id;
    String? menuEnglishName;
    String? menuMalayalamName;
    int? menuOrder;

    factory Menu.fromJson(Map<String, dynamic> json) => Menu(
        id: json["_id"],
        menuEnglishName: json["menu_english_name"],
        menuMalayalamName: json["menu_malayalam_name"],
        menuOrder: json["menu_order"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id,
        "menu_english_name": menuEnglishName,
        "menu_malayalam_name": menuMalayalamName,
        "menu_order": menuOrder,
    };
}
