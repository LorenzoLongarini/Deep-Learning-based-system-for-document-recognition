import 'package:document_recognition/constants/constants.dart';

String getLabel(String label) {
  switch (label) {
    case "ic_CIE.front.":
      return icCIEfront;
    case "ic_CIE.rear.":
      return icCIErear;
    case "dl_I11.front.":
      return dlI11front;
    case "dl_I11.rear.":
      return dlI11rear;
    case "dl_I10.front.":
      return dlI10front;
    case "dl_I10.rear.":
      return dlI10front;
    case "ic_TES.front.":
      return icTESfront;
    case "ic_TES.rear.":
      return icTESrear;
    case "doc_NR.front.":
      return docNRfront;
    case "doc_NR.rear.":
      return docNRrear;
    default:
      return '';
  }
}
