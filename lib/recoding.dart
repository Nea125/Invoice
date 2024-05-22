import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_sound/flutter_sound.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class Recorder extends StatefulWidget {
  const Recorder({super.key});
  @override
  // ignore: library_private_types_in_public_api
  _RecorderState createState() => _RecorderState();
}

class _RecorderState extends State<Recorder> {
  // ignore: prefer_final_fields
  FlutterSoundRecorder _recorder = FlutterSoundRecorder();
  bool _isRecording = false;
  @override
  void initState() {
    super.initState();
    _recorder.openAudioSession().then((value) {
      // ignore: avoid_print
      print('Audio session opened: $value');
    });
  }

  @override
  void dispose() {
    _recorder.closeAudioSession();
    super.dispose();
  }

  final String _filePath = 'mp3';
  void _startRecording() async {
    // Check if permission to record audio is granted
    PermissionStatus status = await Permission.microphone.status;

    if (status != PermissionStatus.granted) {
      // Permission not granted, request it
      status = await Permission.microphone.request();
      if (status != PermissionStatus.granted) {
        // Permission denied, handle accordingly
        print("Permission to access microphone denied");
        return;
      }
    }

    // Specify the file path where you want to save the recorded audio
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String filePath = '${appDocDir.path}/my_recorded_audio.ogg';

    // Permission granted, start recording
    try {
      await _recorder.startRecorder(toFile: filePath, codec: Codec.aacMP4);
      print('Recording started with voice path in local: $filePath');
      setState(() {
        _isRecording = true;
      });
    } catch (err) {
      print('Error starting recording: $err');
    }
  }

  void _stopRecording() async {
    try {
      String? path = await _recorder.stopRecorder();
      print('Recording stopped: $path');
      setState(() {
        _isRecording = false;
      });
    } catch (err) {
      print('Error stopping recording: $err');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Voice Recorder'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            StreamBuilder<RecordingDisposition>(
              stream: _recorder.onProgress,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final duration = snapshot.data?.duration ?? Duration.zero;
                  return Text("${duration.inSeconds} s");
                } else {
                  return const Text(
                      "0 s"); // Handle case when there's no data yet
                }
              },
            ),
            IconButton(
              icon: _isRecording
                  ? const Icon(
                      Icons.stop,
                      color: Colors.red,
                    )
                  : const Icon(
                      Icons.mic,
                      color: Colors.blue,
                    ),
              onPressed: _isRecording ? _stopRecording : _startRecording,
              iconSize: 48.0,
            ),
            const SizedBox(height: 20),
            Text(
              _isRecording ? 'Recording...' : 'Tap to Record',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
