#!/bin/bash
apt install libbz2-dev libbrotli-dev libdivsufsort-dev -y

git clone --depth 1 https://android.googlesource.com/platform/external/bsdiff

cp bsdiff_jni.cc bsdiff/
cp com_google_archivepatcher_generator_bsdiff_wrapper_BsDiffNativePatchWriter.h bsdiff/

cd bsdiff
git clone --depth 1 https://github.com/abseil/abseil-cpp.git
git clone --depth 1 https://github.com/google/brotli.git

git apply ../make.patch

make
strip *.so
