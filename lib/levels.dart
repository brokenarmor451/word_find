import 'level.dart';

class Level1 extends Level{
  final List<String> letters = """
    JEKKLE
    TBLUEP
    OOEETY
    RCREDC
    UALLEA
    ORFFET
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [7, 19, 20, 23];
  final List<int> ends = [10, 31, 22, 35];
  final List<List<int>> wordsIndices = [
    [7,8,9,10],
    [19,25,31],
    [20,21,22],
    [23,29,35],
  ];

  final List<String> words = [
    "BLUE",
    "CAR",
    "RED",
    "CAT",
  ];
}

class Level2 extends Level{
  final List<String> letters = """
    DFGHDC
    AARBOT
    VEATGI
    YGYFFM
    VGBBTE
    TCEKOO
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [2,4,13,11];
  final List<int> ends = [20,16,25,29];
  final List<List<int>> wordsIndices = [
    [2,8,14,20],
    [4,10,16],
    [13,19,25],
    [11,17,23,29],
  ];

  final List<String> words = [
    "GRAY",
    "DOG",
    "EGG",
    "TIME",
  ];
}

class Level3 extends Level{
  final List<String> letters = """
    DEEAYO
    CABBTB
    AGVOVR
    KEDUDA
    EGYTTI
    VCDDEN
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [3,7,6,11];
  final List<int> ends = [27,19,24,35];
  final List<List<int>> wordsIndices = [
    [3,9,15,21,27],
    [7,13,19],
    [6,12,18,24],
    [11,17,23,29,35],
  ];

  final List<String> words = [
    "ABOUT",
    "AGE",
    "CAKE",
    "BRAIN",
  ];
}

class Level4 extends Level{
  final List<String> letters = """
    OOVBOX
    TZOKGZ
    DARKVO
    EAKLLO
    EATZZN
    EAIIBO
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [3,11,12,24];
  final List<int> ends = [5,23,15,26];
  final List<List<int>> wordsIndices = [
    [3,4,5],
    [11,17,23],
    [12,13,14,15],
    [24,25,26],
  ];

  final List<String> words = [
    "BOX",
    "ZOO",
    "DARK",
    "EAT",
  ];
}

class Level5 extends Level{
  final List<String> letters = """
    GOLDBC
    VEFODD
    EAISST
    KSSLMN
    OTHPRS
    FIREYY
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [7,8,30,0];
  final List<int> ends = [25,26,33,3];
  final List<List<int>> wordsIndices = [
    [7,13,19,25],
    [8,14,20,26],
    [30,31,32,33],
    [0,1,2,3],
  ];

  final List<String> words = [
    "EAST",
    "FISH",
    "FIRE",
    "GOLD",
  ];
}

class Level6 extends Level{
  final List<String> letters = """
    FOLMNE
    SIYKUY
    FOMSKK
    NEKISI
    NNNTUP
    NEWFOX
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [28,15,30,33];
  final List<int> ends = [29,27,32,35];
  final List<List<int>> wordsIndices = [
    [28,29],
    [15,21,27],
    [30,31,32],
    [33,34,35],
  ];

  final List<String> words = [
    "UP",
    "SIT",
    "NEW",
    "FOX",
  ];
}

class Level7 extends Level{
  final List<String> letters = """
    CABLOK
    YPVOTE
    PAPERL
    OPONON
    CABLEW
    YLONEX
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [24,12,32,8];
  final List<int> ends = [28,16,34,11];
  final List<List<int>> wordsIndices = [
    [24,25,26,27,28],
    [12,13,14,15,16],
    [32,33,34],
    [8,9,10,11],
  ];

  final List<String> words = [
    "CABLE",
    "PAPER",
    "ONE",
    "VOTE",
  ];
}

class Level8 extends Level{
  final List<String> letters = """
    DOWYMC
    CDCOML
    LYDYOU
    UEOMCE
    WOWSOO
    OMNSWT
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [5,14,7,22];
  final List<int> ends = [23,32,19,34];
  final List<List<int>> wordsIndices = [
    [5,11,17,23],
    [14,20,26,32],
    [7,13,19],
    [22,28,34],
  ];

  final List<String> words = [
    "CLUE",
    "DOWN",
    "DYE",
    "COW",
  ];
}

class Level9 extends Level{
  final List<String> letters = """
    KNPLNY
    KYEPNY
    NKNEWK
    OHIGHY
    WHIGLE
    WWNOWS
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [19,6,23,32];
  final List<int> ends = [22,24,35,33];
  final List<List<int>> wordsIndices = [
    [19,20,21,22],
    [6,12,18,24],
    [23,29,35],
    [32,33],
  ];

  final List<String> words = [
    "HIGH",
    "KNOW",
    "YES",
    "NO",
  ];
}

class Level10 extends Level{
  final List<String> letters = """
    RAIWON
    HAHXWE
    HOAHRA
    ALRARA
    RMDROK
    RAILNN
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [30,8,10,28];
  final List<int> ends = [33,26,11,29];
  final List<List<int>> wordsIndices = [
    [30,31,32,33],
    [8,14,20,26],
    [10,11],
    [28,29],
  ];

  final List<String> words = [
    "RAIL",
    "HARD",
    "WE",
    "OK",
  ];
}

class Level11 extends Level{
  final List<String> letters = """
    LATSSN
    LTEAAO
    ATEYWW
    TTELLS
    ETEWOA
    LALYOL
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [5,6,3,19];
  final List<int> ends = [17,24,15,22];
  final List<List<int>> wordsIndices = [
    [5,11,17],
    [6,12,18,24],
    [3,9,15],
    [19,20,21,22],
  ];

  final List<String> words = [
    "NOW",
    "LATE",
    "SAY",
    "TELL",
  ];
}

class Level12 extends Level{
  final List<String> letters = """
    DRADBA
    ABLOAB
    DEABLL
    DRAGAE
    ACICCD
    DACIDR
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [5,31,3,18];
  final List<int> ends = [23,34,9,21];
  final List<List<int>> wordsIndices = [
    [5,11,17,23],
    [31,32,33,34],
    [3,9],
    [18,19,20,21],
  ];

  final List<String> words = [
    "ABLE",
    "ACID",
    "DO",
    "DRAG"
  ];
}

class Level13 extends Level{
  final List<String> letters = """
    GOFEOV
    GEFEWD
    OIEIGR
    OGGOLE
    DHFECA
    ETEIGM
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [11,7,8,6];
  final List<int> ends = [35,31,10,24];
  final List<List<int>> wordsIndices = [
    [11,17,23,29,35],
    [7,13,19,25,31],
    [8,9,10],
    [6,12,18,24],
  ];

  final List<String> words = [
    "DREAM",
    "EIGHT",
    "FEW",
    "GOOD"
  ];
}

class Level14 extends Level{
  final List<String> letters = """
    GINDEX
    UHAITV
    LKHAIR
    KENHAI
    IYINDE
    GUGUNZ
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [32,14,1,13];
  final List<int> ends = [34,17,5,25];
  final List<List<int>> wordsIndices = [
    [32,33,34],
    [14,15,16,17],
    [1,2,3,4,5],
    [13,19,25],
  ];

  final List<String> words = [
    "GUN",
    "HAIR",
    "INDEX",
    "KEY",
  ];
}

class Level15 extends Level{
  final List<String> letters = """
    LANYLL
    MENUAA
    MNMENN
    NINODW
    ZNLAST
    MENIZZ
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [4,26,6,13];
  final List<int> ends = [22,29,9,31];
  final List<List<int>> wordsIndices = [
    [4,10,16,22],
    [26,27,28,29],
    [6,7,8,9],
    [13,19,25,31],
  ];

  final List<String> words = [
    "LAND",
    "LAST",
    "MENU",
    "NINE",
  ];
}

class Level16 extends Level{
  final List<String> letters = """
    TABLOT
    RRAINA
    AKINZB
    IKINDL
    RACEXE
    KINUKI
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [7,24,5,19];
  final List<int> ends = [10,27,29,22];
  final List<List<int>> wordsIndices = [
    [7,8,9,10],
    [24,25,26,27],
    [5,11,17,23,29],
    [19,20,21,22],
  ];

  final List<String> words = [
    "RAIN",
    "RACE",
    "TABLE",
    "KIND",
  ];
}

class Level17 extends Level{
  final List<String> letters = """
    TLEAVE
    HTHOLE
    ELSTEZ
    TASTEP
    HMLEAV
    YPLAMC
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [1,13,20,0];
  final List<int> ends = [5,31,23,12];
  final List<List<int>> wordsIndices = [
    [1,2,3,4,5],
    [13,19,25,31],
    [20,21,22,23],
    [0,6,12],
  ];

  final List<String> words = [
    "LEAVE",
    "LAMP",
    "STEP",
    "THE",
  ];
}

class Level18 extends Level{
  final List<String> letters = """
    WHAASI
    YWHATY
    SPEPYO
    ISIEOP
    ZYOAUE
    EPERWA
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [7,12,16,15];
  final List<int> ends = [10,30,28,33];
  final List<List<int>> wordsIndices = [
    [7,8,9,10],
    [12,18,24,30],
    [16,22,28],
    [15,21,27,33],
  ];

  final List<String> words = [
    "WHAT",
    "SIZE",
    "YOU",
    "PEAR",
  ];
}

class Level19 extends Level{
  final List<String> letters = """
    NAMOJJ
    JNAMEO
    AMAOON
    LMMNNJ
    JAACCA
    APTEOR
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [15,7,19,23];
  final List<int> ends = [33,10,31,35];
  final List<List<int>> wordsIndices = [
    [15,21,27,33],
    [7,8,9,10],
    [19,25,31],
    [23,29,35],
  ];

  final List<String> words = [
    "ONCE",
    "NAME",
    "MAP",
    "JAR",
  ];
}

class Level20 extends Level{
  final List<String> letters = """
    ICEHHA
    ICOHEA
    HILHAH
    IJHIRI
    COELTL
    ABALOT
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [19,0,4,15];
  final List<int> ends = [31,2,28,33];
  final List<List<int>> wordsIndices = [
    [19,25,31],
    [0,1,2],
    [4,10,16,22,28],
    [15,21,27,33],
  ];

  final List<String> words = [
    "JOB",
    "ICE",
    "HEART",
    "HILL",
  ];
}

class Level21 extends Level{
  final List<String> letters = """
    CORASR
    ECORAL
    REALRS
    SEEZES
    HONNAE
    CHOWDO
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [31,7,16,18];
  final List<int> ends = [33,11,34,20];
  final List<List<int>> wordsIndices = [
    [31,32,33],
    [7,8,9,10,11],
    [16,22,28,34],
    [18,19,20],
  ];

  final List<String> words = [
    "HOW",
    "CORAL",
    "READ",
    "SEE",
  ];
}

class Level22 extends Level{
  final List<String> letters = """
    PENPPE
    TTEEAR
    EBRNEE
    AORCAA
    MOBIOL
    TKRLEA
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [11,3,13,6];
  final List<int> ends = [29,33,31,24];
  final List<List<int>> wordsIndices = [
    [11,17,23,29],
    [3,9,15,21,27,33],
    [13,19,25,31],
    [6,12,18,24],
  ];

  final List<String> words = [
    "REAL",
    "PENCIL",
    "BOOK",
    "TEAM",
  ];
}

class Level23 extends Level{
  final List<String> letters = """
    RIGHTL
    RIGHCT
    LEFLOR
    COUNUA
    RIGHNI
    LEFTTN
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [11,10,0,30];
  final List<int> ends = [35,34,4,33];
  final List<List<int>> wordsIndices = [
    [11,17,23,29,35],
    [10,16,22,28,34],
    [0,1,2,3,4],
    [30,31,32,33],
  ];

  final List<String> words = [
    "TRAIN",
    "COUNT",
    "RIGHT",
    "LEFT",
  ];
}

class Level24 extends Level{
  final List<String> letters = """
    ROPSPI
    RPINRO
    OSPISP
    PENDPI
    EROPIN
    PINZNK
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [19,6,17,16];
  final List<int> ends = [21,24,35,34];
  final List<List<int>> wordsIndices = [
    [19,20,21],
    [6,12,18,24],
    [17,23,29,35],
    [16,22,28,34],
  ];

  final List<String> words = [
    "END",
    "ROPE",
    "PINK",
    "SPIN",
  ];
}

class Level25 extends Level{
  final List<String> letters = """
    TGIVGM
    MEETOG
    JGJJGI
    TMOGIV
    MEIMEE
    MTNGIV
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [9,11,14,19];
  final List<int> ends = [10,29,32,31];
  final List<List<int>> wordsIndices = [
    [9,10],
    [11,17,23,29],
    [14,20,26,32],
    [19,25,31],
  ];

  final List<String> words = [
    "TO",
    "GIVE",
    "JOIN",
    "MET",
  ];
}

class Level26 extends Level{
  final List<String> letters = """
    MAKPDA
    DROALL
    MRDDRL
    DMARDO
    ALLOAW
    MAKESW
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [5,18,14,30];
  final List<int> ends = [29,3,35,34];
  final List<List<int>> wordsIndices = [
    [5,11,17,23,29],
    [18,13,8,3],
    [14,21,28,35],
    [30,31,32,33,34],
  ];

  final List<String> words = [
    "ALLOW",
    "DROP",
    "DRAW",
    "MAKES",
  ];
}

class Level27 extends Level{
  final List<String> letters = """
    MADAMA
    PAPDPR
    DMPVOL
    MAESLM
    MRPAMA
    PPMMDAL
  """.replaceAll(" ", "").replaceAll("\n", "").split("");

  final List<int> starts = [9,32,0,30];
  final List<int> ends = [16,17,21,15];
  final List<List<int>> wordsIndices = [
    [9,16],
    [32,27,22,17],
    [0,7,14,21],
    [30,25,20,15],
  ];

  final List<String> words = [
    "DO",
    "MALL",
    "MAPS",
    "PREV",
  ];
}
