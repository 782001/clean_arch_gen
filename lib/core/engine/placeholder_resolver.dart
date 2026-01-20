import 'dart:io';
import '../../schema/feature_schema.dart';

class PlaceholderResolver {
  String _pascal(String v) =>
      v.split('_').map((e) => e[0].toUpperCase() + e.substring(1)).join();

  String buildBodyMap(FeatureSchema s) => s.request.body.entries
      .map((e) => "'${e.key}': parameters.${e.key}")
      .join(',\n        ');
  String buildQueryParameters(FeatureSchema s) => s.request.query.entries
      .map((e) => "'${e.key}': parameters.${e.key}")
      .join(',\n        ');

  String resolve(String template, FeatureSchema s) {
    var t = File('lib/core/templates/$template').readAsStringSync();

    t = t.replaceAll('{{Feature}}', _pascal(s.feature));
    t = t.replaceAll('{{feature}}', s.feature);
    t = t.replaceAll('{{entity}}', s.response.entity);
    t = t
        .replaceAll('{{endpoint}}', s.endpoint.url)
        .replaceAll('{{dataBodyMap}}', buildBodyMap(s))
        .replaceAll('{{queryParameters}}', buildQueryParameters(s));
    t = t.replaceAll('{{method}}', s.endpoint.method);
    t = t
        .replaceAll('{{parameters}}', buildParameters(s))
        .replaceAll('{{constructor}}', buildConstructor(s))
        .replaceAll('{{props}}', buildProps(s));
    final fields = s.response.fields.entries.map((e) {
      return 'final ${e.value}? ${e.key};';
    }).join('\n  ');

    return t.replaceAll('{{fields}}', fields);
  }

  String fileName(String tpl, FeatureSchema s) =>
      '${s.feature}_${tpl.replaceAll('.tpl', '')}.dart';

  String buildParameters(FeatureSchema s) =>
      _allParams(s).map((e) => 'final ${e.value} ${e.key};').join('\n  ');

  String buildConstructor(FeatureSchema s) =>
      _allParams(s).map((e) => 'required this.${e.key},').join('\n    ');

  String buildProps(FeatureSchema s) =>
      _allParams(s).map((e) => e.key).join(', ');
  Iterable<MapEntry<String, String>> _allParams(FeatureSchema s) => [
        ...s.request.pathParams.entries,
        ...s.request.body.entries,
        ...s.request.query.entries,
      ];
}
