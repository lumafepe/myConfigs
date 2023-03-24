#!/bin/sh
if [ $(lenopow -s | grep "Battery protection: DISABLED" | wc -c) -eq 0 ]
then
  lenopow -d
  echo ""
else
  lenopow -e
  echo ""
fi