#!/usr/bin/env bash

###### STREAMS PIPES AND LISTS #########################################################################################
#
# This exercise is very important because streams, pipes, and lists of commands are used everywhere. You will meet these
# strange > and | characters in almost any script. So let's discover the secret to what they exactly are.
#
###### Streams
#
# Bash receives input and sends output as sequences or streams of characters. These streams may be redirected into files
# or vice versa.
#
# There are three descriptors:
#
# |------|------------|-------------------------------------------------------------------------------------------------|
# | Code | Descriptor | Description                                                                                     |
# |------|------------|-------------------------------------------------------------------------------------------------|
# |   0  |    stdin   | The standard input.                                                                             |
# |   1  |   stdout   | The standard output.                                                                            |
# |   2  |   stderr   | The errors output.                                                                              |
# |------|------------|-------------------------------------------------------------------------------------------------|
#
# Redirection makes it possible to control where the output of a command goes to, and where the input of a command
# comes from. For redirecting streams these operators are used:
#
# https://www.gnu.org/software/bash/manual/bash.html#Redirections
# |---------|-----------------------------------------------------------------------------------------------------------|
# |Operator | Description                                                                                               |
# |---------|-----------------------------------------------------------------------------------------------------------|
# |    >    | Redirecting output                                                                                        |
# |   &>    | Redirecting output and error output                                                                       |
# |   &>>   | Appending redirected output and error output                                                              |
# |    <    | Redirecting input                                                                                         |
# |   <<    | [Here documents](http://tldp.org/LDP/abs/html/here-docs.html) syntax                                      |
# |   <<<   | [Here strings](http://www.tldp.org/LDP/abs/html/x17837.html)                                              |
# |---------|-----------------------------------------------------------------------------------------------------------|
#
# Here are a few examples of using redirections:
#
#     # output of ls will be written to list.txt
#     ls -l > list.txt
#
#     # append output to list.txt
#     ls -a >> list.txt
#
#     # all errors will be written to errors.txt
#     grep da * 2> errors.txt
#
#     # read from errors.txt
#     less < errors.txt
#
###### Pipes
#
# We could redirect standard streams not only in files, but also to other programs. Pipes let us use the output of a
# program as the input of another.
#
# In the example below, command1 sends its output to command2, which then passes it on to the input of command3:
#
#     command1 | command2 | command3
#
# Constructions like this are called pipelines.
#
# In practice, this can be used to process data through several programs.
# For example, here the output of ls -l is sent to the grep program, which prints only files with a .md extension, and
# this output is finally sent to the less program:
#
#     ls -l | grep .md$ | less
#
###### Lists of commands
#
# A list is a sequence of one or more pipelines separated by one of the operators ';', '&', '&&', or '||', and optionally
# terminated by one of ';', '&', or a newline.
# Of these list operators, '&&' and '||' have equal precedence, followed by ';' and '&', which have equal precedence.
#
# If a command is terminated by the control operator '&', the shell executes the command asynchronously in a subshell.
# This is known as executing the command in the background, and these are referred to as asynchronous commands. The
# shell does not wait for the command to finish, and the return status is 0 (true).
#
# Commands separated by a ';' are executed sequentially; the shell waits for each command to terminate in turn. The
# return status is the exit status of the last command executed.
# A sequence of one or more newlines may appear in a list to delimit commands, equivalent to a semicolon.
#
#     # command2 will be executed after command1
#     command1 ; command2
#
#     # which is the same as
#     command1
#     command2
#
# Lists separated by && and || are called AND and OR lists, respectively.
#
# The AND-list looks like this:
#
#     # command2 will be executed if, and only if, command1 finishes successfully (returns 0 exit status)
#     command1 && command2
#
# The OR-list has the form:
#
#     # command2 will be executed if, and only if, command finishes unsuccessfully (returns code of error)
#     command1 || command2
#
# The return code of AND and OR lists the exit status of the last executed command.
#
########################################################################################################################

###### THE CHALLENGE: Exercise 6 of 11 #################################################################################
#
# Create a file named lists.bash.
#
# Using lists of commands ('&', '&&', '||' or ';') output:
#   - First parameter is false. if the first positional parameter is false
#   - The path to the current directory if the second parameter is true;
#   - If third parameter is true output the list of files in the current directory or third parameter is false if it is
#     false.
#
# For example:
#
#     ./lists.bash true true false
#
#  Output:
#
#     ~/Projects/bash-exercices.
#     Third parameter is false.
#
########################################################################################################################
var_1=${1:-false}
var_2=${2:-false}
var_3=${3:-false}

$var_1 || echo "First parameter is $var_1"; $var_2 && echo $PWD; $var_3 && ls -l





