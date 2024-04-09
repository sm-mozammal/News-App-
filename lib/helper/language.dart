import 'package:get/get.dart';

final class LocalString extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        // English Language
        'en_US': {
          "welcome": "Welcome!",
          "Language Setting": "Language Setting",
          "body":
              "In today's globalized world, mobile applications must be accessible to users from diverse linguistic backgrounds."
        },
        // Bangla Language
        'bn_BD': {
          "welcome": "স্বাগত!",
          "Language Setting": "ভাষা সেটিং",
          "body":
              "আজকের বিশ্বায়িত বিশ্বে, বিভিন্ন ভাষাগত পটভূমির ব্যবহারকারীদের কাছে মোবাইল অ্যাপ্লিকেশনগুলি অবশ্যই অ্যাক্সেসযোগ্য হতে হবে৷"
        },
        // Spain Language
        'es_ES': {
          "welcome": "স্বাগত!",
          "Language Setting": "Configuración de idioma",
          "body":
              "En el mundo globalizado de hoy, las aplicaciones móviles deben ser accesibles para usuarios de diversos orígenes lingüísticos."
        }
      };
}
