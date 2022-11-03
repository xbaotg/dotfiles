#!/bin/sh

CUR_LIGHT_RAW=`brightnessctl g`
CUR_LIGHT=`echo $CUR_LIGHT_RAW`
MAX_LIGHT_RAW=`brightnessctl m`
MAX_LIGHT=`echo $MAX_LIGHT_RAW`

echo $((100 * CUR_LIGHT / MAX_LIGHT))
