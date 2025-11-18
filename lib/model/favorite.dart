class Favorite {
  List<int> _selectedFavorites = [];
  List<int> get selectedFavorites => _selectedFavorites;
  void addFavorite(int foodId) {
    _selectedFavorites.add(foodId);
  }

  void removeFavorite(int foodId) {
    _selectedFavorites.remove(foodId);
  }
}
