#include <stdio.h>
#include <stdlib.h>

int main(int argc, char *argv[]) {
  unsigned long long reps = atoll(argv[1]);

  for (int i = 0; i < reps; i++) {
    printf("hello\n");
  }

  return 0;
}
