/**
 * this script was created to be the (shitty) C successor
 * to the activate_display.rb script. the old description
 * in the ruby version was:
 *
 * this file should be executed automatically via a udev rule when an external
 * display is hotplugged. we will use bytes 8-11 for identifying a display. see
 * this page for information about EDID header format:
 * https://en.wikipedia.org/wiki/Extended_Display_Identification_Data#EDID_1.4_data_format
 * example edid: 00 ff ff ff ff ff ff 00 10 ac 32 a1 4c 31 47 30
 */

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdbool.h>
#include <sys/stat.h>

typedef struct {
  char* edid;
  char* layout_script;
  char* dpi;
  char* name;
} display_t;

void build_display_cmd(display_t* display, char* cmd) {
  strcpy(cmd, "sh ");
  strcat(cmd, display->layout_script);
}

void build_dpi_cmd(display_t* display, char* cmd) {
  strcpy(cmd, "sh ");
  strcat(cmd, "/home/elliot/dotfiles/scripts/dpi ");
  strcat(cmd, display->dpi);
}

void apply_layout(display_t* display) {
  char* display_cmd = malloc(200);
  char* dpi_cmd = malloc(200);
  FILE *display_fp, *dpi_fp;
  build_display_cmd(display, display_cmd);
  build_dpi_cmd(display, dpi_cmd);
  printf("layout command: \"%s\"\n", display_cmd);
  display_fp = popen(display_cmd, "r");
  if (display_fp == NULL) {
    printf("layout command failed!\n");
    return;
  }
  pclose(display_fp);
  dpi_fp = popen(dpi_cmd, "r");
  if (dpi_cmd == NULL) {
    printf("dpi command failed!\n");
    return;
  }
  pclose(dpi_fp);
  free(display_cmd);
  free(dpi_cmd);
}

int main(int argc, char* argv[]) {
  char xrandr_line[1000];
  bool read_next = false;
  char* edids[10];
  int edids_idx = 0;
  FILE *xrandr_fp;

  display_t framework     = { "09e55f09", "/home/elliot/dotfiles/.screenlayout/framework-int.sh", "140", "framework" },
            asus_27       = { "06b30427", "/home/elliot/dotfiles/.screenlayout/asus-27in.sh", "96", "asus 27 in." },
            unlv_dell     = { "10ac32a1", "/home/elliot/dotfiles/.screenlayout/unlv-dell.sh", "96", "dell widescreen in TBE B" },
            seo_benq      = { "09d1ed78", "/home/elliot/dotfiles/.screenlayout/seo-benq.sh", "96", "seo's crappy BenQ monitor" },
            external_auto = { "xxxxxxxx", "/home/elliot/dotfiles/.screenlayout/external-auto.sh", "96", "???" };

  display_t known_displays[] = { framework, asus_27, unlv_dell, seo_benq };

  xrandr_fp = popen("/usr/bin/xrandr --prop", "r");

  if (xrandr_fp == NULL) {
    printf("Failed to run `xrandr --prop` command\n");
    exit(1);
  }

  // extract edids from xrandr output
  while (fgets(xrandr_line, sizeof(xrandr_line), xrandr_fp) != NULL) {
    if (read_next) {
      char* xline_ptr = xrandr_line;
      char* edid = malloc(9);
      xline_ptr += 18;
      strncpy(edid, xline_ptr, 8);
      edids[edids_idx++] = edid;
      read_next = false;
      continue;
    }
    if (strstr(xrandr_line, "EDID") != NULL) {
      read_next = true;
      continue;
    }
  }

  pclose(xrandr_fp);

  printf("%i displays found. ", edids_idx);
  bool applied_layout = false;

  // try to apply correct screenlayout file
  if (edids_idx > 2) {
    printf("not sure what to do... ABORT!\n");
    exit(1); // should we clean up before exit?
  } else if (edids_idx == 1) {
    printf("using framework internal display.\n");
    apply_layout(&framework);
    applied_layout = true;
  } else {
    printf("looking for known screenlayout...\n");
    for (int i = 0; i < edids_idx; i++) {
      printf("EDID %i: %s\n", i + 1, edids[i]);
      if (strcmp(edids[i], framework.edid) == 0) {
        printf("skipping framework display\n");
        continue;
      }
      for (int j = 0; j < 4; j++) {
        display_t d = known_displays[j];
        if (strcmp(edids[i], d.edid) == 0) {
          printf("found known display: %s, edid: %s\n", d.name, d.edid);
          apply_layout(&d);
          applied_layout = true;
          break;
        }
      }
      if (applied_layout) {
        break;
      }
    }
  }

  if (!applied_layout) {
    printf("no known layout for current monitor configuration... jesus take the wheel!\n");
    apply_layout(&external_auto);
  }

  // clean up
  for (int i = 0; i < edids_idx; i++) {
    free(edids[i]);
  }

  printf("success! exiting\n");

  return 0;
}

