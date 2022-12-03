// To parse this JSON data, do
//
//     final Item = ItemFromJson(jsonString);

import 'dart:convert';

Item ItemFromJson(String str) => Item.fromJson(json.decode(str));

String ItemToJson(Item data) => json.encode(data.toJson());

class Item {
  Item({
    required this.status,
    required this.message,
    required this.data,
    this.authToken,
  });

  String status;
  String message;
  List<Datum> data;
  dynamic authToken;

  factory Item.fromJson(Map<String, dynamic> json) => Item(
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
    this.itemId,
    this.isActive,
    this.itemTypeId,
    this.itemName,
    this.itemDescription,
    this.itemLongDescription,
    this.itemCategoryId,
    this.itemFamilyId,
    this.salesDescription,
    this.purchaseDescription,
    this.pictureUrl,
    this.largePictureUrl,
    this.itemWeight,
    this.itemWeightMetric,
    this.itemShipWeight,
    this.itemUpccode,
    this.itemEpccode,
    this.itemRfid,
    this.itemSize,
    this.itemSizeCmm,
    this.itemDimentions,
    this.itemDimentionsCmm,
    this.itemColor,
    this.itemNrfcolor,
    this.itemStyle,
    this.itemNrfstyle,
    this.itemCareInstructions,
    this.itemDefaultWarehouse,
    this.itemDefaultWarehouseBin,
    this.itemLocationX,
    this.itemLocationY,
    this.itemLocationZ,
    this.downloadLocation,
    this.downloadPassword,
    this.itemUom,
    this.glitemSalesAccount,
    this.glitemCogsaccount,
    this.glitemInventoryAccount,
    this.packId,
    this.currencyId,
    this.currencyExchangeRate,
    this.price,
    this.itemPricingCode,
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
    this.itemAssembly,
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
    this.isSerialLotItem,
    this.isWarrantyItem,
    this.warrantyPeriod,
    this.minimumQty,
    this.lastEditDate,
    this.creationDate,
    this.glitemFreightAccount,
    this.glitemHandlingAccount,
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
  dynamic itemId;
  dynamic isActive;
  dynamic itemTypeId;
  dynamic itemName;
  dynamic itemDescription;
  dynamic itemLongDescription;
  dynamic itemCategoryId;
  dynamic itemFamilyId;
  dynamic salesDescription;
  dynamic purchaseDescription;
  dynamic pictureUrl;
  dynamic largePictureUrl;
  dynamic itemWeight;
  dynamic itemWeightMetric;
  dynamic itemShipWeight;
  dynamic itemUpccode;
  dynamic itemEpccode;
  dynamic itemRfid;
  dynamic itemSize;
  dynamic itemSizeCmm;
  dynamic itemDimentions;
  dynamic itemDimentionsCmm;
  dynamic itemColor;
  dynamic itemNrfcolor;
  dynamic itemStyle;
  dynamic itemNrfstyle;
  dynamic itemCareInstructions;
  dynamic itemDefaultWarehouse;
  dynamic itemDefaultWarehouseBin;
  dynamic itemLocationX;
  dynamic itemLocationY;
  dynamic itemLocationZ;
  dynamic downloadLocation;
  dynamic downloadPassword;
  dynamic itemUom;
  dynamic glitemSalesAccount;
  dynamic glitemCogsaccount;
  dynamic glitemInventoryAccount;
  dynamic packId;
  dynamic currencyId;
  dynamic currencyExchangeRate;
  dynamic price;
  dynamic itemPricingCode;
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
  dynamic itemAssembly;
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
  dynamic isSerialLotItem;
  dynamic isWarrantyItem;
  dynamic warrantyPeriod;
  dynamic minimumQty;
  dynamic lastEditDate;
  dynamic creationDate;
  dynamic glitemFreightAccount;
  dynamic glitemHandlingAccount;
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
        itemId: json["itemId"],
        isActive: json["isActive"],
        itemTypeId: json["itemTypeId"],
        itemName: json["itemName"],
        itemDescription: json["itemDescription"],
        itemLongDescription: json["itemLongDescription"],
        itemCategoryId: json["itemCategoryId"],
        itemFamilyId: json["itemFamilyId"],
        salesDescription: json["salesDescription"],
        purchaseDescription: json["purchaseDescription"],
        pictureUrl: json["pictureUrl"],
        largePictureUrl: json["largePictureUrl"],
        itemWeight: json["itemWeight"],
        itemWeightMetric: json["itemWeightMetric"],
        itemShipWeight: json["itemShipWeight"],
        itemUpccode: json["itemUpccode"] == null ? null : json["itemUpccode"],
        itemEpccode: json["itemEpccode"],
        itemRfid: json["itemRfid"],
        itemSize: json["itemSize"],
        itemSizeCmm: json["itemSizeCmm"],
        itemDimentions: json["itemDimentions"],
        itemDimentionsCmm: json["itemDimentionsCmm"],
        itemColor: json["itemColor"],
        itemNrfcolor: json["itemNrfcolor"],
        itemStyle: json["itemStyle"],
        itemNrfstyle: json["itemNrfstyle"],
        itemCareInstructions: json["itemCareInstructions"],
        itemDefaultWarehouse: json["itemDefaultWarehouse"],
        itemDefaultWarehouseBin: json["itemDefaultWarehouseBin"],
        itemLocationX: json["itemLocationX"],
        itemLocationY: json["itemLocationY"],
        itemLocationZ: json["itemLocationZ"],
        downloadLocation: json["downloadLocation"],
        downloadPassword: json["downloadPassword"],
        itemUom: json["itemUom"],
        glitemSalesAccount: json["glitemSalesAccount"],
        glitemCogsaccount: json["glitemCogsaccount"],
        glitemInventoryAccount: json["glitemInventoryAccount"] == null
            ? null
            : json["glitemInventoryAccount"],
        packId: json["packId"],
        currencyId: json["currencyId"],
        currencyExchangeRate: json["currencyExchangeRate"],
        price: json["price"],
        itemPricingCode:
            json["itemPricingCode"] == null ? null : json["itemPricingCode"],
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
        itemAssembly: json["itemAssembly"],
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
        isSerialLotItem: json["isSerialLotItem"],
        isWarrantyItem: json["isWarrantyItem"],
        warrantyPeriod: json["warrantyPeriod"],
        minimumQty: json["minimumQty"],
        lastEditDate: DateTime.parse(json["lastEditDate"]),
        creationDate: DateTime.parse(json["creationDate"]),
        glitemFreightAccount: json["glitemFreightAccount"],
        glitemHandlingAccount: json["glitemHandlingAccount"],
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
        "itemId": itemId,
        "isActive": isActive,
        "itemTypeId": itemTypeId,
        "itemName": itemName,
        "itemDescription": itemDescription,
        "itemLongDescription": itemLongDescription,
        "itemCategoryId": itemCategoryId,
        "itemFamilyId": itemFamilyId,
        "salesDescription": salesDescription,
        "purchaseDescription": purchaseDescription,
        "pictureUrl": pictureUrl,
        "largePictureUrl": largePictureUrl,
        "itemWeight": itemWeight,
        "itemWeightMetric": itemWeightMetric,
        "itemShipWeight": itemShipWeight,
        "itemUpccode": itemUpccode == null ? null : itemUpccode,
        "itemEpccode": itemEpccode,
        "itemRfid": itemRfid,
        "itemSize": itemSize,
        "itemSizeCmm": itemSizeCmm,
        "itemDimentions": itemDimentions,
        "itemDimentionsCmm": itemDimentionsCmm,
        "itemColor": itemColor,
        "itemNrfcolor": itemNrfcolor,
        "itemStyle": itemStyle,
        "itemNrfstyle": itemNrfstyle,
        "itemCareInstructions": itemCareInstructions,
        "itemDefaultWarehouse": itemDefaultWarehouse,
        "itemDefaultWarehouseBin": itemDefaultWarehouseBin,
        "itemLocationX": itemLocationX,
        "itemLocationY": itemLocationY,
        "itemLocationZ": itemLocationZ,
        "downloadLocation": downloadLocation,
        "downloadPassword": downloadPassword,
        "itemUom": itemUom,
        "glitemSalesAccount": glitemSalesAccount,
        "glitemCogsaccount": glitemCogsaccount,
        "glitemInventoryAccount":
            glitemInventoryAccount == null ? null : glitemInventoryAccount,
        "packId": packId,
        "currencyId": currencyId,
        "currencyExchangeRate": currencyExchangeRate,
        "price": price,
        "itemPricingCode": itemPricingCode == null ? null : itemPricingCode,
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
        "itemAssembly": itemAssembly,
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
        "isSerialLotItem": isSerialLotItem,
        "isWarrantyItem": isWarrantyItem,
        "warrantyPeriod": warrantyPeriod,
        "minimumQty": minimumQty,
        "lastEditDate": lastEditDate.toIso8601String(),
        "creationDate": creationDate.toIso8601String(),
        "glitemFreightAccount": glitemFreightAccount,
        "glitemHandlingAccount": glitemHandlingAccount,
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
