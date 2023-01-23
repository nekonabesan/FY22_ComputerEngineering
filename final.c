#include <stdlib.h>
#include <time.h>
#include <stdio.h>

#define NACCESS (1024*1024*1024)

int main(int ac, char **av){
  int arg1 = atoi(av[1]);	/* 第一引数 */
  int size = (1 << arg1);   /* ワード数 = (2 の arg1乗) */
  int *v = (int *)malloc(size * 4);  /* 4倍して byte 数に変換 */

  int upto = 80;
  int delta;
  int n;
  int i;
  clock_t start, end;
  double cpu_time;
  int sum;
  int size1 = size - 1;
  
  for(i=0; i<size; i++) v[i] = i; /* 確保した領域を初期化（値に意味なし） */

  for(delta = 0; delta <= upto; delta++){
    i = 0;
    sum = 0;
    start = clock();
    for(n = NACCESS; n>0; n--){
      sum += v[i];		/* 合計の計算に意味はない */
      i = (i + delta) & size1;
    }
    end = clock();
    cpu_time = ((double)(end - start)) / CLOCKS_PER_SEC;
    printf("%d %lf\n", delta, cpu_time);
  }
  return(sum);			/* 返り値に意味はない */
}

  
