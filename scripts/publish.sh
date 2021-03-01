#!/bin/bash

# Publishes my site to S3
aws s3 sync public/ s3://eazevedo.xyz
