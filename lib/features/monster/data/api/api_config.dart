class ApiConfig {
  static const String baseUrl = 'https://db.ygoprodeck.com/api/v7';
  
  static String getMonstersByArchetype(String archetype) {
    return '$baseUrl/cardinfo.php?archetype=$archetype';
  }

  static String getMonsterDetails(String id) {
    return '$baseUrl/cardinfo.php?id=$id';
  }
}
