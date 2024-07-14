import 'package:news_app/base_app/injection/injection.dart';
import 'package:news_app/features_core/background_worker_core/background_worker_core.dart';
import 'package:news_app/features_core/local_storage_core/shared_preferences/shared_preferences.dart';
import 'package:news_app/features_core/network_core/http/http.dart';
import 'package:news_app/features_core/stream_service_core/stream_service_core.dart';

final List<RegisterInjectionClient> appInjectionFeatures = [
  ..._coreFeatures,
  ..._features,
];

final List<RegisterInjectionClient> _coreFeatures = <RegisterInjectionClient>[
  ArticlesStreamDI(),
  BackgroundWorkerDI(),
  HttpDI(),
  SharedPreferencesDI(),
];

final List<RegisterInjectionClient> _features = <RegisterInjectionClient>[

];