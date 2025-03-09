#!/bin/bash

PLUGIN_NAME="detonate"

cd scripting
spcomp $PLUGIN_NAME.sp -o ../plugins/$PLUGIN_NAME.smx
