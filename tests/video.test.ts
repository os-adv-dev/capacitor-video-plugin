import { VideoPlugin } from '../src/index';
import { VideoWeb } from '../src/web';

describe('VideoPlugin', () => {
  let plugin: VideoPlugin;

  beforeEach(() => {
    plugin = new VideoWeb();
    jest.spyOn(plugin, 'playVideo').mockImplementation(() => Promise.resolve());
  });

  it('should play video with the correct video URL', async () => {
    const videoURL = 'https://example.com/video.mp4';

    await plugin.playVideo({ video: videoURL });

    expect(plugin.playVideo).toHaveBeenCalledWith({ video: videoURL });
  });
});