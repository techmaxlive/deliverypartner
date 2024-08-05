import 'package:deliverypartner/config/const_string.dart';
import 'package:deliverypartner/config/const_wid.dart';
import 'package:deliverypartner/config/storage_utils.dart';
import 'package:deliverypartner/models/order_models.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeController extends GetxController {
  final client = Dio();
  var loadingRefresh = false.obs;
  late LatLng _gpsactual;
  var zoomlvl = 18.0;
  LatLng _initialposition = const LatLng(-12.122711, -77.027475);
  var activegps = true.obs;
  var locationController = TextEditingController();
  late GoogleMapController _mapController;

  LatLng get gpsPosition => _gpsactual;

  LatLng get initialPos => _initialposition;
  // final Set<Marker> _markers = Set();

  // Set<Marker> get markers => _markers;

  GoogleMapController get mapController => _mapController;
  var screen = "No Order".obs;
  var listOrder = <OrderContent>[].obs;

  @override
  void onInit() {
    super.onInit();
    mapInit();
  }

  Future mapInit() async {
    String orderId = await MySharedPreferences().getOrderIdkey();
    if (screen.value == 'Map Screen') {
      getUserLocation();
    } else if (orderId != 'NA') {
      screen.value = 'List Order';
      await fetchOrdersLi(orderId);
    }
  }

  void getMoveCamera() async {
    List<Placemark> placemark = await placemarkFromCoordinates(
      _initialposition.latitude,
      _initialposition.longitude,
    );
    locationController.text = placemark[0].name!;
  }

  void getUserLocation() async {
    if (!(await Geolocator.isLocationServiceEnabled())) {
      activegps.value = false;
    } else {
      activegps.value = true;
      LocationPermission permission;
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return Future.error('Location permissions are denied');
        }
      }
      if (permission == LocationPermission.deniedForever) {
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      }

      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemark =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      _initialposition = LatLng(position.latitude, position.longitude);
      locationController.text = placemark[0].name!;
      // _addMarker(_initialposition, placemark[0].name!);
      _mapController.moveCamera(
        CameraUpdate.newLatLng(_initialposition),
      );
    }
  }

  void onCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  void onCameraMove(CameraPosition position) async {
    position = CameraPosition(
      target: initialPos,
      zoom: zoomlvl,
    );
    _initialposition = position.target;
  }

  //more details
  var moreDet = false.obs;
  var selectReason = ''.obs;

  showAlertDialog(BuildContext context) {
    AlertDialog alert = AlertDialog(
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/success_1.png',
            height: 50,
            width: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15),
            child: Text(
              "YAY!",
              style: styleC(
                ColorTheme.black,
                16,
                FontWeight.w600,
              ),
            ),
          ),
          Text(
            "Order Delivered Successful.",
            style: styleC(
              ColorTheme.black,
              16,
              FontWeight.w600,
            ),
          ),
          InkWell(
            onTap: () async {
              screen.value = 'List Order';
              await mapInit();
              Get.back();
            },
            child: Container(
              padding: const EdgeInsets.all(7),
              margin: const EdgeInsets.only(
                top: 20,
                left: 50,
                right: 50,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                border: Border.all(
                  width: 1,
                  color: ColorTheme.primary,
                ),
              ),
              child: Center(
                child: Text(
                  "Done",
                  style: styleC(
                    ColorTheme.primary,
                    16,
                    FontWeight.w600,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  Future<List<OrderContent>> fetchMapOrders(BuildContext context) async {
    String token = await MySharedPreferences().getTokenkey();
    listOrder.value = [];
    if (token == 'NA') {
      FlutterToastr.show("Invalid Token", context);
      return [];
    } else {
      client.options.headers = {
        'accept': '*/*',
        'Authorization': token,
      };
      final response = await client.get(ConstString.orderMaping);
      if (response.statusCode == 200) {
        FlutterToastr.show(response.data['message'].toString(), context);
        if (response.data['content'] != null) {
          listOrder.add(OrderContent.fromJson(response.data['content']));
        }

        return listOrder;
      } else {
        throw [];
      }
    }
  }

  Future<dynamic> orderAcceptOrDenied(
      BuildContext context, int orderId, bool isAccept) async {
    String token = await MySharedPreferences().getTokenkey();
    if (token == 'NA') {
      FlutterToastr.show("Invalid Token", context);
      return null;
    } else {
      client.options.headers = {
        'accept': '*/*',
        'Authorization': token,
      };
      final response =
          await client.put('${ConstString.orderConfirm}$isAccept/$orderId');
      if (response.statusCode == 200) {
        return response.data;
      } else {
        return null;
      }
    }
  }

  Future<List<OrderContent>> fetchOrdersLi(
    String orderId,
  ) async {
    String token = await MySharedPreferences().getTokenkey();
    listOrder.value = [];
    if (token == 'NA') {
      return [];
    } else {
      client.options.headers = {
        'accept': '*/*',
        'Authorization': token,
      };
      print(ConstString.orderList + orderId);
      final response = await client.get(ConstString.orderList + orderId);
      if (response.statusCode == 200) {
        if (response.data['content'] != null) {
          listOrder.add(OrderContent.fromJson(response.data['content']));
        }

        return listOrder;
      } else {
        throw [];
      }
    }
  }
}
