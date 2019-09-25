
uint FUN_0804928c(char *param_1)

{
  size_t sVar1;
  uint uVar2;
  char *pcVar3;
  ulonglong uVar4;
  
  sVar1 = strlen(param_1);
  if (sVar1 == 0xf) {
    pcVar3 = strstr(param_1,"nactf{");
    if (param_1 == pcVar3) {
      if (param_1[0xe] == '}') {
        uVar4 = FUN_080491b6(param_1 + 6);
        uVar2 = ((uint)(uVar4 ^ 0x1371fcaacf98) | (uint)((uVar4 ^ 0x1371fcaacf98) >> 0x20)) &
                0xffffff00 | (uint)(uVar4 == 0x1371fcaacf98);
      }
      else {
        uVar2 = 0;
      }
    }
    else {
      uVar2 = 0;
    }
  }
  else {
    uVar2 = 0;
  }
  return uVar2;
}

