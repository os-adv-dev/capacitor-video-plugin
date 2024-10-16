import { WebPlugin } from '@capacitor/core';

import type { VideoPlugin } from './definitions';

export class VideoWeb extends WebPlugin implements VideoPlugin {

  async playVideo(video: string): Promise<void> {
    console.log('Not implemented yet', video);
  }
}
