# docker

## Summary

A playground for trying out git and Docker.

## Setup
Run the folling commands to start:
```
  cd bin
  ./reset_config.rb --preset
  ./configure.rb # answr all questions for pdftk and pdfocr
```

This will create files: ./config/pdftk.yml, ./config/pdfocr.yml
with assumed preset values.

## Building the images
The Dockerfile s are in ./build/pdf*/Dockerfile
Run the following commands to create the Docker images: pdftk and pdfocr
```
  cd build
  rake clean
  rake
```

After this the file build/rake.log will have the imformation about which images were built and their names

## TODO
Code for ./pipeline/Rakefile has to be migrated
