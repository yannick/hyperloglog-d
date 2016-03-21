module hyperloglog;

import core.stdc.config;

extern (C):

alias _Anonymous_0 HyperLogLog;

struct _Anonymous_0
{
    char encoding;
    c_long card;
    ubyte p;
    int mlen;
    ubyte[16384] registers;
}

int hll_create (HyperLogLog* hll);
int hll_add (HyperLogLog* hll, ubyte* ele, size_t elesize);
ulong hll_count (HyperLogLog* hll);