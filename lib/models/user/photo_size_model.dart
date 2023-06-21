enum PhotoSizeEnum {
  size48x48,
  size64x64,
  size96x96,
  size120x120,
  size240x240,
  size360x360,
  size432x432,
  size504x504,
  size648x648
}

class PhotoSize {
  static const Map<PhotoSizeEnum, String> sizeValue = {
    PhotoSizeEnum.size48x48: '48x48',
    PhotoSizeEnum.size64x64: '64x64',
    PhotoSizeEnum.size96x96: '96x96',
    PhotoSizeEnum.size120x120: '120x120',
    PhotoSizeEnum.size240x240: '240x120',
    PhotoSizeEnum.size360x360: '360x360',
    PhotoSizeEnum.size432x432: '432x432',
    PhotoSizeEnum.size504x504: '504x504',
    PhotoSizeEnum.size648x648: '648x648'
  };
  String getPicSize(PhotoSizeEnum size) {
    return sizeValue[size] ?? '48x48';
  }
}
