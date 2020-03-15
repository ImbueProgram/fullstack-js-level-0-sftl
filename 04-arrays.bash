#!/usr/bin/env bash

###### ARRAYS ##########################################################################################################
#
# If you are already familiar with arrays in other programming languages, you won't be surprised here.
#
# An array in bash is a variable that allows you to refer to multiple values. In bash, arrays are also zero-based, that
# is, the first element in an array has an index of 0.
#
# When dealing with arrays, we should be aware of the special environment variable IFS. IFS or Input Field Separator —
# is the character that separates elements in an array. The default value is an empty space IFS=' '.
#
###### Array declaration
#
# In bash you create an array by simply assigning a value to an index in the array variable:
#
#     fruits[0]=Apple
#     fruits[1]=Pear
#     fruits[2]=Plum
#     echo ${fruits[*]} # echo ${fruits[@]} may be used as well
#
# Array variables can also be created using compound assignments such as:
#
#     fruits=(Apple Pear Plum)
#
###### Array slice
#
# Also, we can extract a slice of an array using the slice operators:
#
#     echo ${fruits[*]:0:2} # Apple Pear
#     echo ${@:1:2} # slice of positional parameters
#
# In the example above, fruits[*] returns the entire contents of the array, and :0:2 extracts the slice of length 2, that
# starts at index 0.
#
###### Adding elements into an array
#
# Adding elements into an array is quite simple too. Compound assignments are specially useful in this case. We can use
# them like this:
#
#     fruits=(Orange ${fruits[*]} Banana Cherry)
#     echo ${fruits[*]} # Orange Apple Pear Plum Banana Cherry
#
# In the example above, fruits[*] represents the entire contents of the array and substitutes it into the compound
# assignment, then assigns the new value into the fruits array, mutating its original value.
#
###### Deleting elements from an array
#
# To delete an element from an array, use the unset command:
#
#     unset fruits[0]
#     echo ${fruits[*]} # Apple Pear Plum Banana Cherry
#
########################################################################################################################

###### THE CHALLENGE: Exercise 4 of 11 #################################################################################
#
# Create a file named arrays.bash.
#
# A few values will be passed into your script through positional parameters. As you already know, all parameters which
# were passed into the script are stored in $* and $@ variables. These variables are none other than arrays.
#
# You should take slice of elements consisting of the second to third items (eventually two items). Save these elements
# into a new array. Add to the beginning of the array two new items, I and am. Add to the end of the array two items:
# and and the fourth positional argument.
#
# Output all elements of the array.
# For example, if you run your script with these arguments:
#     ./arrays.bash awesome cool strong cute awesome
#     The script must output this: I am cool strong and cute
########################################################################################################################
items=${*:2:2} #Get second and third parameters form all parameters passed into the script. ${@:2:2} also works
items=(i am ${items[*]}) #Prepend 2 elements to the array
items=(${items[*]} and $4) #Append 2 elements to the array. In one line: items=(i am ${items[*]} and $4)
echo ${items[*]}


















