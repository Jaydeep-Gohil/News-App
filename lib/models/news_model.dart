class NewsModel {
  NewsModel({
      String? status, 
      num? totalResults, 
      List<Results>? results, 
      String? nextPage,}){
    _status = status;
    _totalResults = totalResults;
    _results = results;
    _nextPage = nextPage;
}

  NewsModel.fromJson(dynamic json) {
    _status = json['status'];
    _totalResults = json['totalResults'];
    if (json['results'] != null) {
      _results = [];
      json['results'].forEach((v) {
        _results?.add(Results.fromJson(v));
      });
    }
    _nextPage = json['nextPage'];
  }


  static NewsModel parseNewsModel(dynamic json) {
    return NewsModel.fromJson(json);
  }
  String? _status;
  num? _totalResults;
  List<Results>? _results;
  String? _nextPage;
NewsModel copyWith({  String? status,
  num? totalResults,
  List<Results>? results,
  String? nextPage,
}) => NewsModel(  status: status ?? _status,
  totalResults: totalResults ?? _totalResults,
  results: results ?? _results,
  nextPage: nextPage ?? _nextPage,
);
  String? get status => _status;
  num? get totalResults => _totalResults;
  List<Results>? get results => _results;
  String? get nextPage => _nextPage;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['totalResults'] = _totalResults;
    if (_results != null) {
      map['results'] = _results?.map((v) => v.toJson()).toList();
    }
    map['nextPage'] = _nextPage;
    return map;
  }

}

class Results {
  Results({
      String? articleId,
      String? link,
      String? title,
      String? description,
      String? content,
      dynamic keywords,
      List<String>? creator,
      String? language,
      List<String>? country,
      List<String>? category,
      String? pubDate,
      String? pubDateTZ,
      String? imageUrl,
      dynamic videoUrl,
      String? sourceId,
      String? sourceName,
      num? sourcePriority,
      String? sourceUrl,
      String? sourceIcon,
      String? sentiment,
      SentimentStats? sentimentStats,
      List<String>? aiTag,
      List<String>? aiRegion,
      List<String>? aiOrg,
      String? aiSummary,
      bool? duplicate,}){
    _articleId = articleId;
    _link = link;
    _title = title;
    _description = description;
    _content = content;
    _keywords = keywords;
    _creator = creator;
    _language = language;
    _country = country;
    _category = category;
    _pubDate = pubDate;
    _pubDateTZ = pubDateTZ;
    _imageUrl = imageUrl;
    _videoUrl = videoUrl;
    _sourceId = sourceId;
    _sourceName = sourceName;
    _sourcePriority = sourcePriority;
    _sourceUrl = sourceUrl;
    _sourceIcon = sourceIcon;
    _sentiment = sentiment;
    _sentimentStats = sentimentStats;
    _aiTag = aiTag;
    _aiRegion = aiRegion;
    _aiOrg = aiOrg;
    _aiSummary = aiSummary;
    _duplicate = duplicate;
}

  Results.fromJson(dynamic json) {
    _articleId = json['article_id'];
    _link = json['link'];
    _title = json['title'];
    _description = json['description'];
    _content = json['content'];
    _keywords = json['keywords'];
    _creator = json['creator'] != null ? json['creator'].cast<String>() : [];
    _language = json['language'];
    _country = json['country'] != null ? json['country'].cast<String>() : [];
    _category = json['category'] != null ? json['category'].cast<String>() : [];
    _pubDate = json['pubDate'];
    _pubDateTZ = json['pubDateTZ'];
    _imageUrl = json['image_url'];
    _videoUrl = json['video_url'];
    _sourceId = json['source_id'];
    _sourceName = json['source_name'];
    _sourcePriority = json['source_priority'];
    _sourceUrl = json['source_url'];
    _sourceIcon = json['source_icon'];
    _sentiment = json['sentiment'];

    final _ss = json['sentiment_stats'];
    if (_ss != null && _ss is Map) {
      _sentimentStats = SentimentStats.fromJson(_ss);
    } else {
      _sentimentStats = null;
    }
    
    final _aiTagRaw = json['ai_tag'];
    if (_aiTagRaw == null) {
      _aiTag = [];
    } else if (_aiTagRaw is List) {
      _aiTag = _aiTagRaw.cast<String>();
    } else if (_aiTagRaw is String) {
      _aiTag = [_aiTagRaw];
    } else {
      _aiTag = [];
    }

    final _aiRegionRaw = json['ai_region'];
    if (_aiRegionRaw == null) {
      _aiRegion = [];
    } else if (_aiRegionRaw is List) {
      _aiRegion = _aiRegionRaw.cast<String>();
    } else if (_aiRegionRaw is String) {
      _aiRegion = [_aiRegionRaw];
    } else {
      _aiRegion = [];
    }

    final _aiOrgRaw = json['ai_org'];
    if (_aiOrgRaw == null) {
      _aiOrg = [];
    } else if (_aiOrgRaw is List) {
      _aiOrg = _aiOrgRaw.cast<String>();
    } else if (_aiOrgRaw is String) {
      _aiOrg = [_aiOrgRaw];
    } else {
      _aiOrg = [];
    }
    _aiSummary = json['ai_summary'];
    _duplicate = json['duplicate'];
  }
  String? _articleId;
  String? _link;
  String? _title;
  String? _description;
  String? _content;
  dynamic _keywords;
  List<String>? _creator;
  String? _language;
  List<String>? _country;
  List<String>? _category;
  String? _pubDate;
  String? _pubDateTZ;
  String? _imageUrl;
  dynamic _videoUrl;
  String? _sourceId;
  String? _sourceName;
  num? _sourcePriority;
  String? _sourceUrl;
  String? _sourceIcon;
  String? _sentiment;
  SentimentStats? _sentimentStats;
  List<String>? _aiTag;
  List<String>? _aiRegion;
  List<String>? _aiOrg;
  String? _aiSummary;
  bool? _duplicate;
Results copyWith({  String? articleId,
  String? link,
  String? title,
  String? description,
  String? content,
  dynamic keywords,
  List<String>? creator,
  String? language,
  List<String>? country,
  List<String>? category,
  String? pubDate,
  String? pubDateTZ,
  String? imageUrl,
  dynamic videoUrl,
  String? sourceId,
  String? sourceName,
  num? sourcePriority,
  String? sourceUrl,
  String? sourceIcon,
  String? sentiment,
  SentimentStats? sentimentStats,
  List<String>? aiTag,
  List<String>? aiRegion,
  List<String>? aiOrg,
  String? aiSummary,
  bool? duplicate,
}) => Results(  articleId: articleId ?? _articleId,
  link: link ?? _link,
  title: title ?? _title,
  description: description ?? _description,
  content: content ?? _content,
  keywords: keywords ?? _keywords,
  creator: creator ?? _creator,
  language: language ?? _language,
  country: country ?? _country,
  category: category ?? _category,
  pubDate: pubDate ?? _pubDate,
  pubDateTZ: pubDateTZ ?? _pubDateTZ,
  imageUrl: imageUrl ?? _imageUrl,
  videoUrl: videoUrl ?? _videoUrl,
  sourceId: sourceId ?? _sourceId,
  sourceName: sourceName ?? _sourceName,
  sourcePriority: sourcePriority ?? _sourcePriority,
  sourceUrl: sourceUrl ?? _sourceUrl,
  sourceIcon: sourceIcon ?? _sourceIcon,
  sentiment: sentiment ?? _sentiment,
  sentimentStats: sentimentStats ?? _sentimentStats,
  aiTag: aiTag ?? _aiTag,
  aiRegion: aiRegion ?? _aiRegion,
  aiOrg: aiOrg ?? _aiOrg,
  aiSummary: aiSummary ?? _aiSummary,
  duplicate: duplicate ?? _duplicate,
);
  String? get articleId => _articleId;
  String? get link => _link;
  String? get title => _title;
  String? get description => _description;
  String? get content => _content;
  dynamic get keywords => _keywords;
  List<String>? get creator => _creator;
  String? get language => _language;
  List<String>? get country => _country;
  List<String>? get category => _category;
  String? get pubDate => _pubDate;
  String? get pubDateTZ => _pubDateTZ;
  String? get imageUrl => _imageUrl;
  dynamic get videoUrl => _videoUrl;
  String? get sourceId => _sourceId;
  String? get sourceName => _sourceName;
  num? get sourcePriority => _sourcePriority;
  String? get sourceUrl => _sourceUrl;
  String? get sourceIcon => _sourceIcon;
  String? get sentiment => _sentiment;
  SentimentStats? get sentimentStats => _sentimentStats;
  List<String>? get aiTag => _aiTag;
  List<String>? get aiRegion => _aiRegion;
  List<String>? get aiOrg => _aiOrg;
  String? get aiSummary => _aiSummary;
  bool? get duplicate => _duplicate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['article_id'] = _articleId;
    map['link'] = _link;
    map['title'] = _title;
    map['description'] = _description;
    map['content'] = _content;
    map['keywords'] = _keywords;
    map['creator'] = _creator;
    map['language'] = _language;
    map['country'] = _country;
    map['category'] = _category;
    map['pubDate'] = _pubDate;
    map['pubDateTZ'] = _pubDateTZ;
    map['image_url'] = _imageUrl;
    map['video_url'] = _videoUrl;
    map['source_id'] = _sourceId;
    map['source_name'] = _sourceName;
    map['source_priority'] = _sourcePriority;
    map['source_url'] = _sourceUrl;
    map['source_icon'] = _sourceIcon;
    map['sentiment'] = _sentiment;
    if (_sentimentStats != null) {
      map['sentiment_stats'] = _sentimentStats?.toJson();
    }
    map['ai_tag'] = _aiTag;
    map['ai_region'] = _aiRegion;
    map['ai_org'] = _aiOrg;
    map['ai_summary'] = _aiSummary;
    map['duplicate'] = _duplicate;
    return map;
  }

}


class SentimentStats {
  SentimentStats({
      num? positive, 
      num? neutral, 
      num? negative,}){
    _positive = positive;
    _neutral = neutral;
    _negative = negative;
}

  SentimentStats.fromJson(dynamic json) {
    _positive = json['positive'];
    _neutral = json['neutral'];
    _negative = json['negative'];
  }
  num? _positive;
  num? _neutral;
  num? _negative;
SentimentStats copyWith({  num? positive,
  num? neutral,
  num? negative,
}) => SentimentStats(  positive: positive ?? _positive,
  neutral: neutral ?? _neutral,
  negative: negative ?? _negative,
);
  num? get positive => _positive;
  num? get neutral => _neutral;
  num? get negative => _negative;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['positive'] = _positive;
    map['neutral'] = _neutral;
    map['negative'] = _negative;
    return map;
  }

}