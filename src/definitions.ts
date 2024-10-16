export interface VideoPlugin {
  playVideo(options: { video: string}) : Promise<void>;
}
