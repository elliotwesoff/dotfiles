#ifndef ELLID_BAT
#define ELLID_BAT

#include <stdio.h>
#include <stdlib.h>
#include <stdbool.h>
#include <unistd.h>
#include <sys/stat.h>
#include <string.h>
#include <libudev.h>


static const int alert_lvl = 20;
static bool initial_alert = false;
static int last_bat_i = 100, last_alert_lvl = 100;

static void alert(const char* bat, int bat_i) {
  int order = bat_i < 10 ? 1 : 2;
  char* cmd_base = "notify-send --urgency=critical \"battery low\" \"";
  char* cmd = malloc(strlen(cmd_base) + strlen(bat) + 10);
  strcpy(cmd, cmd_base);
  strncat(cmd, bat, order);
  strcat(cmd, "%\"");
  system(cmd);
  free(cmd);
}

static void check_bat(const char* bat) {
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

  int bat_i = atoi(bat);

  if (bat_i == last_bat_i) {
    // case 1 - do nothing
  } else if (bat_i <= alert_lvl) {
    if (initial_alert) {
      if (bat_i % 5 == 0 && bat_i < last_alert_lvl) {
        alert(bat, bat_i);
        last_alert_lvl = bat_i;
      }
    } else {
      alert(bat, bat_i);
      initial_alert = true;
      last_alert_lvl = bat_i;
    }
  } else if (initial_alert && bat_i > alert_lvl) {
    initial_alert = false;
    last_alert_lvl = 100;
  }

  last_bat_i = bat_i;
}

int main() {
  printf("***** ellid - battery monitor startup *****\n");

  struct udev *udev;
  struct udev_monitor *mon;
  struct udev_device *dev;
  int fd;

  udev = udev_new();
  if (!udev) {
    fprintf(stderr, "Can't create udev\n");
    exit(1);
  }

  // set up a monitor to listen for events from the power_supply subsystem
  dev = udev_device_new_from_subsystem_sysname(udev, "power_supply", "BAT1");
  mon = udev_monitor_new_from_netlink(udev, "udev");
  udev_monitor_filter_add_match_subsystem_devtype(mon, "power_supply", NULL);
  udev_monitor_enable_receiving(mon);

  fd = udev_monitor_get_fd(mon); // get the file descriptor for the monitor

  while (1) {
    fd_set fds; // receive device events
    FD_ZERO(&fds);
    FD_SET(fd, &fds);

    int ret = select(fd + 1, &fds, NULL, NULL, NULL); // Wait for an event to occur

    if (ret > 0 && FD_ISSET(fd, &fds)) {
      dev = udev_monitor_receive_device(mon); // Get the device that caused the event
      if (dev) {
        const char *capacity = udev_device_get_property_value(dev, "POWER_SUPPLY_CAPACITY");
        printf("received battery level: %s\n", capacity);
        check_bat(capacity);
        udev_device_unref(dev);
      }
    } else {
      printf("select() returned %i. exiting ellid_bat.", ret);
      break;
    }
  }

  udev_unref(udev);
}

#endif
