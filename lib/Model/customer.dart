// To parse this JSON data, do
//
//     final CustomerModel = CustomerModelFromJson(jsonString);

import 'dart:convert';

CustomerModel CustomerModelFromJson(String str) =>
    CustomerModel.fromJson(json.decode(str));

String CustomerModelToJson(CustomerModel data) => json.encode(data.toJson());

class CustomerModel {
  CustomerModel({
    required this.status,
    required this.message,
    required this.data,
    required this.authToken,
  });

  String status;
  String message;
  List<Datum> data;
  String authToken;

  factory CustomerModel.fromJson(Map<String, dynamic> json) => CustomerModel(
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
    this.customerId,
    this.accountStatus,
    required this.customerName,
    this.customerAddress1,
    this.customerAddress2,
    this.customerAddress3,
    this.customerCity,
    this.customerState,
    this.customerZip,
    this.customerCountry,
    this.customerPhone,
    this.customerFax,
    this.customerEmail,
    this.customerWebPage,
    this.CustomerModel,
    this.customerPassword,
    this.customerPasswordOld,
    this.customerPasswordDate,
    this.customerPasswordExpires,
    this.customerPasswordExpiresDate,
    this.customerFirstName,
    this.customerLastName,
    this.customerSalutation,
    this.attention,
    this.customerTypeId,
    this.taxIdno,
    this.vattaxIdnumber,
    this.vatTaxOtherNumber,
    this.currencyId,
    this.glsalesAccount,
    this.termsId,
    this.termsStart,
    this.employeeId,
    this.taxGroupId,
    this.priceMatrix,
    this.priceMatrixCurrent,
    this.creditRating,
    this.creditLimit,
    this.creditComments,
    this.paymentDay,
    this.approvalDate,
    this.customerSince,
    this.sendCreditMemos,
    this.sendDebitMemos,
    this.statements,
    this.statementCycleCode,
    this.customerSpecialInstructions,
    this.customerShipToId,
    this.customerShipForId,
    this.shipMethodId,
    this.warehouseId,
    this.routingInfo1,
    this.routingInfo2,
    this.routingInfo3,
    this.routingInfoCurrent,
    this.freightPayment,
    this.pickTicketsNeeded,
    this.packingListNeeded,
    this.specialLabelsNeeded,
    this.customerItemCodes,
    this.confirmBeforeShipping,
    this.backorders,
    this.useStoreNumbers,
    this.useDepartmentNumbers,
    this.specialShippingInstructions,
    this.routingNotes,
    this.applyRebate,
    this.rebateAmount,
    this.rebateGlaccount,
    this.rebateAmountNotes,
    this.applyNewStore,
    this.newStoreDiscount,
    this.newStoreGlaccount,
    this.newStoreDiscountNotes,
    this.applyWarehouse,
    this.warehouseAllowance,
    this.warehouseGlaccount,
    this.warehouseAllowanceNotes,
    this.applyAdvertising,
    this.advertisingDiscount,
    this.advertisingGlaccount,
    this.advertisingDiscountNotes,
    this.applyManualAdvert,
    this.manualAdvertising,
    this.manualAdvertisingGlaccount,
    this.manualAdvertisingNotes,
    this.applyTrade,
    this.tradeDiscount,
    this.tradeDiscountGlaccount,
    this.tradeDiscountNotes,
    this.specialTerms,
    this.ediqualifier,
    this.ediid,
    this.editestQualifier,
    this.editestId,
    this.edicontactName,
    this.edicontactAgentFax,
    this.edicontactAgentPhone,
    this.edicontactAddressLine,
    this.edipurchaseOrders,
    this.ediinvoices,
    this.edipayments,
    this.ediorderStatus,
    this.edishippingNotices,
    this.approved,
    this.approvedBy,
    this.approvedDate,
    this.enteredBy,
    this.convertedFromVendor,
    this.convertedFromLead,
    this.customerRegionId,
    this.customerSourceId,
    this.customerIndustryId,
    this.confirmed,
    this.firstContacted,
    this.lastFollowUp,
    this.nextFollowUp,
    this.referedByExistingCustomer,
    this.referedBy,
    this.referedDate,
    this.referalUrl,
    this.hot,
    this.primaryInterest,
    this.lockedBy,
    this.lockTs,
    this.accountBalance,
    this.branchCode,
    this.knowYourCustomer,
    this.smsalert,
    this.emailAlert,
  });

  dynamic companyId;
  dynamic divisionId;
  dynamic departmentId;
  dynamic customerId;
  dynamic accountStatus;
  String customerName;
  dynamic customerAddress1;
  dynamic customerAddress2;
  dynamic customerAddress3;
  dynamic customerCity;
  dynamic customerState;
  dynamic customerZip;
  dynamic customerCountry;
  dynamic customerPhone;
  dynamic customerFax;
  dynamic customerEmail;
  dynamic customerWebPage;
  dynamic CustomerModel;
  dynamic customerPassword;
  dynamic customerPasswordOld;
  dynamic customerPasswordDate;
  dynamic customerPasswordExpires;
  dynamic customerPasswordExpiresDate;
  dynamic customerFirstName;
  dynamic customerLastName;
  dynamic customerSalutation;
  dynamic attention;
  dynamic customerTypeId;
  dynamic taxIdno;
  dynamic vattaxIdnumber;
  dynamic vatTaxOtherNumber;
  dynamic currencyId;
  dynamic glsalesAccount;
  dynamic termsId;
  dynamic termsStart;
  dynamic employeeId;
  dynamic taxGroupId;
  dynamic priceMatrix;
  dynamic priceMatrixCurrent;
  dynamic creditRating;
  dynamic creditLimit;
  dynamic creditComments;
  dynamic paymentDay;
  dynamic approvalDate;
  dynamic customerSince;
  dynamic sendCreditMemos;
  dynamic sendDebitMemos;
  dynamic statements;
  dynamic statementCycleCode;
  dynamic customerSpecialInstructions;
  dynamic customerShipToId;
  dynamic customerShipForId;
  dynamic shipMethodId;
  dynamic warehouseId;
  dynamic routingInfo1;
  dynamic routingInfo2;
  dynamic routingInfo3;
  dynamic routingInfoCurrent;
  dynamic freightPayment;
  dynamic pickTicketsNeeded;
  dynamic packingListNeeded;
  dynamic specialLabelsNeeded;
  dynamic customerItemCodes;
  dynamic confirmBeforeShipping;
  dynamic backorders;
  dynamic useStoreNumbers;
  dynamic useDepartmentNumbers;
  dynamic specialShippingInstructions;
  dynamic routingNotes;
  dynamic applyRebate;
  dynamic rebateAmount;
  dynamic rebateGlaccount;
  dynamic rebateAmountNotes;
  dynamic applyNewStore;
  dynamic newStoreDiscount;
  dynamic newStoreGlaccount;
  dynamic newStoreDiscountNotes;
  dynamic applyWarehouse;
  dynamic warehouseAllowance;
  dynamic warehouseGlaccount;
  dynamic warehouseAllowanceNotes;
  dynamic applyAdvertising;
  dynamic advertisingDiscount;
  dynamic advertisingGlaccount;
  dynamic advertisingDiscountNotes;
  dynamic applyManualAdvert;
  dynamic manualAdvertising;
  dynamic manualAdvertisingGlaccount;
  dynamic manualAdvertisingNotes;
  dynamic applyTrade;
  dynamic tradeDiscount;
  dynamic tradeDiscountGlaccount;
  dynamic tradeDiscountNotes;
  dynamic specialTerms;
  dynamic ediqualifier;
  dynamic ediid;
  dynamic editestQualifier;
  dynamic editestId;
  dynamic edicontactName;
  dynamic edicontactAgentFax;
  dynamic edicontactAgentPhone;
  dynamic edicontactAddressLine;
  dynamic edipurchaseOrders;
  dynamic ediinvoices;
  dynamic edipayments;
  dynamic ediorderStatus;
  dynamic edishippingNotices;
  dynamic approved;
  dynamic approvedBy;
  dynamic approvedDate;
  dynamic enteredBy;
  dynamic convertedFromVendor;
  dynamic convertedFromLead;
  dynamic customerRegionId;
  dynamic customerSourceId;
  dynamic customerIndustryId;
  dynamic confirmed;
  dynamic firstContacted;
  dynamic lastFollowUp;
  dynamic nextFollowUp;
  dynamic referedByExistingCustomer;
  dynamic referedBy;
  dynamic referedDate;
  dynamic referalUrl;
  dynamic hot;
  dynamic primaryInterest;
  dynamic lockedBy;
  dynamic lockTs;
  dynamic accountBalance;
  dynamic branchCode;
  dynamic knowYourCustomer;
  dynamic smsalert;
  dynamic emailAlert;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        companyId: json["companyId"],
        divisionId: json["divisionId"],
        departmentId: json["departmentId"],
        customerId: json["customerId"],
        accountStatus: json["accountStatus"],
        customerName: json["customerName"],
        customerAddress1: json["customerAddress1"],
        customerAddress2: json["customerAddress2"],
        customerAddress3: json["customerAddress3"],
        customerCity: json["customerCity"],
        customerState: json["customerState"],
        customerZip: json["customerZip"],
        customerCountry: json["customerCountry"],
        customerPhone: json["customerPhone"],
        customerFax: json["customerFax"],
        customerEmail: json["customerEmail"],
        customerWebPage: json["customerWebPage"],
        CustomerModel: json["CustomerModel"],
        customerPassword: json["customerPassword"],
        customerPasswordOld: json["customerPasswordOld"],
        customerPasswordDate: json["customerPasswordDate"],
        customerPasswordExpires: json["customerPasswordExpires"],
        customerPasswordExpiresDate: json["customerPasswordExpiresDate"],
        customerFirstName: json["customerFirstName"],
        customerLastName: json["customerLastName"],
        customerSalutation: json["customerSalutation"],
        attention: json["attention"],
        customerTypeId: json["customerTypeId"],
        taxIdno: json["taxIdno"],
        vattaxIdnumber: json["vattaxIdnumber"],
        vatTaxOtherNumber: json["vatTaxOtherNumber"],
        currencyId: json["currencyId"],
        glsalesAccount: json["glsalesAccount"],
        termsId: json["termsId"],
        termsStart: json["termsStart"],
        employeeId: json["employeeId"],
        taxGroupId: json["taxGroupId"],
        priceMatrix: json["priceMatrix"],
        priceMatrixCurrent: DateTime.parse(json["priceMatrixCurrent"]),
        creditRating: json["creditRating"],
        creditLimit: json["creditLimit"],
        creditComments: json["creditComments"],
        paymentDay: json["paymentDay"],
        approvalDate: json["approvalDate"],
        customerSince: json["customerSince"],
        sendCreditMemos: json["sendCreditMemos"],
        sendDebitMemos: json["sendDebitMemos"],
        statements: json["statements"],
        statementCycleCode: json["statementCycleCode"],
        customerSpecialInstructions: json["customerSpecialInstructions"],
        customerShipToId: json["customerShipToId"],
        customerShipForId: json["customerShipForId"],
        shipMethodId: json["shipMethodId"],
        warehouseId: json["warehouseId"],
        routingInfo1: json["routingInfo1"],
        routingInfo2: json["routingInfo2"],
        routingInfo3: json["routingInfo3"],
        routingInfoCurrent: json["routingInfoCurrent"],
        freightPayment: json["freightPayment"],
        pickTicketsNeeded: json["pickTicketsNeeded"],
        packingListNeeded: json["packingListNeeded"],
        specialLabelsNeeded: json["specialLabelsNeeded"],
        customerItemCodes: json["customerItemCodes"],
        confirmBeforeShipping: json["confirmBeforeShipping"],
        backorders: json["backorders"],
        useStoreNumbers: json["useStoreNumbers"],
        useDepartmentNumbers: json["useDepartmentNumbers"],
        specialShippingInstructions: json["specialShippingInstructions"],
        routingNotes: json["routingNotes"],
        applyRebate: json["applyRebate"],
        rebateAmount: json["rebateAmount"],
        rebateGlaccount: json["rebateGlaccount"],
        rebateAmountNotes: json["rebateAmountNotes"],
        applyNewStore: json["applyNewStore"],
        newStoreDiscount: json["newStoreDiscount"],
        newStoreGlaccount: json["newStoreGlaccount"],
        newStoreDiscountNotes: json["newStoreDiscountNotes"],
        applyWarehouse: json["applyWarehouse"],
        warehouseAllowance: json["warehouseAllowance"],
        warehouseGlaccount: json["warehouseGlaccount"],
        warehouseAllowanceNotes: json["warehouseAllowanceNotes"],
        applyAdvertising: json["applyAdvertising"],
        advertisingDiscount: json["advertisingDiscount"],
        advertisingGlaccount: json["advertisingGlaccount"],
        advertisingDiscountNotes: json["advertisingDiscountNotes"],
        applyManualAdvert: json["applyManualAdvert"],
        manualAdvertising: json["manualAdvertising"],
        manualAdvertisingGlaccount: json["manualAdvertisingGlaccount"],
        manualAdvertisingNotes: json["manualAdvertisingNotes"],
        applyTrade: json["applyTrade"],
        tradeDiscount: json["tradeDiscount"],
        tradeDiscountGlaccount: json["tradeDiscountGlaccount"],
        tradeDiscountNotes: json["tradeDiscountNotes"],
        specialTerms: json["specialTerms"],
        ediqualifier: json["ediqualifier"],
        ediid: json["ediid"],
        editestQualifier: json["editestQualifier"],
        editestId: json["editestId"],
        edicontactName: json["edicontactName"],
        edicontactAgentFax: json["edicontactAgentFax"],
        edicontactAgentPhone: json["edicontactAgentPhone"],
        edicontactAddressLine: json["edicontactAddressLine"],
        edipurchaseOrders: json["edipurchaseOrders"],
        ediinvoices: json["ediinvoices"],
        edipayments: json["edipayments"],
        ediorderStatus: json["ediorderStatus"],
        edishippingNotices: json["edishippingNotices"],
        approved: json["approved"],
        approvedBy: json["approvedBy"],
        approvedDate: json["approvedDate"],
        enteredBy: json["enteredBy"],
        convertedFromVendor: json["convertedFromVendor"],
        convertedFromLead: json["convertedFromLead"],
        customerRegionId: json["customerRegionId"],
        customerSourceId: json["customerSourceId"],
        customerIndustryId: json["customerIndustryId"],
        confirmed: json["confirmed"],
        firstContacted: json["firstContacted"],
        lastFollowUp: json["lastFollowUp"],
        nextFollowUp: json["nextFollowUp"],
        referedByExistingCustomer: json["referedByExistingCustomer"],
        referedBy: json["referedBy"],
        referedDate: json["referedDate"],
        referalUrl: json["referalUrl"],
        hot: json["hot"],
        primaryInterest: json["primaryInterest"],
        lockedBy: json["lockedBy"],
        lockTs: json["lockTs"],
        accountBalance: json["accountBalance"],
        branchCode: json["branchCode"],
        knowYourCustomer: json["knowYourCustomer"],
        smsalert: json["smsalert"],
        emailAlert: json["emailAlert"],
      );

  Map<String, dynamic> toJson() => {
        "companyId": companyId,
        "divisionId": divisionId,
        "departmentId": departmentId,
        "customerId": customerId,
        "accountStatus": accountStatus,
        "customerName": customerName,
        "customerAddress1": customerAddress1,
        "customerAddress2": customerAddress2,
        "customerAddress3": customerAddress3,
        "customerCity": customerCity,
        "customerState": customerState,
        "customerZip": customerZip,
        "customerCountry": customerCountry,
        "customerPhone": customerPhone,
        "customerFax": customerFax,
        "customerEmail": customerEmail,
        "customerWebPage": customerWebPage,
        "CustomerModel": CustomerModel,
        "customerPassword": customerPassword,
        "customerPasswordOld": customerPasswordOld,
        "customerPasswordDate": customerPasswordDate,
        "customerPasswordExpires": customerPasswordExpires,
        "customerPasswordExpiresDate": customerPasswordExpiresDate,
        "customerFirstName": customerFirstName,
        "customerLastName": customerLastName,
        "customerSalutation": customerSalutation,
        "attention": attention,
        "customerTypeId": customerTypeId,
        "taxIdno": taxIdno,
        "vattaxIdnumber": vattaxIdnumber,
        "vatTaxOtherNumber": vatTaxOtherNumber,
        "currencyId": currencyId,
        "glsalesAccount": glsalesAccount,
        "termsId": termsId,
        "termsStart": termsStart,
        "employeeId": employeeId,
        "taxGroupId": taxGroupId,
        "priceMatrix": priceMatrix,
        "priceMatrixCurrent": priceMatrixCurrent.toIso8601String(),
        "creditRating": creditRating,
        "creditLimit": creditLimit,
        "creditComments": creditComments,
        "paymentDay": paymentDay,
        "approvalDate": approvalDate,
        "customerSince": customerSince,
        "sendCreditMemos": sendCreditMemos,
        "sendDebitMemos": sendDebitMemos,
        "statements": statements,
        "statementCycleCode": statementCycleCode,
        "customerSpecialInstructions": customerSpecialInstructions,
        "customerShipToId": customerShipToId,
        "customerShipForId": customerShipForId,
        "shipMethodId": shipMethodId,
        "warehouseId": warehouseId,
        "routingInfo1": routingInfo1,
        "routingInfo2": routingInfo2,
        "routingInfo3": routingInfo3,
        "routingInfoCurrent": routingInfoCurrent,
        "freightPayment": freightPayment,
        "pickTicketsNeeded": pickTicketsNeeded,
        "packingListNeeded": packingListNeeded,
        "specialLabelsNeeded": specialLabelsNeeded,
        "customerItemCodes": customerItemCodes,
        "confirmBeforeShipping": confirmBeforeShipping,
        "backorders": backorders,
        "useStoreNumbers": useStoreNumbers,
        "useDepartmentNumbers": useDepartmentNumbers,
        "specialShippingInstructions": specialShippingInstructions,
        "routingNotes": routingNotes,
        "applyRebate": applyRebate,
        "rebateAmount": rebateAmount,
        "rebateGlaccount": rebateGlaccount,
        "rebateAmountNotes": rebateAmountNotes,
        "applyNewStore": applyNewStore,
        "newStoreDiscount": newStoreDiscount,
        "newStoreGlaccount": newStoreGlaccount,
        "newStoreDiscountNotes": newStoreDiscountNotes,
        "applyWarehouse": applyWarehouse,
        "warehouseAllowance": warehouseAllowance,
        "warehouseGlaccount": warehouseGlaccount,
        "warehouseAllowanceNotes": warehouseAllowanceNotes,
        "applyAdvertising": applyAdvertising,
        "advertisingDiscount": advertisingDiscount,
        "advertisingGlaccount": advertisingGlaccount,
        "advertisingDiscountNotes": advertisingDiscountNotes,
        "applyManualAdvert": applyManualAdvert,
        "manualAdvertising": manualAdvertising,
        "manualAdvertisingGlaccount": manualAdvertisingGlaccount,
        "manualAdvertisingNotes": manualAdvertisingNotes,
        "applyTrade": applyTrade,
        "tradeDiscount": tradeDiscount,
        "tradeDiscountGlaccount": tradeDiscountGlaccount,
        "tradeDiscountNotes": tradeDiscountNotes,
        "specialTerms": specialTerms,
        "ediqualifier": ediqualifier,
        "ediid": ediid,
        "editestQualifier": editestQualifier,
        "editestId": editestId,
        "edicontactName": edicontactName,
        "edicontactAgentFax": edicontactAgentFax,
        "edicontactAgentPhone": edicontactAgentPhone,
        "edicontactAddressLine": edicontactAddressLine,
        "edipurchaseOrders": edipurchaseOrders,
        "ediinvoices": ediinvoices,
        "edipayments": edipayments,
        "ediorderStatus": ediorderStatus,
        "edishippingNotices": edishippingNotices,
        "approved": approved,
        "approvedBy": approvedBy,
        "approvedDate": approvedDate,
        "enteredBy": enteredBy,
        "convertedFromVendor": convertedFromVendor,
        "convertedFromLead": convertedFromLead,
        "customerRegionId": customerRegionId,
        "customerSourceId": customerSourceId,
        "customerIndustryId": customerIndustryId,
        "confirmed": confirmed,
        "firstContacted": firstContacted,
        "lastFollowUp": lastFollowUp,
        "nextFollowUp": nextFollowUp,
        "referedByExistingCustomer": referedByExistingCustomer,
        "referedBy": referedBy,
        "referedDate": referedDate,
        "referalUrl": referalUrl,
        "hot": hot,
        "primaryInterest": primaryInterest,
        "lockedBy": lockedBy,
        "lockTs": lockTs,
        "accountBalance": accountBalance,
        "branchCode": branchCode,
        "knowYourCustomer": knowYourCustomer,
        "smsalert": smsalert,
        "emailAlert": emailAlert,
      };
}
