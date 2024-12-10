import 'package:flutter/widgets.dart';
import 'package:logging/logging.dart';
import 'package:raspidrum_ui/src/data/repositories/kit_preset.dart';
import 'package:raspidrum_ui/src/model/channel_preset.dart';
import 'package:raspidrum_ui/src/utils/result.dart';

import '../../utils/command.dart';

class KitViewModel extends ChangeNotifier {

  KitViewModel({
    required KitPresetRepository kitPresetRepository,
  }):
  _kitPresetRepository = kitPresetRepository {
    load = Command0(_load)..execute();
  }

  final KitPresetRepository _kitPresetRepository;
  final _log = Logger('KitViewModel');

  late Command0 load;

  Preset? _preset;

  Future<Result> _load() async {
    try {
      final kitPresetResult = await _kitPresetRepository.getPreset();
      switch (kitPresetResult) {
        case Ok<Preset>():
          _preset = kitPresetResult.value;
          _log.fine('Preset loaded');
        case Error<Preset>():
          _log.warning('Failed to load preset', kitPresetResult.error);
      }
      return kitPresetResult;
    } finally {
      notifyListeners();
    }
  }
}