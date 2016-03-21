module main;

import std.stdio;
import std.conv;
import std.string;

//expects lines of uniqe strings from stdin,
//counts the number of lines and compares the error between the cardinality and the number of lines
void main(string[] args)
{

  import deimos.hyperloglog;

  HyperLogLog hll;
  hll.init();
  long cnt;
  double[] errors;
  foreach (line; stdin.byLine())
  {
    cnt++;
    hll.add(cast(string)line);
    ulong hllcnt = hll.count; 
    long diff = cnt - hllcnt;
    import std.math : abs;
    double err = abs((( cast(double) hllcnt / cast(double)cnt) - 1.0)*100); 
    errors ~= err;
    writeln(cnt, "\t", hllcnt, "\t", diff, "\t", err);
  }
  stderr.writeln("avg Error: ", avg(errors), " %");
}


//from https://dlang.org/phobos/std_numeric.html#.FPTemporary
double avg(in double[] a)
{
    import std.numeric;
    if (a.length == 0) return 0;
    FPTemporary!double result = 0;
    foreach (e; a) result += e;
    return result / a.length;
}
