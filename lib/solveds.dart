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

    final String getSolvedsAsString = await solvedsFile.readAsString();

    if(getSolvedsAsString == "") {
      await solvedsFile.writeAsString("ONNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
    } else if(getSolvedsAsString.length == 25 && getSolvedsAsString[24] == 'Y') {
        await solvedsFile.writeAsString(getSolvedsAsString + "ONNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
    } else if(getSolvedsAsString.length == 25) {
      await solvedsFile.writeAsString(getSolvedsAsString + "NNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNNN");
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

      if(index != 199) {
        newSolveds = newSolveds.replaceRange(index + 1, index + 2, "O");
      }

      await solvedsFile.writeAsString(newSolveds);
      solvedsAsString = await solvedsFile.readAsString();
    }
  }
}
