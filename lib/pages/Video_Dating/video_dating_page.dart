import 'package:flutter/material.dart';
// import 'package:flutter_webrtc/flutter_webrtc.dart';
// import 'package:web_socket_channel/web_socket_channel.dart';
// import 'package:web_socket_channel/status.dart' as ws_status;

class VideoDatingPage extends StatefulWidget {
  const VideoDatingPage({super.key});

  @override
  State<VideoDatingPage> createState() => _VideoDatingPageState();
}

class _VideoDatingPageState extends State<VideoDatingPage> {
  // final RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  // final RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();

  // late WebSocketChannel _channel;
  // RTCPeerConnection? _peerConnection;
  // MediaStream? _localStream;

  // bool _videoEnabled = true;
  // bool _audioEnabled = true;

  // @override
  // void initState() {
  //   super.initState();
  //   _initializeRenderers();
  //   _connectToSignalingServer();
  // }

  // @override
  // void dispose() {
  //   _localRenderer.dispose();
  //   _remoteRenderer.dispose();
  //   _peerConnection?.close();
  //   _localStream?.dispose();
  //   _channel.sink.close(ws_status.normalClosure);
  //   super.dispose();
  // }

  // Future<void> _initializeRenderers() async {
  //   await _localRenderer.initialize();
  //   await _remoteRenderer.initialize();
  //   await _startLocalStream();
  // }

  // Future<void> _startLocalStream() async {
  //   _localStream = await navigator.mediaDevices.getUserMedia({
  //     'video': true,
  //     'audio': true,
  //   });
  //   _localRenderer.srcObject = _localStream;
  // }

  // void _connectToSignalingServer() {
  //   _channel = WebSocketChannel.connect(
  //     Uri.parse('ws://your-signaling-server-url'),
  //   );

  //   _channel.stream.listen((message) {
  //     _handleSignalingMessage(message);
  //   });

  //   // Send a request to the signaling server for a new match
  //   _channel.sink.add('request_match');
  // }

  // Future<void> _handleSignalingMessage(String message) async {
  //   final Map<String, dynamic> data = Map.from(Uri.splitQueryString(message));

  //   switch (data['type']) {
  //     case 'offer':
  //       await _createPeerConnection();
  //       await _peerConnection?.setRemoteDescription(
  //         RTCSessionDescription(data['sdp'], 'offer'),
  //       );
  //       final answer = await _peerConnection?.createAnswer();
  //       await _peerConnection?.setLocalDescription(answer!);
  //       _channel.sink.add('answer:${answer!.sdp}');
  //       break;

  //     case 'answer':
  //       await _peerConnection?.setRemoteDescription(
  //         RTCSessionDescription(data['sdp'], 'answer'),
  //       );
  //       break;

  //     case 'ice_candidate':
  //       final candidate = RTCIceCandidate(
  //         data['candidate'],
  //         data['sdpMid'],
  //         int.parse(data['sdpMLineIndex']),
  //       );
  //       await _peerConnection?.addCandidate(candidate);
  //       break;

  //     default:
  //       break;
  //   }
  // }

  // Future<void> _createPeerConnection() async {
  //   final config = {
  //     'iceServers': [
  //       {'urls': 'stun:stun.l.google.com:19302'},
  //     ],
  //   };

  //   _peerConnection = await createPeerConnection(config);

  //   // Add local stream to peer connection
  //   _localStream?.getTracks().forEach((track) {
  //     _peerConnection?.addTrack(track, _localStream!);
  //   });

  //   // Handle remote stream
  //   _peerConnection?.onAddStream = (stream) {
  //     setState(() {
  //       _remoteRenderer.srcObject = stream;
  //     });
  //   };

  //   // Handle ICE candidates
  //   _peerConnection?.onIceCandidate = (candidate) {
  //     _channel.sink.add('ice_candidate:${candidate?.toMap()}');
  //   };
  // }

  // void _endCall() {
  //   _peerConnection?.close();
  //   _remoteRenderer.srcObject = null;
  //   _channel.sink.add('end_call');
  // }

  // void _toggleVideo() {
  //   setState(() {
  //     _videoEnabled = !_videoEnabled;
  //   });
  //   _localStream?.getVideoTracks()[0].enabled = _videoEnabled;
  // }

  // void _toggleAudio() {
  //   setState(() {
  //     _audioEnabled = !_audioEnabled;
  //   });
  //   _localStream?.getAudioTracks()[0].enabled = _audioEnabled;
  // }

  // void _nextMatch() {
  //   _endCall();
  //   _channel.sink.add('request_match');
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text("Video Dating", style: TextStyle(color: Colors.white)),
      ),
      body: Column(
        children: [
          // Remote video (upper half)
          // Expanded(
          //   child: RTCVideoView(_remoteRenderer),
          // ),
          // Local video (lower half)
          // Container(
          //   height: MediaQuery.of(context).size.height / 3,
          //   child: RTCVideoView(_localRenderer, mirror: true),
          // ),
          // Controls
          // Row(
          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
          //   children: [
          //     IconButton(
          //       icon: Icon(
          //         _videoEnabled ? Icons.videocam : Icons.videocam_off,
          //       ),
          //       onPressed: _toggleVideo,
          //     ),
          //     IconButton(
          //       icon: Icon(
          //         _audioEnabled ? Icons.mic : Icons.mic_off,
          //       ),
          //       onPressed: _toggleAudio,
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.call_end),
          //       color: Colors.red,
          //       onPressed: _endCall,
          //     ),
          //     IconButton(
          //       icon: const Icon(Icons.skip_next),
          //       onPressed: _nextMatch,
          //     ),
          //   ],
          // ),
        ],
      ),
    );
  }
}
