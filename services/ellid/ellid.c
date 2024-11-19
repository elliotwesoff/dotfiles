#include <stdio.h>
#include <unistd.h>
#include <stdlib.h>
#include <sys/wait.h>


int main(int argc, char* argv[]) {

  printf("***** ellid - v.0.1.3 *****\n");

  pid_t ellid_bat_pid = fork();

  if (ellid_bat_pid < 0) {
    printf("fork() failed for ellid_bat\n");
  } else if (ellid_bat_pid == 0) {
    execl("/usr/local/bin/ellid_bat", "ellid_bat", (char *)NULL);
  } else {
    int ellid_bat_status;
    printf("waiting for ellid_bat to exit...\n");
    if (waitpid(ellid_bat_pid, &ellid_bat_status, 0) == -1) {
      perror("waitpid for ellid_bat failed");
      exit(EXIT_FAILURE);
    }
  }

  printf("exiting ellid normally.\n");
  return 0;
}
