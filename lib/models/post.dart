class Post {
/*
{
  "id": 334664,
  "tags": "barefoot candy halloween hat lollipop long_hair original pointed_ears pumpkin purple_eyes witch_hat yorarry",
  "created_at": 1637418678,
  "creator_id": 181250,
  "author": "BattlequeenYume",
  "change": 2073047,
  "source": "https://www.pixiv.net/en/artworks/94261223",
  "score": 0,
  "md5": "66226821ea227bda9a55c2672a62b06e",
  "file_size": 2285953,
  "file_url": "https://konachan.net/image/66226821ea227bda9a55c2672a62b06e/Konachan.com%20-%20334664%20barefoot%20candy%20halloween%20hat%20lollipop%20long_hair%20original%20pointed_ears%20pumpkin%20purple_eyes%20witch_hat%20yorarry.png",
  "is_shown_in_index": true,
  "preview_url": "https://konachan.net/data/preview/66/22/66226821ea227bda9a55c2672a62b06e.jpg",
  "preview_width": 150,
  "preview_height": 106,
  "actual_preview_width": 300,
  "actual_preview_height": 212,
  "sample_url": "https://konachan.net/sample/66226821ea227bda9a55c2672a62b06e/Konachan.com%20-%20334664%20sample.jpg",
  "sample_width": 1414,
  "sample_height": 1000,
  "sample_file_size": 1083147,
  "jpeg_url": "https://konachan.net/jpeg/66226821ea227bda9a55c2672a62b06e/Konachan.com%20-%20334664%20barefoot%20candy%20halloween%20hat%20lollipop%20long_hair%20original%20pointed_ears%20pumpkin%20purple_eyes%20witch_hat%20yorarry.jpg",
  "jpeg_width": 1414,
  "jpeg_height": 1000,
  "jpeg_file_size": 508448,
  "rating": "s",
  "has_children": false,
  "parent_id": null,
  "status": "active",
  "width": 1414,
  "height": 1000,
  "is_held": false,
  "frames_pending_string": "",
  "frames_pending": [
    null
  ],
  "frames_string": "",
  "frames": [
    null
  ]
}
*/

  int? id;
  String? tags;
  int? createdAt;
  int? creatorId;
  String? author;
  int? change;
  String? source;
  int? score;
  String? md5;
  int? fileSize;
  String? fileUrl;
  bool? isShownInIndex;
  String? previewUrl;
  int? previewWidth;
  int? previewHeight;
  int? actualPreviewWidth;
  int? actualPreviewHeight;
  String? sampleUrl;
  int? sampleWidth;
  int? sampleHeight;
  int? sampleFileSize;
  String? jpegUrl;
  int? jpegWidth;
  int? jpegHeight;
  int? jpegFileSize;
  String? rating;
  bool? hasChildren;
  String? parentId;
  String? status;
  int? width;
  int? height;
  bool? isHeld;

  Post({
    this.id,
    this.tags,
    this.createdAt,
    this.creatorId,
    this.author,
    this.change,
    this.source,
    this.score,
    this.md5,
    this.fileSize,
    this.fileUrl,
    this.isShownInIndex,
    this.previewUrl,
    this.previewWidth,
    this.previewHeight,
    this.actualPreviewWidth,
    this.actualPreviewHeight,
    this.sampleUrl,
    this.sampleWidth,
    this.sampleHeight,
    this.sampleFileSize,
    this.jpegUrl,
    this.jpegWidth,
    this.jpegHeight,
    this.jpegFileSize,
    this.rating,
    this.hasChildren,
    this.parentId,
    this.status,
    this.width,
    this.height,
    this.isHeld,
  });

  static Post fromJson(dynamic json) {
    return Post(
      id : json['id']?.toInt(),
      tags : json['tags']?.toString(),
      createdAt : json['created_at']?.toInt(),
      creatorId : json['creator_id']?.toInt(),
      author : json['author']?.toString(),
      change : json['change']?.toInt(),
      source : json['source']?.toString(),
      score : json['score']?.toInt(),
      md5 : json['md5']?.toString(),
      fileSize : json['file_size']?.toInt(),
      fileUrl : json['file_url']?.toString(),
      isShownInIndex : json['is_shown_in_index'],
      previewUrl : json['preview_url']?.toString(),
      previewWidth : json['preview_width']?.toInt(),
      previewHeight : json['preview_height']?.toInt(),
      actualPreviewWidth : json['actual_preview_width']?.toInt(),
      actualPreviewHeight : json['actual_preview_height']?.toInt(),
      sampleUrl : json['sample_url']?.toString(),
      sampleWidth : json['sample_width']?.toInt(),
      sampleHeight : json['sample_height']?.toInt(),
      sampleFileSize : json['sample_file_size']?.toInt(),
      jpegUrl : json['jpeg_url']?.toString(),
      jpegWidth : json['jpeg_width']?.toInt(),
      jpegHeight : json['jpeg_height']?.toInt(),
      jpegFileSize : json['jpeg_file_size']?.toInt(),
      rating : json['rating']?.toString(),
      hasChildren : json['has_children'],
      parentId : json['parent_id']?.toString(),
      status : json['status']?.toString(),
      width : json['width']?.toInt(),
      height : json['height']?.toInt(),
      isHeld : json['is_held'],
    );
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['tags'] = tags;
    data['created_at'] = createdAt;
    data['creator_id'] = creatorId;
    data['author'] = author;
    data['change'] = change;
    data['source'] = source;
    data['score'] = score;
    data['md5'] = md5;
    data['file_size'] = fileSize;
    data['file_url'] = fileUrl;
    data['is_shown_in_index'] = isShownInIndex;
    data['preview_url'] = previewUrl;
    data['preview_width'] = previewWidth;
    data['preview_height'] = previewHeight;
    data['actual_preview_width'] = actualPreviewWidth;
    data['actual_preview_height'] = actualPreviewHeight;
    data['sample_url'] = sampleUrl;
    data['sample_width'] = sampleWidth;
    data['sample_height'] = sampleHeight;
    data['sample_file_size'] = sampleFileSize;
    data['jpeg_url'] = jpegUrl;
    data['jpeg_width'] = jpegWidth;
    data['jpeg_height'] = jpegHeight;
    data['jpeg_file_size'] = jpegFileSize;
    data['rating'] = rating;
    data['has_children'] = hasChildren;
    data['parent_id'] = parentId;
    data['status'] = status;
    data['width'] = width;
    data['height'] = height;
    data['is_held'] = isHeld;
    return data;
  }
}
