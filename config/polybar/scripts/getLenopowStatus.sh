#!/bin/sh
if [ $(lenopow -s | grep "Battery protection: DISABLED" | wc -c) -eq 0 ]
then
  echo ""
else
  echo ""
fi
