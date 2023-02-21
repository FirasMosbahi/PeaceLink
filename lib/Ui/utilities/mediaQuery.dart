class Mediaquery {
  double mediaHeight;
  double mediaWidth;
  Mediaquery({required this.mediaHeight, required this.mediaWidth});
  double getHeight(double value) {
    return (value / 856.7272727272727) * this.mediaHeight;
  }

  double getwidht(double value) {
    return (value / 392.72727272727275) * this.mediaWidth;
  }
}
