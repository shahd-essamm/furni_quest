import 'package:camera/camera.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  CameraController? cameraController;
  bool isCameraInitialized = false;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      // Get the list of available cameras
      final cameras = await availableCameras();

      // Initialize the first camera (usually the back camera)
      cameraController = CameraController(
        cameras[0], // Use the first camera
        ResolutionPreset.high, // Set resolution to high
      );

      // Initialize the camera controller
      await cameraController!.initialize();

      // Check if the widget is still mounted
      if (!mounted) return;

      // Update the state to indicate the camera is initialized
      setState(() {
        isCameraInitialized = true;
      });
    } catch (e) {
      print("Failed to initialize camera: $e");
    }
  }

  @override
  void dispose() {
    // Dispose of the camera controller when the widget is disposed
    cameraController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!isCameraInitialized) {
      // Show a loading indicator while the camera is initializing
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    return Scaffold(
      body: Stack(
        children: [
          // Full-screen camera preview
          Positioned.fill(
            child: CameraPreview(cameraController!),
          ),

          // Optional: Add a button to take a picture
          Positioned(
            bottom: 20,
            left: 0,
            right: 0,
            child: Center(
              child: FloatingActionButton(
                onPressed: () async {
                  try {
                    // Take a picture
                    final image = await cameraController!.takePicture();
                    print("Image saved: ${image.path}");
                  } catch (e) {
                    print("Failed to take picture: $e");
                  }
                },
                child: Icon(Icons.camera),
              ),
            ),
          ),
        ],
      ),
    );
  }
}