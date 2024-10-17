import { WebPlugin } from '@capacitor/core';

import type { VideoPlugin } from './definitions';

export class VideoWeb extends WebPlugin implements VideoPlugin {
  async playVideo(options: { video: string }): Promise<void> {
    console.log(options);
    return;
  }
}
