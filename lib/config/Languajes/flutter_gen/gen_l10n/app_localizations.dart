import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;
import 'package:job_match_app/config/Languajes/flutter_gen/gen_l10n/app_localizations_en.dart';
import 'package:job_match_app/config/Languajes/flutter_gen/gen_l10n/app_localizations_es.dart';

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'gen_l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es')
  ];

  /// No description provided for @welcome.
  ///
  /// In es, this message translates to:
  /// **'Hello'**
  String get welcome;

  /// No description provided for @user.
  ///
  /// In es, this message translates to:
  /// **'User'**
  String get user;

  /// No description provided for @company.
  ///
  /// In es, this message translates to:
  /// **'Company'**
  String get company;

  /// No description provided for @nombre.
  ///
  /// In es, this message translates to:
  /// **'Name'**
  String get nombre;

  /// No description provided for @fechaDeNacimiento.
  ///
  /// In es, this message translates to:
  /// **'Birthdate'**
  String get fechaDeNacimiento;

  /// No description provided for @direccion.
  ///
  /// In es, this message translates to:
  /// **'Address'**
  String get direccion;

  /// No description provided for @telefono.
  ///
  /// In es, this message translates to:
  /// **'Phone'**
  String get telefono;

  /// No description provided for @correoElectronico.
  ///
  /// In es, this message translates to:
  /// **'Email'**
  String get correoElectronico;

  /// No description provided for @ocupacion.
  ///
  /// In es, this message translates to:
  /// **'Occupation'**
  String get ocupacion;

  /// No description provided for @lugarDeTrabajo.
  ///
  /// In es, this message translates to:
  /// **'Place of work'**
  String get lugarDeTrabajo;

  /// No description provided for @lugarDeEstudio.
  ///
  /// In es, this message translates to:
  /// **'Place of study'**
  String get lugarDeEstudio;

  /// No description provided for @carrera.
  ///
  /// In es, this message translates to:
  /// **'Career'**
  String get carrera;

  /// No description provided for @certificados.
  ///
  /// In es, this message translates to:
  /// **'Certificates'**
  String get certificados;

  /// No description provided for @habilidades.
  ///
  /// In es, this message translates to:
  /// **'Skills'**
  String get habilidades;

  /// No description provided for @idiomas.
  ///
  /// In es, this message translates to:
  /// **'Languages'**
  String get idiomas;

  /// No description provided for @ubicacion.
  ///
  /// In es, this message translates to:
  /// **'Location'**
  String get ubicacion;

  /// No description provided for @editarPerfil.
  ///
  /// In es, this message translates to:
  /// **'Edit Profile'**
  String get editarPerfil;

  /// No description provided for @seleccionaUnMetodo.
  ///
  /// In es, this message translates to:
  /// **'Select a method'**
  String get seleccionaUnMetodo;

  /// No description provided for @paraCompletarTuInformacion.
  ///
  /// In es, this message translates to:
  /// **'to fill your information'**
  String get paraCompletarTuInformacion;

  /// No description provided for @proximamente.
  ///
  /// In es, this message translates to:
  /// **'Coming Soon...'**
  String get proximamente;

  /// No description provided for @porReconocimientoDeIA.
  ///
  /// In es, this message translates to:
  /// **'By AI recognition'**
  String get porReconocimientoDeIA;

  /// No description provided for @completarEscribiendo.
  ///
  /// In es, this message translates to:
  /// **'Fill by typing'**
  String get completarEscribiendo;

  /// No description provided for @bienvenido.
  ///
  /// In es, this message translates to:
  /// **'Welcome'**
  String get bienvenido;

  /// No description provided for @informacionPersonal.
  ///
  /// In es, this message translates to:
  /// **'Personal Information'**
  String get informacionPersonal;

  /// No description provided for @deslizaParaContinuar.
  ///
  /// In es, this message translates to:
  /// **'Swipe to continue'**
  String get deslizaParaContinuar;

  /// No description provided for @bienvenidoA.
  ///
  /// In es, this message translates to:
  /// **'Welcome to'**
  String get bienvenidoA;

  /// No description provided for @holaSoyJCYSomosAquiParaAyudarteAAlcanzarTusObjetivosYSuperarTusDesafiosEligeUnaDeLasDosOpciones.
  ///
  /// In es, this message translates to:
  /// **'\"Hello! I\'m JC and we\'re here to help you reach your goals and overcome your challenges. Please choose one of the two options.\"'**
  String
      get holaSoyJCYSomosAquiParaAyudarteAAlcanzarTusObjetivosYSuperarTusDesafiosEligeUnaDeLasDosOpciones;

  /// No description provided for @ingresaTuCorreoElectronico.
  ///
  /// In es, this message translates to:
  /// **'Enter your email'**
  String get ingresaTuCorreoElectronico;

  /// No description provided for @ingresaTuContrasena.
  ///
  /// In es, this message translates to:
  /// **'Enter your password'**
  String get ingresaTuContrasena;

  /// No description provided for @continuarConGoogle.
  ///
  /// In es, this message translates to:
  /// **'Continue with Google'**
  String get continuarConGoogle;

  /// No description provided for @noTienesUnaCuenta.
  ///
  /// In es, this message translates to:
  /// **'Don\'t have an account?'**
  String get noTienesUnaCuenta;

  /// No description provided for @paraEmpresas.
  ///
  /// In es, this message translates to:
  /// **'For companies'**
  String get paraEmpresas;

  /// No description provided for @o.
  ///
  /// In es, this message translates to:
  /// **'or'**
  String get o;

  /// No description provided for @olvidasteTuContrasena.
  ///
  /// In es, this message translates to:
  /// **'Forgot Password'**
  String get olvidasteTuContrasena;

  /// No description provided for @subiendoCV.
  ///
  /// In es, this message translates to:
  /// **'Uploading CV'**
  String get subiendoCV;

  /// No description provided for @inicio.
  ///
  /// In es, this message translates to:
  /// **'Home'**
  String get inicio;

  /// No description provided for @buscar.
  ///
  /// In es, this message translates to:
  /// **'Search'**
  String get buscar;

  /// No description provided for @paraTi.
  ///
  /// In es, this message translates to:
  /// **'For you'**
  String get paraTi;

  /// No description provided for @vistosRecientemente.
  ///
  /// In es, this message translates to:
  /// **'Recently viewed'**
  String get vistosRecientemente;

  /// No description provided for @misTrabajos.
  ///
  /// In es, this message translates to:
  /// **'My Jobs'**
  String get misTrabajos;

  /// No description provided for @trabajos.
  ///
  /// In es, this message translates to:
  /// **'Jobs'**
  String get trabajos;

  /// No description provided for @perfil.
  ///
  /// In es, this message translates to:
  /// **'Profile'**
  String get perfil;

  /// No description provided for @todosLosDerechosReservadosAJobMatch2024.
  ///
  /// In es, this message translates to:
  /// **'\"All the rights reserved to JobMatch 2024.\"'**
  String get todosLosDerechosReservadosAJobMatch2024;

  /// No description provided for @asistenciaAlCliente.
  ///
  /// In es, this message translates to:
  /// **'Client Assitance'**
  String get asistenciaAlCliente;

  /// No description provided for @ajuste.
  ///
  /// In es, this message translates to:
  /// **'Setting'**
  String get ajuste;

  /// No description provided for @agregarFotos.
  ///
  /// In es, this message translates to:
  /// **'Add Photos'**
  String get agregarFotos;

  /// No description provided for @aprendizaje.
  ///
  /// In es, this message translates to:
  /// **'Learning'**
  String get aprendizaje;

  /// No description provided for @emprendedorDelAno.
  ///
  /// In es, this message translates to:
  /// **'Entrepreneur of the year'**
  String get emprendedorDelAno;

  /// No description provided for @ajustes.
  ///
  /// In es, this message translates to:
  /// **'Settings'**
  String get ajustes;

  /// No description provided for @cuenta.
  ///
  /// In es, this message translates to:
  /// **'Account'**
  String get cuenta;

  /// No description provided for @laMagiaDelEmparejamientoLaboral.
  ///
  /// In es, this message translates to:
  /// **'The magic of job matching'**
  String get laMagiaDelEmparejamientoLaboral;

  /// No description provided for @preferencias.
  ///
  /// In es, this message translates to:
  /// **'Preferences'**
  String get preferencias;

  /// No description provided for @idioma.
  ///
  /// In es, this message translates to:
  /// **'Languaje'**
  String get idioma;

  /// No description provided for @notificaciones.
  ///
  /// In es, this message translates to:
  /// **'Notifications'**
  String get notificaciones;

  /// No description provided for @modoOscuro.
  ///
  /// In es, this message translates to:
  /// **'DarkMode'**
  String get modoOscuro;

  /// No description provided for @privacidad.
  ///
  /// In es, this message translates to:
  /// **'Privacy'**
  String get privacidad;

  /// No description provided for @acercaDe.
  ///
  /// In es, this message translates to:
  /// **'About'**
  String get acercaDe;

  /// No description provided for @cerrarSesion.
  ///
  /// In es, this message translates to:
  /// **'Log Out'**
  String get cerrarSesion;

  /// No description provided for @fotos.
  ///
  /// In es, this message translates to:
  /// **'Photos'**
  String get fotos;

  /// No description provided for @acercaDeMi.
  ///
  /// In es, this message translates to:
  /// **'About me'**
  String get acercaDeMi;

  /// No description provided for @misIntereses.
  ///
  /// In es, this message translates to:
  /// **'My interests'**
  String get misIntereses;

  /// No description provided for @misDatos.
  ///
  /// In es, this message translates to:
  /// **'My Details'**
  String get misDatos;

  /// No description provided for @informacionAdicional.
  ///
  /// In es, this message translates to:
  /// **'Additional Information'**
  String get informacionAdicional;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) =>
      <String>['en', 'es'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
