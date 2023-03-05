abstract class Supervizor {
  nillable({dynamic willCheck, dynamic nill, dynamic notNil}) => willCheck == null ? nill : notNil;
  binaryCondition({dynamic trueCondition, dynamic convenient, dynamic inconvenient}) => trueCondition == true ? convenient : inconvenient;
}
