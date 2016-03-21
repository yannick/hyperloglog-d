module main;

import std.stdio;
import std.conv;
import std.string;
void main(string[] args)
{

  import deimos.hyperloglog;

  HyperLogLog hll;
  int res =  hll_create(&hll);
  string dta =   "something";

  int addres = hll_add(&hll, cast(ubyte*) dta.ptr , dta.length);
  ulong res2 =  hll_count(&hll);

}