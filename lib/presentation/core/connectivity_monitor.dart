import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConnectivityMonitor extends StatelessWidget {
  final Widget child;

  const ConnectivityMonitor({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        child,
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: StreamBuilder<List<ConnectivityResult>>(
            stream: Connectivity().onConnectivityChanged,
            builder: (_, snapshot) {
              final connections = snapshot.data ?? [];
              return Visibility(
                visible: connections.contains(ConnectivityResult.none),
                child: Container(
                  color: Colors.red,
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: const SafeArea(
                    child: Text(
                      'No Internet Connection',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        inherit: false,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.none,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
