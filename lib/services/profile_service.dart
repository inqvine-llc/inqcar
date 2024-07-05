class ProfileService {
  static final ProfileService _instance = ProfileService._();
  ProfileService._();
  static ProfileService getInstance() {
    return _instance;
  }
}
