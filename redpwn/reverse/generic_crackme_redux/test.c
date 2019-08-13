
ulong FUN_00101169(int iParm1)

{
  return (ulong)(iParm1 * 10 & 0xffffff00U | (uint)(iParm1 * 10 == 0xac292));
}

