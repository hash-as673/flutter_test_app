// MockAPIService simulates a network API call for authentication.
class MockAPIService {
  // A map to store mock user credentials.
  static const Map<String, String> _mockUsers = {
    'test@example.com': 'password123',
    'user@flutter.dev': 'flutter',
  };

  // Simulates a login request.
  // It returns true for valid credentials after a short delay, otherwise false.
  Future<bool> login(String email, String password) async {
    // Simulate a 2-second network delay.
    await Future.delayed(const Duration(seconds: 2));

    // Check if the provided credentials match our mock users.
    if (_mockUsers.containsKey(email) && _mockUsers[email] == password) {
      return true; // Login successful
    } else {
      return false; // Login failed
    }
  }
}
