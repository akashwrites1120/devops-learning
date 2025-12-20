#!/bin/bash

echo "The date is"
date | awk '{print $1, $2, $3}'

echo "The time is"
date | awk '{print $5, $6}'

echo $SHELL -> to check i am in shell or not