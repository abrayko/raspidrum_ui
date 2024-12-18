
import 'dart:convert';

import 'package:raspidrum_ui/src/model/channel_preset.dart';
import 'package:raspidrum_ui/src/utils/result.dart';

final _presetJson = '''
{
  "key": "123ABC",
  "name": "Rusty Full",
  "description": "Full controls",
  "channels": [
    {
      "key": "0",
      "name": "Kit",
      "type": "sampler",
      "level": 0.97,
      "pan": -0.05,
      "fxs": [
        {
          "key": "para_eq",
          "name": "Parametric Eq",
          "order": 0,
          "params": [
            {
              "key": "freq",
              "name": "Freq",
              "order": 0,
              "type": "range",
              "min": 20,
              "max": 500,
              "value": 63
            },
            {
              "key": "q",
              "name": "Low Q",
              "order": 1,
              "type": "range",
              "min": 0.1,
              "max": 10,
              "value": 1.3
            },
            {
              "key": "gain",
              "name": "Gain",
              "order": 2,
              "type": "range",
              "min": -18,
              "max": 6,
              "value": 2.7
            }
          ]
        },
        {
          "key": "reverb",
          "name": "Reverb",
          "order": 1,
          "params": [
            {
              "key": "mix",
              "name": "Mix",
              "order": 0,
              "type": "range",
              "min": 0,
              "max": 1,
              "value": 0.7
            },
            {
              "key": "size",
              "name": "Size",
              "order": 1,
              "type": "range",
              "min": 0,
              "max": 1,
              "value": 0.47
            },
            {
              "key": "damp",
              "name": "Damping",
              "order": 1,
              "type": "range",
              "min": 0,
              "max": 1,
              "value": 0.52
            }
          ]
        }
      ]
    },
    {
      "key": "1",
      "name": "Snare",
      "type": "instrument",
      "level": 0.97,
      "pan": -0.05,
      "instruments": [
        {
          "key": "snare",
          "name": "snare",
          "tunes": [
            {
              "key": "tune",
              "name": "tune",
              "order": 0,
              "params": [
                {
                  "key": "pitch",
                  "name": "pitch",
                  "order": 0,
                  "type": "range",
                  "min": -100,
                  "max": 100,
                  "value": -10
                }
              ]
            }
          ],
          "layers": [
            {
              "key": "top",
              "name": "Top",
              "level": 0.64,
              "pan": -0.2,
              "fxs": [
                {
                  "key": "reverb",
                  "name": "Reverb",
                  "order": 1,
                  "params": [
                    {
                      "key": "mix",
                      "name": "Mix",
                      "order": 0,
                      "type": "range",
                      "min": 0,
                      "max": 1,
                      "value": 0.7
                    },
                    {
                      "key": "size",
                      "name": "Size",
                      "order": 1,
                      "type": "range",
                      "min": 0,
                      "max": 1,
                      "value": 0.47
                    },
                    {
                      "key": "damp",
                      "name": "Dampping",
                      "order": 1,
                      "type": "range",
                      "min": 0,
                      "max": 1,
                      "value": 0.52
                    }
                  ]
                }
              ]
            },
            {
              "key": "bottom",
              "name": "Bottom",
              "level": 0.75,
              "pan": -0.2
            },
            {
              "key": "oh",
              "name": "OH",
              "level": 0.68,
              "pan": -0.2
            }
          ]
        }
      ]
    },
    {
      "key": "2",
      "name": "Kick",
      "type": "instrument",
      "level": 0.89,
      "pan": 0,
      "instruments": [
        {
          "key": "kick",
          "name": "Kick",
          "layers": [
            {
              "key": "main",
              "name": "Kick"
            }
          ]
        }
      ]
    },
    {
      "key": "3",
      "name": "Hi-Hat",
      "type": "instrument",
      "level": 0.96,
      "pan": 0.47,
      "instruments": [
        {
          "key": "hh",
          "name": "Hi-Hat",
          "layers": [
            {
              "key": "hh",
              "name": "HH"
            }
          ]
        }
      ]
    },
    {
      "key": "4",
      "name": "Toms",
      "type": "instrument",
      "level": 0.85,
      "pan": 0.1,
      "instruments": [
        {
          "key": "tom1",
          "name": "Tom 1",
          "layers": [
            {
              "key": "tom1",
              "name": "Tom 1"
            }
          ]
        },
        {
          "key": "tom2",
          "name": "Tom 2",
          "layers": [
            {
              "key": "tom2",
              "name": "Tom 2"
            }
          ]
        },
        {
          "key": "tom3",
          "name": "Floor Tom",
          "layers": [
            {
              "key": "tom3",
              "name": "Tom 3"
            }
          ]
        }
      ]
    },
    {
      "key": "5",
      "name": "Crash",
      "type": "instrument",
      "level": 0.78,
      "pan": 0.29,
      "instruments": [
        {
          "key": "crash1",
          "name": "Crash",
          "layers": [
            {
              "key": "crash1",
              "name": "Crash"
            }
          ]
        }
      ]
    },
    {
      "key": "6",
      "name": "Ride",
      "type": "instrument",
      "level": 0.83,
      "pan": -0.38,
      "instruments": [
        {
          "key": "ride",
          "name": "Ride",
          "layers": [
            {
              "key": "ride",
              "name": "Ride"
            }
          ]
        }
      ]
    }
  ]
}
''';


final preset = Preset.fromJson(jsonDecode(_presetJson));


class KitPresetRepository {

  Future<Result<Preset>> getPreset() async {
    //await Future.delayed(Duration(seconds: 2));
    return Result.ok(
      preset
    );
    //return Result.error(
    //  HttpException('''Can't get preset''')
    //);
  }

}