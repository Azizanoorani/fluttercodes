import 'package:fl_login_demo/ListView.builder.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
import 'package:fl_login_demo/Lion.dart';

class SfRadialGaugeSample extends StatefulWidget {

  final AnimalWeight animalweight;

  @override
  _SfRadialGauge createState() => _SfRadialGauge(animalweight);

  const SfRadialGaugeSample({super.key, required this.animalweight});
}

class _SfRadialGauge extends State<SfRadialGaugeSample> {

  late AnimalWeight animalweight;

  _SfRadialGauge(this.animalweight);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
        body: Center(
        child: Container(
         margin: const EdgeInsets.all(20),
          child:
          SfRadialGauge(enableLoadingAnimation: true, animationDuration: 4500,axes: <RadialAxis>[
            RadialAxis(
              minimum: animalweight.MinimumWeight,
              maximum: animalweight.MaximumWeight,
              showLabels: false,
              showTicks: false,
              axisLineStyle: AxisLineStyle(
                thickness: 0.2,
                cornerStyle: CornerStyle.bothCurve,
                color: Color.fromARGB(30, 0, 169, 181),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                  value: animalweight.AverageWeight,
                  cornerStyle: CornerStyle.bothCurve,
                  width: 0.2,
                  sizeUnit: GaugeSizeUnit.factor,
                )
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                    positionFactor: 0.1,
                    angle: 90,
                    widget: Text(
                      animalweight.AverageWeight.toStringAsFixed(0) + '/' + animalweight.MaximumWeight.toStringAsFixed(0),
                      style: TextStyle(fontSize: 11),
                    ))
              ])
          ]),
        ),
        ),
        ),
    );
  }
}