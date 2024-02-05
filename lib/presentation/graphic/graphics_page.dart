import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class GraphicsPage extends StatefulWidget {
  const GraphicsPage({super.key});

  @override
  State<GraphicsPage> createState() => _GraphicsPageState();
}

class _GraphicsPageState extends State<GraphicsPage> {
  List<_GroupData> data = [];
  late TooltipBehavior _tooltipBehavior;
  int sumGroupdata = 0;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    data = [
      _GroupData('EUROPOL', 100, ''),
      _GroupData('ATIVIDADE FISICA', 250, ''),
      _GroupData('MENTAL ', 600, ''),
    ];
    sumGroupdata = data.map((e) => e.valor).reduce((a, b) => a + b);

    for (var elemento in data) {
      double porcentagem = (elemento.valor * 100) / sumGroupdata;
      String porcentagemString = porcentagem.toStringAsFixed(2);
      elemento.porcetagem = double.parse(porcentagemString);
      elemento.text =
          '${porcentagemString.replaceAll('.', ',')}%\n(${elemento.valor})';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gráfico'),
      ),
      body: Column(
        children: [
          SfCircularChart(
            legend: const Legend(
                isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
            tooltipBehavior: _tooltipBehavior,
            series: <CircularSeries<_GroupData, String>>[
              DoughnutSeries<_GroupData, String>(
                dataSource: data,
                xValueMapper: (_GroupData data, _) => data.title,
                yValueMapper: (_GroupData data, _) => data.valor,
                dataLabelMapper: (_GroupData data, _) => data.text,
                dataLabelSettings: const DataLabelSettings(isVisible: true),
                enableTooltip: true,
              ),
            ],
          ),
          Text(
            'A média entre os valores é: ${((sumGroupdata / data.length).toStringAsFixed(2)).replaceAll('.', ',')}',
            style: const TextStyle(fontSize: 20),
          )
        ],
      ),
    );
  }
}

class _GroupData {
  _GroupData(this.title, this.valor, this.text);

  final String title;
  final int valor;
  double? porcetagem;
  String text;
}
