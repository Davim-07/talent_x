/// Classe de base pour toutes les exceptions de l'application TalentX
abstract class TalentXException implements Exception {
  final String message;
  final String? code;

  const TalentXException(this.message, {this.code});

  @override
  String toString() => 'TalentXException: $message (code: $code)';
}

/// Erreurs liées à l'authentification et aux rôles
class AuthException extends TalentXException {
  const AuthException(super.message, {super.code});
}

/// Erreurs liées aux règles métier (Votes, Inscriptions)
class BusinessRuleException extends TalentXException {
  const BusinessRuleException(super.message, {super.code});
}

/// Erreurs de réseau ou Firestore
class NetworkException extends TalentXException {
  const NetworkException(super.message, {super.code});
}