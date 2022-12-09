// To parse this JSON data, do
//
//     final ItemModel = ItemModelFromJson(jsonString);

import 'dart:convert';

ItemModel ItemModelFromJson(String str) => ItemModel.fromJson(json.decode(str));

String ItemModelToJson(ItemModel data) => json.encode(data.toJson());

class ItemModel {
  ItemModel({
    required this.status,
    required this.message,
    required this.data,
    this.authToken,
  });

  String status;
  String message;
  List<Datum> data;
  dynamic authToken;

  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
        authToken: json["auth_token"],
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
        "auth_token": authToken,
      };
}

class Datum {
  Datum({
    this.companyId,
    this.divisionId,
    this.departmentId,
    this.ItemId,
    this.isActive,
    this.ItemTypeId,
    this.ItemName,
    this.ItemDescription,
    this.ItemLongDescription,
    this.ItemCategoryId,
    this.ItemFamilyId,
    this.salesDescription,
    this.purchaseDescription,
    this.pictureUrl,
    this.largePictureUrl,
    this.ItemWeight,
    this.ItemWeightMetric,
    this.ItemShipWeight,
    this.ItemUpccode,
    this.ItemEpccode,
    this.ItemRfid,
    this.ItemSize,
    this.ItemSizeCmm,
    this.ItemDimentions,
    this.ItemDimentionsCmm,
    this.ItemColor,
    this.ItemNrfcolor,
    this.ItemStyle,
    this.ItemNrfstyle,
    this.ItemCareInstructions,
    this.ItemDefaultWarehouse,
    this.ItemDefaultWarehouseBin,
    this.ItemLocationX,
    this.ItemLocationY,
    this.ItemLocationZ,
    this.downloadLocation,
    this.downloadPassword,
    this.ItemUom,
    this.glItemSalesAccount,
    this.glItemCogsaccount,
    this.glItemInventoryAccount,
    this.packId,
    this.currencyId,
    this.currencyExchangeRate,
    this.price,
    this.ItemPricingCode,
    this.pricingMethods,
    this.taxable,
    this.vendorId,
    this.leadTime,
    this.leadTimeUnit,
    this.reOrderLevel,
    this.reOrderQty,
    this.buildTime,
    this.buildTimeUnit,
    this.useageRate,
    this.useageRateUnit,
    this.salesForecast,
    this.salesForecastUnit,
    this.calculatedCover,
    this.calculatedCoverUnits,
    this.isAssembly,
    this.ItemAssembly,
    this.lifo,
    this.lifovalue,
    this.lifocost,
    this.average,
    this.averageValue,
    this.averageCost,
    this.fifo,
    this.fifovalue,
    this.fifocost,
    this.expected,
    this.expectedValue,
    this.expectedCost,
    this.landed,
    this.landedValue,
    this.landedCost,
    this.other,
    this.otherValue,
    this.otherCost,
    this.commissionable,
    this.commissionType,
    this.commissionPerc,
    this.approved,
    this.approvedBy,
    this.approvedDate,
    this.enteredBy,
    this.taxGroupId,
    this.taxPercent,
    this.lockedBy,
    this.lockTs,
    this.isSerialLotItemModel,
    this.isWarrantyItemModel,
    this.warrantyPeriod,
    this.minimumQty,
    this.lastEditDate,
    this.creationDate,
    this.glItemModelFreightAccount,
    this.glItemModelHandlingAccount,
    this.allowPurchaseTrans,
    this.allowSalesTrans,
    this.allowInventoryTrans,
    this.toleranceLevel,
    this.branchCode,
    this.enforceQualityAssuranceOnPo,
    this.isPack,
    this.allowPack,
    this.minimumQtyForPacking,
    this.projectId,
  });

  dynamic companyId;
  dynamic divisionId;
  dynamic departmentId;
  dynamic ItemId;
  dynamic isActive;
  dynamic ItemTypeId;
  dynamic ItemName;
  dynamic ItemDescription;
  dynamic ItemLongDescription;
  dynamic ItemCategoryId;
  dynamic ItemFamilyId;
  dynamic salesDescription;
  dynamic purchaseDescription;
  dynamic pictureUrl;
  dynamic largePictureUrl;
  dynamic ItemWeight;
  dynamic ItemWeightMetric;
  dynamic ItemShipWeight;
  dynamic ItemUpccode;
  dynamic ItemEpccode;
  dynamic ItemRfid;
  dynamic ItemSize;
  dynamic ItemSizeCmm;
  dynamic ItemDimentions;
  dynamic ItemDimentionsCmm;
  dynamic ItemColor;
  dynamic ItemNrfcolor;
  dynamic ItemStyle;
  dynamic ItemNrfstyle;
  dynamic ItemCareInstructions;
  dynamic ItemDefaultWarehouse;
  dynamic ItemDefaultWarehouseBin;
  dynamic ItemLocationX;
  dynamic ItemLocationY;
  dynamic ItemLocationZ;
  dynamic downloadLocation;
  dynamic downloadPassword;
  dynamic ItemUom;
  dynamic glItemSalesAccount;
  dynamic glItemCogsaccount;
  dynamic glItemInventoryAccount;
  dynamic packId;
  dynamic currencyId;
  dynamic currencyExchangeRate;
  dynamic price;
  dynamic ItemPricingCode;
  dynamic pricingMethods;
  dynamic taxable;
  dynamic vendorId;
  dynamic leadTime;
  dynamic leadTimeUnit;
  dynamic reOrderLevel;
  dynamic reOrderQty;
  dynamic buildTime;
  dynamic buildTimeUnit;
  dynamic useageRate;
  dynamic useageRateUnit;
  dynamic salesForecast;
  dynamic salesForecastUnit;
  dynamic calculatedCover;
  dynamic calculatedCoverUnits;
  dynamic isAssembly;
  dynamic ItemAssembly;
  dynamic lifo;
  dynamic lifovalue;
  dynamic lifocost;
  dynamic average;
  dynamic averageValue;
  dynamic averageCost;
  dynamic fifo;
  dynamic fifovalue;
  dynamic fifocost;
  dynamic expected;
  dynamic expectedValue;
  dynamic expectedCost;
  dynamic landed;
  dynamic landedValue;
  dynamic landedCost;
  dynamic other;
  dynamic otherValue;
  dynamic otherCost;
  dynamic commissionable;
  dynamic commissionType;
  dynamic commissionPerc;
  dynamic approved;
  dynamic approvedBy;
  dynamic approvedDate;
  dynamic enteredBy;
  dynamic taxGroupId;
  dynamic taxPercent;
  dynamic lockedBy;
  dynamic lockTs;
  dynamic isSerialLotItemModel;
  dynamic isWarrantyItemModel;
  dynamic warrantyPeriod;
  dynamic minimumQty;
  dynamic lastEditDate;
  dynamic creationDate;
  dynamic glItemModelFreightAccount;
  dynamic glItemModelHandlingAccount;
  dynamic allowPurchaseTrans;
  dynamic allowSalesTrans;
  dynamic allowInventoryTrans;
  dynamic toleranceLevel;
  dynamic branchCode;
  dynamic enforceQualityAssuranceOnPo;
  dynamic isPack;
  dynamic allowPack;
  dynamic minimumQtyForPacking;
  dynamic projectId;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        ItemId: json["itemModelId"],
        isActive: json["isActive"],
        ItemTypeId: json["ItemTypeId"],
        ItemName: json["itemName"],
        ItemDescription: json["ItemDescription"],
        ItemLongDescription: json["ItemLongDescription"],
        ItemCategoryId: json["ItemCategoryId"],
        ItemFamilyId: json["itemFamilyId"],
        salesDescription: json["salesDescription"],
        purchaseDescription: json["purchaseDescription"],
        pictureUrl: json["pictureUrl"],
        largePictureUrl: json["largePictureUrl"],
        ItemWeight: json["ItemWeight"],
        ItemWeightMetric: json["ItemWeightMetric"],
        ItemShipWeight: json["ItemShipWeight"],
        ItemUpccode:
            json["ItemUpccode"] == null ? null : json["ItemModelUpccode"],
        ItemEpccode: json["ItemEpccode"],
        ItemRfid: json["ItemRfid"],
        ItemSize: json["ItemSize"],
        ItemSizeCmm: json["ItemSizeCmm"],
        ItemDimentions: json["ItemDimentions"],
        ItemDimentionsCmm: json["ItemDimentionsCmm"],
        ItemColor: json["ItemColor"],
        ItemNrfcolor: json["ItemNrfcolor"],
        ItemStyle: json["ItemStyle"],
        ItemNrfstyle: json["ItemNrfstyle"],
        ItemCareInstructions: json["ItemCareInstructions"],
        ItemDefaultWarehouse: json["ItemDefaultWarehouse"],
        ItemDefaultWarehouseBin: json["ItemDefaultWarehouseBin"],
        ItemLocationX: json["ItemLocationX"],
        ItemLocationY: json["ItemLocationY"],
        ItemLocationZ: json["ItemLocationZ"],
        downloadLocation: json["downloadLocation"],
        downloadPassword: json["downloadPassword"],
        ItemUom: json["ItemModelUom"],
        glItemSalesAccount: json["glItemSalesAccount"],
        glItemCogsaccount: json["glItemCogsaccount"],
        glItemInventoryAccount: json["glItemInventoryAccount"] == null
            ? null
            : json["glItemInventoryAccount"],
        packId: json["packId"],
        currencyId: json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        price: json["price"],
        ItemPricingCode: json["ItemModelPricingCode"] == null
            ? null
            : json["ItemPricingCode"],
        pricingMethods: json["pricingMethods"],
        taxable: json["taxable"],
        vendorId: json["vendorId"],
        leadTime: json["leadTime"],
        leadTimeUnit: json["leadTimeUnit"],
        reOrderLevel:
            json["reOrderLevel"] == null ? null : json["reOrderLevel"],
        reOrderQty: json["reOrderQty"] == null ? null : json["reOrderQty"],
        buildTime: json["buildTime"],
        buildTimeUnit: json["buildTimeUnit"],
        useageRate: json["useageRate"],
        useageRateUnit: json["useageRateUnit"],
        salesForecast: json["salesForecast"],
        salesForecastUnit: json["salesForecastUnit"],
        calculatedCover: json["calculatedCover"],
        calculatedCoverUnits: json["calculatedCoverUnits"],
        isAssembly: json["isAssembly"],
        ItemAssembly: json["ItemModelAssembly"],
        lifo: json["lifo"],
        lifovalue: json["lifovalue"] == null ? null : json["lifovalue"],
        lifocost: json["lifocost"] == null ? null : json["lifocost"],
        average: json["average"],
        averageValue: json["averageValue"] == null
            ? null
            : json["averageValue"].toDouble(),
        averageCost:
            json["averageCost"] == null ? null : json["averageCost"].toDouble(),
        fifo: json["fifo"],
        fifovalue: json["fifovalue"] == null ? null : json["fifovalue"],
        fifocost: json["fifocost"] == null ? null : json["fifocost"],
        expected: json["expected"],
        expectedValue: json["expectedValue"],
        expectedCost: json["expectedCost"],
        landed: json["landed"],
        landedValue: json["landedValue"],
        landedCost: json["landedCost"],
        other: json["other"],
        otherValue: json["otherValue"],
        otherCost: json["otherCost"],
        commissionable: json["commissionable"],
        commissionType: json["commissionType"],
        commissionPerc: json["commissionPerc"],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        approvedDate: json["approvedDate"],
        enteredBy: json["enteredBy"] == null ? null : json["enteredBy"],
        taxGroupId: json["taxGroupId"],
        taxPercent: json["taxPercent"],
        lockedBy: json["lockedBy"],
        lockTs: json["lockTs"],
        isSerialLotItemModel: json["isSerialLotItemModel"],
        isWarrantyItemModel: json["isWarrantyItemModel"],
        warrantyPeriod: json["warrantyPeriod"],
        minimumQty: json["minimumQty"],
        lastEditDate: DateTime.parse(json["lastEditDate"]),
        creationDate: DateTime.parse(json["creationDate"]),
        glItemModelFreightAccount: json["glItemModelFreightAccount"],
        glItemModelHandlingAccount: json["glItemModelHandlingAccount"],
        allowPurchaseTrans: json["allowPurchaseTrans"],
        allowSalesTrans: json["allowSalesTrans"],
        allowInventoryTrans: json["allowInventoryTrans"],
        toleranceLevel: json["toleranceLevel"],
        branchCode: json["branchCode"],
        enforceQualityAssuranceOnPo: json["enforceQualityAssuranceOnPo"],
        isPack: json["isPack"] == null ? null : json["isPack"],
        allowPack: json["allowPack"] == null ? null : json["allowPack"],
        minimumQtyForPacking: json["minimumQtyForPacking"],
        projectId: json["projectId"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "ItemModelId": ItemId,
        "isActive": isActive,
        "ItemModelTypeId": ItemTypeId,
        "ItemModelName": ItemName,
        "ItemModelDescription": ItemDescription,
        "ItemModelLongDescription": ItemLongDescription,
        "ItemModelCategoryId": ItemCategoryId,
        "ItemModelFamilyId": ItemFamilyId,
        "salesDescription": salesDescription,
        "purchaseDescription": purchaseDescription,
        "pictureUrl": pictureUrl,
        "largePictureUrl": largePictureUrl,
        "ItemModelWeight": ItemWeight,
        "ItemModelWeightMetric": ItemWeightMetric,
        "ItemModelShipWeight": ItemShipWeight,
        "ItemModelUpccode": ItemUpccode == null ? null : ItemUpccode,
        "ItemModelEpccode": ItemEpccode,
        "ItemModelRfid": ItemRfid,
        "ItemModelSize": ItemSize,
        "ItemModelSizeCmm": ItemSizeCmm,
        "ItemModelDimentions": ItemDimentions,
        "ItemModelDimentionsCmm": ItemDimentionsCmm,
        "ItemModelColor": ItemColor,
        "ItemModelNrfcolor": ItemNrfcolor,
        "ItemModelStyle": ItemStyle,
        "ItemModelNrfstyle": ItemNrfstyle,
        "ItemModelCareInstructions": ItemCareInstructions,
        "ItemModelDefaultWarehouse": ItemDefaultWarehouse,
        "ItemModelDefaultWarehouseBin": ItemDefaultWarehouseBin,
        "ItemModelLocationX": ItemLocationX,
        "ItemModelLocationY": ItemLocationY,
        "ItemModelLocationZ": ItemLocationZ,
        "downloadLocation": downloadLocation,
        "downloadPassword": downloadPassword,
        "ItemModelUom": ItemUom,
        "glItemModelSalesAccount": glItemSalesAccount,
        "glItemModelCogsaccount": glItemCogsaccount,
        "glItemModelInventoryAccount":
            glItemInventoryAccount == null ? null : glItemInventoryAccount,
        "packId": packId,
        "currencyId": currencyId,
        "currencyExchangeRate": currencyExchangeRate,
        "price": price,
        "ItemModelPricingCode":
            ItemPricingCode == null ? null : ItemPricingCode,
        "pricingMethods": pricingMethods,
        "taxable": taxable,
        "vendorId": vendorId,
        "leadTime": leadTime,
        "leadTimeUnit": leadTimeUnit,
        "reOrderLevel": reOrderLevel == null ? null : reOrderLevel,
        "reOrderQty": reOrderQty == null ? null : reOrderQty,
        "buildTime": buildTime,
        "buildTimeUnit": buildTimeUnit,
        "useageRate": useageRate,
        "useageRateUnit": useageRateUnit,
        "salesForecast": salesForecast,
        "salesForecastUnit": salesForecastUnit,
        "calculatedCover": calculatedCover,
        "calculatedCoverUnits": calculatedCoverUnits,
        "isAssembly": isAssembly,
        "ItemModelAssembly": ItemAssembly,
        "lifo": lifo,
        "lifovalue": lifovalue == null ? null : lifovalue,
        "lifocost": lifocost == null ? null : lifocost,
        "average": average,
        "averageValue": averageValue == null ? null : averageValue,
        "averageCost": averageCost == null ? null : averageCost,
        "fifo": fifo,
        "fifovalue": fifovalue == null ? null : fifovalue,
        "fifocost": fifocost == null ? null : fifocost,
        "expected": expected,
        "expectedValue": expectedValue,
        "expectedCost": expectedCost,
        "landed": landed,
        "landedValue": landedValue,
        "landedCost": landedCost,
        "other": other,
        "otherValue": otherValue,
        "otherCost": otherCost,
        "commissionable": commissionable,
        "commissionType": commissionType,
        "commissionPerc": commissionPerc,
        "approved": approved,
        "approvedBy": approvedBy,
        "approvedDate": approvedDate,
        "enteredBy": enteredBy == null ? null : enteredBy,
        "taxGroupId": taxGroupId,
        "taxPercent": taxPercent,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "isSerialLotItemModel": isSerialLotItemModel,
        "isWarrantyItemModel": isWarrantyItemModel,
        "warrantyPeriod": warrantyPeriod,
        "minimumQty": minimumQty,
        "lastEditDate": lastEditDate.toIso8601String(),
        "creationDate": creationDate.toIso8601String(),
        "glItemModelFreightAccount": glItemModelFreightAccount,
        "glItemModelHandlingAccount": glItemModelHandlingAccount,
        "allowPurchaseTrans": allowPurchaseTrans,
        "allowSalesTrans": allowSalesTrans,
        "allowInventoryTrans": allowInventoryTrans,
        "toleranceLevel": toleranceLevel,
        "branchCode": branchCode,
        "enforceQualityAssuranceOnPo": enforceQualityAssuranceOnPo,
        "isPack": isPack == null ? null : isPack,
        "allowPack": allowPack == null ? null : allowPack,
        "minimumQtyForPacking": minimumQtyForPacking,
        "projectId": projectId,
      };
}
