import 'package:audio_session/audio_session.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:trading_app/common/utils/extensions/build_context_extension.dart';
import 'package:trading_app/models/ayah.dart';
import 'package:rxdart/rxdart.dart';

import '../../../widgets/multi_language_text.dart';
import '../../../widgets/seekbar.dart';
import 'button_player.dart';

class AyahDetailItem extends StatefulWidget {
  const AyahDetailItem({
    Key? key,
    required this.ayah,
  }) : super(key: key);
  final Ayah? ayah;

  @override
  State<AyahDetailItem> createState() => _AyahDetailItemState();
}

class _AyahDetailItemState extends State<AyahDetailItem>
    with WidgetsBindingObserver {
  final _equalizer = AndroidEqualizer();
  final _loudnessEnhancer = AndroidLoudnessEnhancer();
  late final AudioPlayer _player = AudioPlayer(
    audioPipeline: AudioPipeline(
      androidAudioEffects: [
        _loudnessEnhancer,
        _equalizer,
      ],
    ),
  );

  @override
  void initState() {
    super.initState();
    ambiguate(WidgetsBinding.instance)!.addObserver(this);
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.black,
    ));
    _init();
  }

  Future<void> _init() async {
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    try {
      await _player
          .setAudioSource(AudioSource.uri(Uri.parse(widget.ayah?.audio ?? "")));
    } catch (e) {
      print("Error loading audio source: $e");
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _player.stop();
    }
  }

  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
          _player.positionStream,
          _player.bufferedPositionStream,
          _player.durationStream,
          (position, bufferedPosition, duration) => PositionData(
              position, bufferedPosition, duration ?? Duration.zero));

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${widget.ayah?.number.toString() ?? ""}.",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(width: 5),
                MultiLanguageText(widget.ayah?.title,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium
                        ?.copyWith(fontSize: 18, fontWeight: FontWeight.bold)),
              ],
            ),
            if (widget.ayah?.audio != null)
              Container(
                margin: const EdgeInsets.symmetric(vertical: 10),
                padding: const EdgeInsets.symmetric(vertical: 10),
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                child: Row(
                  children: [
                    const SizedBox(width: 5),
                    ControlButtons(_player),
                    Expanded(
                      child: StreamBuilder<PositionData>(
                        stream: _positionDataStream,
                        builder: (context, snapshot) {
                          final positionData = snapshot.data;
                          return SeekBar(
                            duration: positionData?.duration ?? Duration.zero,
                            position: positionData?.position ?? Duration.zero,
                            bufferedPosition:
                                positionData?.bufferedPosition ?? Duration.zero,
                            onChangeEnd: _player.seek,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 5),
            MultiLanguageText(widget.ayah?.content,
                space: 15,
                supportRTL: true,
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}
