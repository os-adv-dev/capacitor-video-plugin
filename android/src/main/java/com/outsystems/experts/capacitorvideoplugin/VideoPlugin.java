package com.outsystems.experts.capacitorvideoplugin;

import android.content.Intent;
import android.net.Uri;
import com.getcapacitor.Plugin;
import com.getcapacitor.PluginCall;
import com.getcapacitor.PluginMethod;
import com.getcapacitor.annotation.CapacitorPlugin;

@CapacitorPlugin(name = "Video")
public class VideoPlugin extends Plugin {

    private static final String NO_URL_PROVIDED = "No video URL provided";

    @PluginMethod
    public void playVideo(PluginCall call) {
        String videoUrl = call.getString("video");

        if (videoUrl == null || videoUrl.isEmpty()) {
            call.reject(NO_URL_PROVIDED);
            return;
        }

        try {
            Intent intent = new Intent(Intent.ACTION_VIEW);
            intent.setDataAndType(Uri.parse(videoUrl), "video/*");
            intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);

            // Start the intent to play the video
           // getContext().startActivity(intent);
            call.resolve();
        } catch (Exception e) {
            call.reject("Failed to open video player", e);
        }


    }
}
