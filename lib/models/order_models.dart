class OrderContent {
  String id;
  Order order;
  String userName;
  String deliveryUserId;
  String paymentType;
  String codAmount;
  String amountSubmitted;
  String orderNumber;
  String orderStatus;
  String orderedDate;
  String deliveryOrderStatus;
  dynamic orderAssignedTime;
  dynamic orderDeliveredTime;
  dynamic amountCollectedBy;

  OrderContent({
    required this.id,
    required this.order,
    required this.userName,
    required this.orderedDate,
    required this.deliveryUserId,
    required this.paymentType,
    required this.codAmount,
    required this.amountSubmitted,
    required this.orderNumber,
    required this.deliveryOrderStatus,
    required this.orderStatus,
    required this.orderAssignedTime,
    required this.orderDeliveredTime,
    required this.amountCollectedBy,
  });

  factory OrderContent.fromJson(Map<String, dynamic> json) {
    return OrderContent(
      id: json['id'].toString(),
      order: json['order'] != null
          ? Order.fromJson(json['order'])
          : Order.nullOrder,
      userName: json['userName'].toString(),
      orderedDate: json['orderedDate'].toString(),
      deliveryUserId: json['deliveryUserId'].toString(),
      paymentType: json['paymentType'].toString(),
      codAmount: json['codAmount'].toString(),
      amountSubmitted: json['amountSubmitted'].toString(),
      orderNumber: json['orderNumber'].toString(),
      deliveryOrderStatus: json['deliveryOrderStatus'].toString(),
      orderStatus: json['orderStatus'].toString(),
      orderAssignedTime: json['orderAssignedTime'].toString(),
      orderDeliveredTime: json['orderDeliveredTime'].toString(),
      amountCollectedBy: json['amountCollectedBy'].toString(),
    );
  }
  static OrderContent nullData = OrderContent(
    id: '0',
    order: Order.nullOrder,
    userName: 'NA',
    orderedDate: 'NA',
    deliveryUserId: '0',
    paymentType: 'NA',
    codAmount: '0',
    amountSubmitted: 'false',
    orderNumber: 'NA',
    deliveryOrderStatus: 'NA',
    orderStatus: 'NA',
    orderAssignedTime: null,
    orderDeliveredTime: null,
    amountCollectedBy: null,
  );
}

class Order {
  String id;
  String createdBy;
  String updatedBy;
  String noOfItemTypes;
  String paymentType;
  String totalOrderAmount;
  String orderStatus;
  String orderNumber;
  dynamic declineComment;
  List<dynamic> createdAt;
  String customerBillingAddressId;
  String customerShippingAddressId;
  String invoiceNumber;
  BillingAddress shippingAddress;
  BillingAddress billingAddress;
  BillingAddress customerDetails;
  dynamic orderDetailList;

  Order({
    required this.id,
    required this.createdBy,
    required this.updatedBy,
    required this.noOfItemTypes,
    required this.paymentType,
    required this.totalOrderAmount,
    required this.orderStatus,
    required this.orderNumber,
    required this.declineComment,
    required this.createdAt,
    required this.customerBillingAddressId,
    required this.customerShippingAddressId,
    required this.invoiceNumber,
    required this.shippingAddress,
    required this.billingAddress,
    required this.customerDetails,
    required this.orderDetailList,
  });
  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'].toString(),
      createdBy: json['createdBy'].toString(),
      updatedBy: json['updatedBy'].toString(),
      noOfItemTypes: json['noOfItemTypes'].toString(),
      paymentType: json['paymentType'].toString(),
      totalOrderAmount: json['totalOrderAmount'].toString(),
      orderStatus: json['orderStatus'].toString(),
      orderNumber: json['orderNumber'].toString(),
      declineComment: json['declineComment'].toString(),
      createdAt: json['createdAt'],
      customerBillingAddressId: json['customerBillingAddressId'].toString(),
      customerShippingAddressId: json['customerShippingAddressId'].toString(),
      invoiceNumber: json['invoiceNumber'].toString(),
      shippingAddress: BillingAddress.fromJson(json['shippingAddress']),
      billingAddress: BillingAddress.fromJson(json['billingAddress']),
      customerDetails: BillingAddress.fromJson(json['customerDetails']),
      orderDetailList: json['orderDetailList'],
    );
  }
  static Order nullOrder = Order(
    id: '0',
    createdBy: 'NA',
    updatedBy: 'NA',
    noOfItemTypes: '0',
    paymentType: 'NA',
    totalOrderAmount: '0',
    orderStatus: 'NA',
    orderNumber: 'NA',
    declineComment: 'NA',
    createdAt: [],
    customerBillingAddressId: '0',
    customerShippingAddressId: '0',
    invoiceNumber: 'NA',
    shippingAddress: BillingAddress.billingAddress,
    billingAddress: BillingAddress.billingAddress,
    customerDetails: BillingAddress.billingAddress,
    orderDetailList: [],
  );
}

class BillingAddress {
  int id;
  String label;
  String? customerName;
  String? phoneNumber;
  String? addressLine1;
  String? addressLine2;
  String? city;
  String? state;
  String country;
  String? zipCode;
  String? customerEmail;
  bool? self;

  BillingAddress({
    required this.id,
    required this.label,
    required this.customerName,
    required this.phoneNumber,
    required this.addressLine1,
    required this.addressLine2,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    this.customerEmail,
    this.self,
  });
  factory BillingAddress.fromJson(Map<String, dynamic> json) {
    return BillingAddress(
      id: json['id'],
      label: json['label'],
      customerName: json['customerName'],
      phoneNumber: json['phoneNumber'],
      addressLine1: json['addressLine1'],
      addressLine2: json['addressLine2'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
    );
  }
  static BillingAddress billingAddress = BillingAddress(
    id: 0,
    label: 'NA',
    customerName: 'NA',
    phoneNumber: 'NA',
    addressLine1: 'NA',
    addressLine2: 'NA',
    city: 'NA',
    state: 'NA',
    country: 'NA',
    zipCode: 'NA',
  );
}
