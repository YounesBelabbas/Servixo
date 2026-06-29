import 'package:geolocator/geolocator.dart';

class LocationService {
  // جلب الموقع الحالي للمستخدم
  Future<Position?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // التأكد من أن خدمة الموقع مفعلة في الهاتف
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return null;
    }

    // التحقق من صلاحيات الوصول للموقع
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }
    
    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    // جلب الإحداثيات الحالية بدقة متوسطة (لتوفير البطارية والسرعة)
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.medium,
    );
  }
}