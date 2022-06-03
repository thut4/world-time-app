import 'package:flutter/material.dart';
import 'package:world_time_app/services.dart/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingPage extends StatefulWidget {
  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<void> setWorldTime() async {
    WorldTime world_time = WorldTime(
        location: 'Berlin', flag: 'germany.png', url: 'Europe/Berlin');
    await world_time.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': world_time.location,
      'flag': world_time.flag,
      'time': world_time.time,
      'isDaytime': world_time.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[900],
      body: const Center(
        child: SpinKitFadingCube(
          color: Colors.white,
          size: 50.0,
        ),
      ),
    );
  }
}
