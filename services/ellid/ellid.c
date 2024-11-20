#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>
#include <pthread.h>

#include "ellid_bat.h"

// pro tip: you can debug this program while it's running
// (even as a systemd unit) with: `sudo gdb -p [PID]`
// since using sudo, load your .gdbinit file with:
// `source ~/.gdbinit`

int main(int argc, char* argv[]) {

  printf("***** ellid - v.0.1.4 *****\n");

  pthread_t battery_mon;
  pthread_create(&battery_mon, NULL, ellid_bat_run, NULL);

  pthread_join(battery_mon, NULL);
  
  printf("exiting ellid normally.\n");
  return 0;
}
