---
title: "Captcha Image Solver"
date: 2020-07-15
resources:
- name: featured-image
  src: captcha_sample.png

categories: [projects]
tags: [machine learning, python]
draft: true
---

To check out the project, take a look at the [repo](https://github.com/evanaze/captcha).

## Background

I was browsing Reddit one day, and came across a post on the subreddit [r/MachineLearning](https://www.reddit.com/r/MachineLearning/), where somebody was asking for help to solve Captcha images, like the one here:

![](captcha_sample.png)

The captchas are a noisy image with verical lines on a colorful background, with between 1 and 9 squares added on top of a different pattern. I was immediately intrigued and knew that this is an interesting application of Machine Learning, and agreed to work on the project.  

He started by sending me 88 unlabeled captchas, just like the one above. My initial method was to use a [MNIST example](https://github.com/pytorch/examples/tree/master/mnist) repo in Pytorch. That did not go so well. First, I am embarrassed to say that I had data leakage and thought I had solved the problem by achieving 100% accuracy. When I removed the data leakage, I was down to just about random chance. Here is a much more realistic and functional approach to solving the problem.

## Methods
There are two main tools you will want to use in solving this problem: OpenCV, and Deep Learning. Unfortunately, I - at least - was not able to throw a simple CNN architecture at the problem and get it to work. Oddly enough, even after doing some advanced image processing in OpenCV, I could not do even close to well with Deep Learning, so I had to think of other ways to solve the problem.

### Method 1: OpenCV
Using OpenCV alone got me 90% of the way there. [OpenCV](https://opencv.org) is a library built in C++ for image processing, and can do some very powerful stuff. There is also a Python package for OpenCV called [opencv-python](https://pypi.org/project/opencv-python/), and here are the [tutorials](https://opencv-python-tutroals.readthedocs.io/en/latest/) if you are interested.

### Method 2: OpenCV + Deep Learning
For the last 8 to 10% of images, I figured something more needed to be done.