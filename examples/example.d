module main;

import std.stdio;
import std.conv;
import std.string;
void main(string[] args)
{

  import deimos.hyperloglog;

  HyperLogLog hll;
  int create_ret =  hll_create(&hll);
  writeln("create: ", create_ret);
  string dta =   "something";

  int add_ret = hll_add(&hll, cast(ubyte*) dta.ptr , dta.length);
  writeln("add ret: ", add_ret);
  ulong res2 =  hll_count(&hll);
  writeln("hll count: ", res2);
}