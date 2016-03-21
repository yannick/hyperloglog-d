module deimos.hyperloglog;

import core.stdc.config;

extern (C):

alias _Anonymous_0 HyperLogLog;

struct _Anonymous_0
{
    char encoding;
    c_long card;
    ubyte p;
    int mlen;
    ubyte[1 << 14] registers;

    void init()
    {
      hll_create(&this);
    }

    bool add(string el)
    {
      int cardinality_change = hll_add(&this, cast(ubyte*) el.ptr , el.length);
      bool ret = (cardinality_change == 1);
      return ret;
    }

    @property ulong count()
    {
      return hll_count(&this);
    }
}

int hll_create(HyperLogLog* hll);
int hll_add(HyperLogLog* hll, ubyte* ele, size_t elesize);
ulong hll_count(HyperLogLog* hll);