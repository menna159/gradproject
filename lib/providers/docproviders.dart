import 'package:flutter/cupertino.dart';

import '../models/doc_accountModel.dart';

class docproviders extends ChangeNotifier {
  late Future<DocAccountModel?> _docdat;
  set docdata(Future<DocAccountModel?> _docdataaa) {
    _docdat = _docdataaa;
    notifyListeners();
  }

  Future<DocAccountModel?> get docdata {
    return _docdat;
  }
}
