class Distance {
  final num _distance;

  // Named constructors for different units
  Distance.kms(num kms) : _distance = kms * 100000;
  Distance.meters(num meters) : _distance = meters * 100;
  Distance.cms(num cms) : _distance = cms;

  num get kms => _distance / 100000;
  num get meters => _distance / 100;
  num get cms => _distance;

  @override
  String toString() {
    return "Distance = ${_distance}cms";
  }

  Distance operator +(covariant Distance d) {
    return Distance.cms(this._distance + d._distance);
  }
}

void main() {
  Distance d1 = new Distance.cms(100);
  Distance d2 = new Distance.kms(1.2);
  print((d1 + d2).cms);
  print(d2.toString());
  print(d1.toString());
}
