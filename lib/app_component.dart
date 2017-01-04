import 'package:angular2/core.dart';
import 'package:gauge_meter/gauge_meter.dart';

@Component(selector: 'app-component',
    directives: const [GaugeMeterComponent],
    template: '''<gauge-meter [value]="value"></gauge-meter>
<input type="range" min="0" max="100" step="1" [(ngModel)]="value">''')
class AppComponent {
  String value = '0';
}