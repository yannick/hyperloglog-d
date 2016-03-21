Bindings to Redis Hyperloglog datastructure.

Usage:

```
  import deimos.hyperloglog;
  HyperLogLog hll;
  hll.init();
  hll.add("one");
  hll.add("two");
  writeln(hll.count());
```

to create the object, compile the code:
gcc -c -Wall -Werror -fpic -fno-omit-frame-pointer -O3 C/hll.c -o extlib/x86_64-osx/hll.o
