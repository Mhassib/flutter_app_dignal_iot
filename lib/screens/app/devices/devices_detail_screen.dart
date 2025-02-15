import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dignal_2025/providers/devices_provider.dart';
import 'package:flutter_dignal_2025/widgets/custom_pretty_gauge.dart';
import 'package:pretty_gauge/pretty_gauge.dart';
import 'package:provider/provider.dart';

class DevicesDetailScreen extends StatelessWidget {
  const DevicesDetailScreen({super.key});

  static String route = "/app-devices-detail";

  @override
  Widget build(BuildContext context) {

    final devicesProvider = Provider.of<DevicesProvider>(context, listen: true);
    devicesProvider.initSocket();

    return Scaffold(
      appBar: AppBar(
        title: Text('Dispositivo: ${devicesProvider.selectedDevice.key}'),
      ),
      body: _DeviceDetail(),
    );
  }
}

class _DeviceDetail extends StatelessWidget {
  const _DeviceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  child: Row(
                    children: [
                      Text('Status'),
                      Icon(
                        Icons.circle,
                        color: Colors.green,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  child: Row(
                    children: [
                      Text('Led'),
                      Switch(
                        value: false,
                        onChanged: (value) {}
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomPrettyGauge(
                  title: 'Luminosidad',
                  value: 500,
                  maxValue: 1023,
                  unitValue: 'lm',
                  segments: [
                    GaugeSegment('Low', 500, Colors.yellow),
                    GaugeSegment('Medium', 1023 - 500, Colors.blueGrey),
                  ],
                ),
                CustomPrettyGauge(
                  title: 'Temperatura',
                  value: 10,
                  unitValue: '°',
                  segments: [
                    GaugeSegment('Low', 20, Colors.lightBlueAccent),
                    GaugeSegment('Low', 20, Colors.yellow),
                    GaugeSegment('Low', 20, Colors.green),
                    GaugeSegment('Low', 20, Colors.orange),
                    GaugeSegment('Medium', 20, Colors.red),
                  ],
                ),
              ],
            ),
            Container(
              height: 300,
              child: LineChart(
                LineChartData(
                  borderData: FlBorderData(
                    border: Border.all(
                      color: Colors.white,
                      width: 3
                    )
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(showTitles: false),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(1, 1),
                        FlSpot(20, 10),
                        FlSpot(30, 5),
                      ]
                    )
                  ]
                )
              ),
            )
          ],
        ),
      ),
    );
  }
}