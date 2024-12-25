import 'package:flutter/material.dart';
import '../../model/channel_preset.dart';
import '../core/themes/constants.dart';

import '../core/localization/applocalization.dart';
import '../core/themes/decorations.dart';
import '../core/ui/error_indicator.dart';
import '../core/ui/mix_slider.dart';
import '../core/ui/pan_slider.dart';
import 'channel_config_viewmodel.dart';

class ChannelConfigScreen extends StatelessWidget {
  const ChannelConfigScreen({
    super.key,
    required this.viewModel,
  });

  final ChannelConfigViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListenableBuilder(
        listenable: viewModel.load,
        builder: (context, child) {
          if (viewModel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.load.error) {
            return Center(
              child: ErrorIndicator(
                title: AppLocalization.of(context).errorWhileLoadingKitPreset, 
                label: AppLocalization.of(context).tryAgain, 
                onPressed: (){}
                ),
            );
          }
          if (viewModel.channel == null) {
            return Container();
          }
          return _buildControlsBox(context);
        }
      )
    );
  }

  Widget _buildControlsBox(BuildContext context) {
    return Align(
          alignment: Alignment.centerLeft,
          child: Column (
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Expanded(
                flex: 20,
                child: Text(viewModel.channel!.name)
                ),
              Expanded(
                flex: 80,
                child: _buildChannelConfig(context)
              )
            ],
          )
        );
  }

  Widget _buildChannelConfig(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(Dimentions.smallPadding),
      child: Container(
        decoration: themeRoundedBox,
        padding: EdgeInsets.all(Dimentions.bigPadding),
        width: MediaQuery.of(context).size.width,
        child: Row(
          children: [
            _buildChannelControls(context),
            _buildInstruments(context),
          ],
          ),
        ),
    );  
  }

  Widget _buildChannelControls(BuildContext context) {
    var channel = viewModel.channel!;
    return SizedBox(
      width: Dimentions.channelControlWidth,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton.outlined(
              icon: const Icon(Icons.graphic_eq), 
                onPressed: () { },
            ),
            Expanded(
              //flex: 20,
              child: _buildPanSlider(channel.pan),
            ),
            _buildLevelSlider(channel.level),
            Text(channel.name,
                style: Theme.of(context).textTheme.labelLarge)
          ],
        ),
    );
  }


  Widget _buildInstruments(BuildContext context) {
    var instrs = viewModel.channel!.instruments;
    if (instrs == null) return Container();
    final instrControls = List<Widget>.generate(
      instrs.length,
      (int idx) => _buildInstrumentControls(context, instrs[idx]),
      growable: false
    );
    return Row(children: instrControls);
  }

  Widget _buildInstrumentControls(BuildContext context, Instrument instr) {
    return Row(
        children: [
          SizedBox(
            width: Dimentions.channelControlWidth,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
              children: [
              Expanded(
                flex: 12,
                child: IconButton.outlined(
                  iconSize: 24,
                  icon: const Icon(
                    Icons.tune
                  ),
                  onPressed: () {},
                ),
              ),
              Expanded(
                flex: 98,
                child: RotatedBox(
                  quarterTurns: 3,
                  child: Text(
                    instr.name,
                    textAlign: TextAlign.center,
                    )
                ),
              ),
              ],
            ),
          ),
          _buildLayers(context, instr.layers)
        ]
    );
  }

  Widget _buildLayers(BuildContext context, List<Layer>? layers) {
    if (layers == null) return Container();
    final layersCtrls = List<Widget>.generate(
      layers.length,
      (int idx) => _buildLayerControls(context, layers[idx]),
      growable: false
    );
    return Row(children: layersCtrls);
  }

  Widget _buildLayerControls(BuildContext context, layer) {
    return SizedBox(
      width: Dimentions.channelControlWidth,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 12,
              child: IconButton.outlined(
                iconSize: 24,
                icon: const Icon(
                  Icons.graphic_eq
                ), 
                onPressed: () { 
                 },
              ),
            ),
            Expanded(
              flex: 20,
              child: _buildPanSlider(layer.pan),
            ),
            Expanded(
              flex: 70,
              child: _buildLevelSlider(layer.level),
            ),
            Expanded(
              flex: 5,
              child: Text(layer.name)
            ),
          ],
        ),
    );
  }

  Widget _buildLevelSlider(double? level) {
    if (level == null) return Container();
    return SizedBox(
      height: Dimentions.channelControlHeight,
      child: Padding(
        padding: const EdgeInsets.all(Dimentions.sliderPadding),
        child: MixSlider(
          min: 0.0,
          max: 110,
          values: [level * 100],
        ),
      ),
    );
  }

  Widget _buildPanSlider(double? pan) {
    if (pan == null) return Container();
    return SizedBox(
      height: 240,
      child: Padding(
        padding: const EdgeInsets.all(Dimentions.borderRadius),
        child: PanSlider(
          min: -100.0,
          max: 100,
          values: [pan * 100]
        ),
        ),
    );
  }


}