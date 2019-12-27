//
//  ios-glue.h
//  xm8-ios
//
//  Created by Yoshi Sugawara on 12/12/16.
//
//

#ifndef ios_glue_h
#define ios_glue_h

#include "SDL_syswm.h"
#include "openbor.h"

extern unsigned ios_touchstates[MAXTOUCHB];

void ios_get_base_path(char *path);
void ios_get_screen_width_height(int *width, int *height);
void ios_after_window_create(SDL_Window *window);

#endif /* ios_glue_h */
