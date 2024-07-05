class CarService {
  static final CarService _instance = CarService._();
  CarService._();
  static CarService getInstance() {
    return _instance;
  }
}
