import 'dart:async';
import 'dart:math';
import 'dart:svg';
import 'package:angular2/core.dart';

@Component(selector: 'gauge-meter', templateUrl: 'gauge_meter.svg')
class GaugeMeterComponent implements OnInit {
  GElement _needle;
  PathElement _mask;
  ElementRef _elementRef;

  GaugeMeterComponent(ElementRef this._elementRef);

  @override
  ngOnInit() {
    _needle = _elementRef.nativeElement.querySelector('#needle');
    _mask = _elementRef.nativeElement.querySelector('#mask');
  }

  @Input() num min = 0;

  @Input() num max = 100;

  @Input() set value(String value) {
    value ??= '0';
    var range = max - min;
    var _theta = (int.parse(value) - min) / range * 180 - 180;
    var _thetaRad = _theta * PI / 180;
    var _maskX = 150 * cos(_thetaRad) + 182.5;
    var _maskY = 152.71938 * sin(_thetaRad) + 185.21938;

    new Future.delayed(Duration.ZERO, () {
      _needle.attributes['transform'] = 'rotate(${_theta}, 182.5, 182.5)';
      _mask.attributes['d'] =
      'M ${_maskX.toStringAsFixed(4)},${_maskY.toStringAsFixed(4)} A 150,152.71938 0 0 1 332.5,185.21938';
    });
  }
}
