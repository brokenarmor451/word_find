import 'dart:io';
import 'package:path_provider/path_provider.dart';

class Solveds {

  late File solvedsFile;
  late String solvedsAsString;

  Future<void> makeSolveds() async{

    final Directory appDir = await getApplicationDocumentsDirectory();
    final String appPath = appDir.path;

    solvedsFile = File('${appPath}/solveds.txt');

    if(!(await solvedsFile.exists())) {
      await solvedsFile.create();
    }

    if(await solvedsFile.readAsString() == "") {
      await solvedsFile.writeAsString("ONNNNNNNNNNNNNNNNNNNNNNNN");
    }

    solvedsAsString = await solvedsFile.readAsString();
  }

  Future<void> updateSolveds(int index) async{
    final Directory appDir = await getApplicationDocumentsDirectory();
    final String appPath = appDir.path;

    solvedsFile = File('${appPath}/solveds.txt');

    String oldFile = await solvedsFile.readAsString();

    if(oldFile[index] != 'Y') {
      String newSolveds = oldFile.replaceRange(index, index + 1, "Y");

      // there is no level 26 so don't make it as openable
      if(index != 24) {
        newSolveds = newSolveds.replaceRange(index + 1, index + 2, "O");
      }

      await solvedsFile.writeAsString(newSolveds);
      solvedsAsString = await solvedsFile.readAsString();
    }
  }
}
