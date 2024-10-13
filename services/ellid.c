#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>

const int alert_lvl = 20;

void alert(char* bat, int fsize, int bat_i) {
  int order = bat_i < 10 ? 1 : 2;
  char* cmd_base = "notify-send --urgency=critical \"battery low\" \"";
  char* cmd = malloc(strlen(cmd_base) + fsize + order);
  strcpy(cmd, cmd_base);
  strncat(cmd, bat, order);
  strcat(cmd, "%\"");
  system(cmd);
  free(cmd);
}

int main(int argc, char* argv[]) {
  const char* fpath = "/sys/class/power_supply/BAT1/capacity";
  bool initial_alert = false;
  int bat_i = 0, last_bat_i = 100, last_alert_lvl = 100;
  struct stat fstat;

  while (1) {
    if (stat(fpath, &fstat) == -1) {
      perror("stat");
      exit(EXIT_FAILURE);
    }

    FILE* bat_f = fopen(fpath, "r");
    char* bat = malloc(fstat.st_size);
    fread(bat, fstat.st_size, 1, bat_f);
    fclose(bat_f);

    bat_i = atoi(bat);

    // the idea is:
    // 1. if the battery is charging, do nothing.
    // 2. if the battery is below the threshold, alert for the
    //    first time no matter the level.
    // 3. if an alert has already been sent for going below the
    //    threshold, only send later alerts for levels
    //    divisible by 5 (15%, 10%, 5%).
    // 4. if the battery charges past the threshold, reset to
    //    initial state to start the process over if it again
    //    falls below the threshold.

    if (bat_i == last_bat_i) { // do nothing
    } else if (bat_i <= alert_lvl) {
      if (initial_alert) {
        if (bat_i % 5 == 0 && bat_i < last_alert_lvl) {
          alert(bat, fstat.st_size, bat_i);
          last_alert_lvl = bat_i;
        }
      } else {
        alert(bat, fstat.st_size, bat_i);
        initial_alert = true;
        last_alert_lvl = bat_i;
      }
    } else if (initial_alert && bat_i > alert_lvl) {
      initial_alert = false;
      last_alert_lvl = 100;
    }

    last_bat_i = bat_i;

    free(bat);
    sleep(30);
  }

  return 0;
}
