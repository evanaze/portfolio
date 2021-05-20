---
title: "How To: Use your iPhone as a Webcam in OBS on Arch Linux"
date: 2021-01-13
resources:
- name: featured-image
  src: arch-linux-logo.png

categories: [guide]
tags: [linux]
draft: false
---

If you have an iPhone and are a streamer, it turns out that you may be missing a very powerful tool sitting in your pocket, full of potential.
I, like many other use OBS Studio on Arch Linux, and if you do as well I think you will find this guide useful in setting up your iPhone as a webcam device for your stream.

There are two iPhone apps you want to look into for this purpose.
They both have very similar UI's and will likely work with this method - although I only tested the app that I use.
[HD Camera for OBS Studio](https://obsstudio.xyz/tutorial/) is subscription based, and [Camera for OBS Studio](https://obs.camera/) is a one-time purchase.
I went with the one-time payment option, and it looks to be of slightly higher quality as well.

Here are the steps to getting this setup to work on Arch Linux. You will also need a USB iPhone cable. Once you have both of those we cas get started!

## Step 1: Install OBS Sudio and the iPhone App
This is straight forward. First, you must have OBS Studio installed. 
If you already have that covered, just choose one of the apps mentioned above.
If you plan on using this for an extended amount of time, say more than half a year, then it is worth purchasing the app for $16.

## Step 2: Install A Dependency
This is where I spent most of the time getting stuck. We will be using the package [obs-plugin-ios-camera-source-git](https://aur.archlinux.org/packages/obs-plugin-ios-camera-source-git/) from the AUR.

But first, we need to installl a dependency. I prefer to use the `yay` package manager.

```
yay -S libimobiledevice
```

## Step 3: Install the OBS iOS Plugin
For this part, you need to use a third party package manager. Once you have that installed, you can do:

```
yay -S obs-plugin-ios-camera-source-git
```

This command will install the desired plugin in your `/usr/lib/obs-plugins/` directory.
But, we want to move it to `~/.config/obs-studio/plugins/`, specifically into two directories. 
You can make those with the following commands:

```
mkdir -p ~/.config/obs-studio/plugins/obs-ios-camera-source/bin/64bit
mkdir -p ~/.config/obs-studio/plugins/obs-ios-camera-source/data/locale
```

Now, you want to move the previously installed plugin into the `.../bin` directory. You may require `sudo` permissions for this step.

```
mv /usr/lib/obs-plugins/obs-ios-camera-source ~/.config/obs-studio/plugins/obs-ios-camera-source/bin/64bit/
```

Now, using your favorite text editor, create a file inside `.../bin/64bit` with the following contents:

```
OBSIOSCamera.Title="iOS Camera"
OBSIOSCamera.Settings.Latency="Latency"
OBSIOSCamera.Settings.Latency.Normal="Normal"
OBSIOSCamera.Settings.Latency.Low="Low"
OBSIOSCamera.Settings.UseHardwareDecoder="Enable Hardware Decoder"
OBSIOSCamera.Settings.DisconnectOnInactive="Disconnect When Inactive"
```

And that's all! From here, you can checkout the guide on your app's website for using the plugin and the app to get going.

## Conclusion
Hopefully after this guide you were able to get your iPhone working as a webcam on Arch Linux.
If you have any questions, feel free to reach out and hopefully I can help you with them. Happy filming!