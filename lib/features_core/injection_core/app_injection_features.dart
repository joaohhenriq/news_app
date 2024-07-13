import 'package:news_app/features_core/injection_core/injection_core.dart';
import 'package:news_app/features_core/local_storage_core/shared_preferences/shared_preferences.dart';
import 'package:news_app/features_core/network_core/http/http.dart';
import 'package:news_app/features_core/stream_service_core/stream_service_core.dart';

final List<RegisterInjectionClient> appInjectionFeatures = [
  ..._coreFeatures,
  ..._features,
];

final List<RegisterInjectionClient> _coreFeatures = <RegisterInjectionClient>[
  ArticlesStreamDI(),
  HttpDI(),
  SharedPreferencesDI(),
];

final List<RegisterInjectionClient> _features = <RegisterInjectionClient>[

];