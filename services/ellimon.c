#include <stdio.h>
#include <unistd.h>
#include <stdbool.h>
#include <stdlib.h>
#include <string.h>
#include <sys/stat.h>


int main(int argc, char* argv[]) {
  char* fpath = "/sys/class/power_supply/BAT1/capacity";
  const int alert_lvl = 20;
  bool alerted = false;
  int bat_i = 0;
  struct stat sb;

  while (1) {
    if (stat(fpath, &sb) == -1) {
      perror("stat");
      exit(EXIT_FAILURE);
    }

    FILE* batf = fopen(fpath, "r");
    char* bat = malloc(sb.st_size);
    fread(bat, sb.st_size, 1, batf);
    fclose(batf);

    bat_i = atoi(bat);

    if (bat_i <= alert_lvl && !alerted) {
      int order = bat_i < 10 ? 1 : 2;
      char* cmd_base = "notify-send --urgency=critical \"battery low\" \"";
      char* cmd = malloc(strlen(cmd_base) + sb.st_size + order);
      strcpy(cmd, cmd_base);
      strncat(cmd, bat, order);
      strcat(cmd, "%\"");
      system(cmd);
      free(cmd);
      alerted = true;
    } else if (bat_i > alert_lvl) {
      alerted = false;
    }

    free(bat);
    sleep(30);
  }

  return 0;
}
