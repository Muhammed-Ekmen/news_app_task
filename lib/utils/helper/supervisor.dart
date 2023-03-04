abstract class Supervizor {
  nillable({dynamic willCheck, dynamic nill, dynamic notNil}) => willCheck == null ? nill : notNil;
}
