#!/bin/sh

OUTPUT_DIR=$(mktemp -d -t zapptool-release)
BUILD_OUTPUT_DIR="$OUTPUT_DIR"/build
RELEASE_OUTPUT_DIR="$OUTPUT_DIR"/release

echo xcodebuild -scheme "FeedDemo-Swift" \
                -workspace 'FeedDemo-Swift.xcworkspace' \
                -configuration Release \
                -sdk iphonesimulator \
                -destination "platform=iOS Simulator,name=iPad Retina,OS=latest" \
                CONFIGURATION_BUILD_DIR=$BUILD_OUTPUT_DIR \
                 "$@" 2>&1 \
                 build

xcodebuild  -scheme "FeedDemo-Swift" \
            -workspace 'FeedDemo-Swift.xcworkspace' \
            -configuration Release \
            -sdk iphonesimulator \
            -destination "platform=iOS Simulator,name=iPad Retina,OS=latest" \
            CONFIGURATION_BUILD_DIR=$BUILD_OUTPUT_DIR \
            "$@" 2>&1 \
            build
