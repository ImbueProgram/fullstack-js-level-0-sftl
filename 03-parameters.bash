#!/usr/bin/env bash

###### POSITIONAL PARAMETERS ###########################################################################################
#
# Now you already know how to define local and environment variables. But
# what are you going to use when you need to get parameters from the
# outside? For those purposes you may use positional parameters.
#
# Positional parameters are variables allocated when a function is evaluated
# and they are given positionally. The following table lists positional
# parameter variables and other special variables and their meanings when
# you are inside a function.
#
# Parameter    Description
# ------------ -------------------------------------------------------
# $0           Script's name.
# $1 … $9      The parameter list elements from 1 to 9.
# ${10} … ${N} The parameter list elements from 10 to N.
# $* or $@     All positional parameters except $0.
# $#           The number of parameters, not counting $0.
# $FUNCNAME    The function name (has a value only inside a function).
#
# In the example below, the positional parameters will be $0='./script.sh', $1='foo' and $2='bar':
#
#     ./script.sh foo bar
#
###### Default values
#
# Variables may also have default values. We can define them as such using the following syntax:
#
#     # Assign FOO value 'default' if it's empty
#     FOO=${FOO:-'default'}
#
# Default values may be useful when you should process the positional parameters, which could be omitted.
#
########################################################################################################################

###### THE CHALLENGE: Exercise 3 of 11 #################################################################################
#
# Create a file named parameters.bash.
# Your program should output only the first, third and fifth positional parameters, which will be passed into your script.
# Before each argument must be its sequence number with a colon :. Every parameter must be outputted on separate lines.
# For example, if you run the script like so:
#     ./parameters.bash one two three four five six seven
#     The output must look like the following:
#         1: one
#         3: three
#         5: five
#
########################################################################################################################

echo "1: $1"
echo "3: $3"
echo "5: $5"

