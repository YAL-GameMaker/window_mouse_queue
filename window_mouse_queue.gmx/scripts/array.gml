///array(...)
/*
Creates an array from the given arguments
*/

// Transfer arguments to a new array
var newArray = array_create(argument_count);
for (var i = 0; i < argument_count; i++)
    {
    newArray[i] = argument[i];
    }

// Return new array
return newArray;

