import 'dart:io';
import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:video_player/video_player.dart';
import 'package:camera/camera.dart';
import 'package:gal/gal.dart';
import 'dart:ui' as ui;
import 'dart:typed_data';
import 'package:url_launcher/url_launcher.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      initialRoute: '/',
      routes: {
        '/': (context) => WelcomePage(),
        '/login': (context) => LoginPage(),
        '/home': (context) => HomePage(),
        '/signup': (context) => SignUpPage(),
        '/password': (context) => PasswordPage(),
        '/disclaimer': (context) => DisclaimerPage(),
        '/device-setup': (context) => SetupPage(),
        '/camera': (context) => CameraPage(),
        '/patient-list': (context) => PatientPage(),
        '/patient-file': (context) => PatientFilePage(),
        '/file-gallery': (context) => FileGalleryPage(),
        '/training': (context) => TrainingPage(),
        // '/preview': (context) => PreviewPage(imagePath: imagePath),
      },
    );
  }
}

// class MyAppState extends ChangeNotifier {
//   var current = WordPair.random();
// }

class WelcomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.white,
              child: Icon(Icons.camera_alt, size: 60, color: Colors.black),
            ),
            SizedBox(height: 20),
            Text(
              'OptiScan',
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
            SizedBox(height:40),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context,'/login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                child: Text('Log In', style: TextStyle(fontSize:22, color: Colors.white)),
              ),
            ),
            SizedBox(height:20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/signup'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal:55, vertical: 15),
                child: Text('Sign Up', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/home'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Sign In', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pushNamed(context, '/password'),
              child: Text(
                'Forgot password?',
                style: TextStyle(color: Colors.white70),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class SignUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Create an account.',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ...['First Name', 'Last Name', 'Gender', 'Date of Birth', 'E-mail', 'Password', 'Re-type password']
                .map((label) => Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: label,
                  labelStyle: TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[850],
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                ),
                obscureText: label.toLowerCase().contains('password'),
              ),
            ))
                .toList(),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context,'/login'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Submit', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ElevatedButton(
              // onPressed: () => Navigator.pushNamed(context, '/disclaimer'),
              onPressed: () => Navigator.pushNamed(context, '/patient-list'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Create New Scan', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/patient-file'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('View Files', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/training'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Training Module', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Sign out', style: TextStyle(fontSize: 18, color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Forgot your password.',
              style: TextStyle(fontSize: 24, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'Please enter the email associated with the account who’s password you want to reset.',
              style: TextStyle(fontSize: 14, color: Colors.white),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            TextField(
              decoration: InputDecoration(
                labelText: 'Email',
                labelStyle: TextStyle(color: Colors.white),
                filled: true,
                fillColor: Colors.grey[850],
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text('Send E-mail', style: TextStyle(fontSize: 16, color: Colors.white)),
              ),
            ),
            SizedBox(height: 10),
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                'Return to login',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DisclaimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Retina Scan Consent"),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Please read the following information carefully before your retina scan:",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildSection(
                "1. Purpose of the Scan:",
                "The retina scan is a non-invasive diagnostic procedure designed to capture detailed images of the retina, allowing us to assess the health of your eyes and identify any potential issues.",
              ),
              _buildSection(
                "2. Procedure and Expectations:",
                "During the scan, you may be asked to look at a series of lights. The procedure is generally quick and painless, though you may experience brief, mild discomfort from the lights.",
              ),
              _buildSection(
                "3. Potential Risks and Side Effects:",
                "While retina scans are safe and involve no direct contact with the eye, some patients may experience temporary visual disturbances or light sensitivity following the scan. These effects typically subside within a few minutes. Please let us know if you feel any prolonged discomfort.",
              ),
              _buildSection(
                "4. Limitations of the Scan:",
                "This retina scan is intended as a diagnostic tool and does not replace a full eye examination by an eye care professional. Additional tests may be required to complete your diagnosis or treatment plan.",
              ),
              _buildSection(
                "5. Consent:",
                "By proceeding with the retina scan, you acknowledge that you have read and understand this information and consent to the procedure.",
              ),
              const SizedBox(height: 10),
              const Text(
                "If you have any questions or concerns about the retina scan, please feel free to ask our team before proceeding.",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                    ),
                    onPressed: () => Navigator.pushNamed(context,'/device-setup'),
                    child: const Text("I Agree",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 12),
                    ),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                            content: Text("You disagreed to proceed.")),
                      );
                    },
                    child: const Text("I Disagree",
                        style: TextStyle(fontSize: 20, color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Back', style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 15, color: Colors.white),
          children: [
            TextSpan(
              text: "$title ",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: content),
          ],
        ),
      ),
    );
  }

}

class SetupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 80),
            _buildChecklistItem(Icons.link, "Check smartphone connection with the lens housing."),
            _buildChecklistItem(Icons.camera, "Check camera settings, including zoom and flashlight."),
            _buildChecklistItem(Icons.remove_red_eye, "Check camera focal point with patient’s eye position."),
            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () => Navigator.pushNamed(context, '/camera'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                child: Text('Proceed to Camera', style: TextStyle(fontSize: 20, color: Colors.white)),
              ),
            ),
            SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  SizedBox(width: 10),
                  Text('Back', style: TextStyle(color: Colors.black, fontSize: 20)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildChecklistItem(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          SizedBox(width: 10),
          Expanded(
            child: Text(text, style: TextStyle(color: Colors.white, fontSize: 24)),
          ),
        ],
      ),
    );
  }
}

class TrainingPage extends StatelessWidget {

  _launchurl() async {
    final Uri _url = Uri.parse('https://flutter.dev');

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Training Video',
              style: TextStyle(
                color: Colors.white,
                fontSize: 40,
              ),
            ),
            SizedBox(height: 50),

            ElevatedButton(
              onPressed: _launchurl,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                backgroundColor: Colors.red,
              ),
              child: const Icon(Icons.play_arrow, color: Colors.white),
            ),
            SizedBox(height: 80),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 40),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Finish Training',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PatientPage extends StatelessWidget {
  final List<String> patients = [
    'Bianca Ha',
    'Derek Sanders',
    'Finneas',
    'Joanne Lee',
    'Roxxannia Wang',
    'Sabrina Carpenter',
    'Sorina Andrei',
    'S.Coups',
    'Taylor Swift',
    'Tiffany Leung'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: TextField(
          decoration: InputDecoration(
            hintText: 'Patient Name',
            prefixIcon: Icon(Icons.menu, color: Colors.grey),
            suffixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[850],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                padding: EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () {
                // Action for creating new patient
              },
              child: Center(
                child: Text(
                  '+ Create New Patient',
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/disclaimer'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        patients[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Back', style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class PatientFilePage extends StatelessWidget {
  final List<String> patients = [
    'Bianca Ha',
    'Derek Sanders',
    'Finneas',
    'Joanne Lee',
    'Roxxannia Wang',
    'Sabrina Carpenter',
    'Sorina Andrei',
    'S.Coups',
    'Taylor Swift',
    'Tiffany Leung'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,

        title: TextField(
          decoration: InputDecoration(
            hintText: 'Patient Name',
            prefixIcon: Icon(Icons.menu, color: Colors.grey),
            suffixIcon: Icon(Icons.search, color: Colors.grey),
            filled: true,
            fillColor: Colors.grey[850],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10),

            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: patients.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Navigator.pushNamed(context, '/file-gallery'),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Text(
                        patients[index],
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            SizedBox(height: 10),
            Align(
              alignment: Alignment.bottomLeft,
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.arrow_back, color: Colors.black),
                    SizedBox(width: 10),
                    Text('Back', style: TextStyle(color: Colors.black, fontSize: 20)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


class FileGalleryPage extends StatefulWidget {
  @override
  _FileGalleryPageState createState() => _FileGalleryPageState();
}

class _FileGalleryPageState extends State<FileGalleryPage> {
  File? _patientImage;

  Future<void> _pickLatestImage() async {
    final ImagePicker picker = ImagePicker();
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _patientImage = File(image.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Patient File'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: _pickLatestImage,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Select Patient Image', style: TextStyle(color: Colors.white, fontSize: 20)),
            ),
            SizedBox(height: 15),
            _patientImage != null ? Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: FileImage(_patientImage!),
                  fit: BoxFit.cover,
                ),
              ),
            )
                : Container(
              width: 150,
              height: 150,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey,
              ),
              child: Icon(Icons.image, color: Colors.white, size: 50),
            ),


            SizedBox(height: 60),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text('Upload to Cloud',
                  style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}


class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  CameraPageState createState() => CameraPageState();
}

class CameraPageState extends State<CameraPage> with WidgetsBindingObserver {
  CameraController? _controller;
  bool _isCameraInitialized = false;
  late final List<CameraDescription> _cameras;
  bool _isRecording = false;
  bool _isFlashOn = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    initCamera();
  }

  Future<void> initCamera() async {
    _cameras = await availableCameras();
    // Initialize the camera with the first camera in the list
    await onNewCameraSelected(_cameras.first);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // App state changed before we got the chance to initialize.
    final CameraController? cameraController = _controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  Future<XFile?> captureImage() async {
    final CameraController? cameraController = _controller;
    try {
      final image = await cameraController?.takePicture();

      return image;
    } on CameraException catch (e) {
      debugPrint('Error: $e');
      return null;
    }
  }

  void _onRecordVideoPressed() async {
    final navigator = Navigator.of(context);
    final xFile = await captureImage();
    if (xFile != null) {
      Gal.putImage(xFile.path);
      if (xFile.path.isNotEmpty) {
        navigator.push(
          MaterialPageRoute(
            builder: (context) => PreviewPage(
              imagePath: xFile.path,
            ),
          ),
        );
        await _controller!.setFlashMode(FlashMode.off,);
      }
    }
  }

  void _Flashlight() async{
    if (_controller != null) {
      setState(() {
        _isFlashOn = !_isFlashOn;
      });
      await _controller!.setFlashMode(
        _isFlashOn ? FlashMode.torch : FlashMode.off,
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    if (_isCameraInitialized) {
      return SafeArea(
        child: Scaffold(
          body: GestureDetector(
            onTapUp: (details) => _setFocus(details, context),
            child: Column(
              children: [
                Expanded(
                  child: CameraPreview(_controller!),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _onRecordVideoPressed,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(70, 70),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.white,
                      ),
                      child: const Icon(Icons.camera, color: Colors.black),
                    ),
                    const SizedBox(width: 30),
                    ElevatedButton(
                      onPressed: _Flashlight,
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(70, 70),
                        shape: const CircleBorder(),
                        backgroundColor: Colors.black,
                      ),
                      child: Icon(
                        _isFlashOn ? Icons.flash_on : Icons.flash_off,
                        color: _isFlashOn ? Colors.yellow : Colors.white,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
              ],
            ),
          ),
        ),
      );
    } else {
      return const Center(child: CircularProgressIndicator());
    }
  }



  Future<void> onNewCameraSelected(CameraDescription description) async {
    final previousCameraController = _controller;

    // Instantiating the camera controller
    final CameraController cameraController = CameraController(
      description,
      ResolutionPreset.max,
      imageFormatGroup: ImageFormatGroup.jpeg,

    );

    // Initialize controller
    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      debugPrint('Error initializing camera: $e');
    }
    // Dispose the previous controller
    await previousCameraController?.dispose();

    // Replace with the new controller
    if (mounted) {
      setState(() {
        _controller = cameraController;
      });
    }

    // Update UI if controller updated
    cameraController.addListener(() {
      if (mounted) setState(() {});
    });

    // Update the Boolean
    if (mounted) {
      setState(() {
        _isCameraInitialized = _controller!.value.isInitialized;
      });
    }
  }

  Future<void> _setFocus(TapUpDetails details, BuildContext context) async {
    if (_controller == null || !_controller!.value.isInitialized) return;

    double fullWidth = MediaQuery.of(context).size.width;
    double cameraHeight = fullWidth * _controller!.value.aspectRatio;

    // Convert tap position to camera focus point (values between 0 and 1)
    final double focusX = details.localPosition.dx / fullWidth;
    final double focusY = details.localPosition.dy / cameraHeight;

    try {
      await _controller!.setFocusPoint(Offset(focusX, focusY));
      await _controller!.setExposurePoint(Offset(focusX, focusY));
    } catch (e) {
      debugPrint('Focus error: $e');
    }
  }
}

class PreviewPage extends StatefulWidget {
  final String imagePath;

  const PreviewPage({super.key, required this.imagePath});

  @override
  State<PreviewPage> createState() => _PreviewPageState();
}


class _PreviewPageState extends State<PreviewPage> {
  double _zoom = 1.0; // Zoom level
  double _dx = 0.0; // Horizontal position
  double _dy = 0.0; // Vertical position

  Future<void> _saveCroppedImage() async {
    final ui.PictureRecorder recorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(recorder);
    final Paint paint = Paint();

    final File imageFile = File(widget.imagePath);
    final Uint8List imageBytes = await imageFile.readAsBytes();
    final ui.Image img = await decodeImageFromList(imageBytes);

    final double size = img.width.toDouble(); // Maintain original size
    final double cropSize = 900;

    // Compute source cropping rectangle
    // final Rect srcRect = Rect.fromCenter(
    final Rect srcRect = Rect.fromCircle(
      center: Offset(
        img.width / 2 - _dx * img.width / 2,
        img.height / 2 - _dy * img.height / 2,
      ),
      // width: img.width / _zoom,
      // height: img.height / _zoom,
      radius: img.width/_zoom,
    );

    // Destination is a centered circle at full resolution
    final Rect dstRect = Rect.fromLTWH(0, 0, cropSize, cropSize);

    // Clip to a circular region
    Path circlePath = Path()..addOval(dstRect);
    canvas.clipPath(circlePath);

    // Draw high-quality cropped image inside circular mask
    canvas.drawImageRect(img, srcRect, dstRect, paint);

    // Convert to PNG
    final ui.Image croppedImage = await recorder.endRecording().toImage(
      cropSize.toInt(), cropSize.toInt(),
    );

    final ByteData? byteData = await croppedImage.toByteData(
      format: ui.ImageByteFormat.png,
    );

    if (byteData != null) {
      final File savedFile = File('${widget.imagePath}_cropped.png');
      await savedFile.writeAsBytes(byteData.buffer.asUint8List());

      await Gal.putImage(savedFile.path);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Image saved to gallery!")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Adjust Image')),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const SizedBox(height: 10),
          Expanded(
            child: Center(
              child: ClipOval(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Transform.scale(
                    scale: _zoom,
                    child: Transform.translate(
                      offset: Offset(_dx * 100, _dy * 100),
                      child: AspectRatio(
                        aspectRatio: 1, // Keep the image square
                        child: Image.file(File(widget.imagePath), fit: BoxFit.cover),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15),
          _buildSlider('Zoom', _zoom, 1.0, 5.0, (value) => setState(() => _zoom = value)),
          _buildSlider('Move Left/Right', _dx, -1.0, 1.0, (value) => setState(() => _dx = value)),
          _buildSlider('Move Up/Down', _dy, -1.0, 1.0, (value) => setState(() => _dy = value)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: _saveCroppedImage,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.brown,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text('Save to Gallery', style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () => Navigator.pushNamed(context,'/home'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blueGrey,
              padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
            ),
            child: const Text('home', style: TextStyle(fontSize: 20, color: Colors.white)),
          ),
        ],
      ),
    );
  }

  Widget _buildSlider(String label, double value, double min, double max, ValueChanged<double> onChanged) {
    return Column(
      children: [
        Text(
            label,
            style: const TextStyle(color: Colors.white, fontSize: 16)
        ),
        Slider(
          value: value,
          min: min,
          max: max,
          onChanged: onChanged,
          activeColor: Colors.white,
          inactiveColor: Colors.grey,
        ),
      ],
    );
  }
}