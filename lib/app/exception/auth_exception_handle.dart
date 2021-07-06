import 'package:socialgram/app/constants.dart';

class AuthExceptionHandler {
  static handleException(e) {
    switch (e.code) {
      case Constants.INVALID_EMAIL:
        return 'O endereço de e-mail está formatado incorretamente!';
      case Constants.TOO_MANY_REQUESTS:
        return 'O acesso a esta conta foi temporariamente desativado devido a muitas tentativas de login malsucedidas. Você pode restaurá-lo imediatamente redefinindo sua senha ou pode tentar novamente mais tarde!';
      case Constants.WRONG_PASSWORD:
        return 'A senha é inválida ou o usuário não possui uma senha!';
      case Constants.USER_NOT_FOUND:
        return 'Usuário não encontrado! Não há registro de usuário correspondente a este identificador. O usuário pode ter sido excluído';
      case Constants.ERROR_USER_DISABLED:
        return 'O usuário com este e-mail foi desativado';
      case Constants.ERROR_OPERATION_NOT_ALLOWED:
        return 'O login com e-mail e senha não está ativado';
      case Constants.ERROR_EMAIL_ALREADY_IN_USE:
        return 'O email já foi cadastrado. Faça o login ou redefina sua senha';
      default:
        return 'Erro desconhecido! Por favor tente novamente mais tarde!';
    }
  }
}
