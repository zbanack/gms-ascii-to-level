///load_levels();

/*
    @author Zack Banack
    https://github.com/zbanack
    
    This script loads levels - separated by var separator - from a text document.
*/

var separator, fname, f, file, level, row, line; // init vars

separator = "_"; // character(s) on a new line in the text doc that indicate a new level should begin
fname = "levels.txt"; // name of file levels are pulled from (should be .txt)
f = working_directory + "\" + string(fname); // file location

/*
    2d array used to house (string) level data row by row
        First index is the level number
        Second index is the level's row data
*/
global.data[0, 0] = "";

level = 0; // current level
row = 0; // current row of level

if (file_exists(f)) { // check if file exists
    file = file_text_open_read(f); // open file
    while (!file_text_eof(file)) { // repeat until the end of the file is reached
        line = file_text_read_string(file); // read line
        if (line == separator) { // if the line contains the separator, a new level begins
            level++; // increment the level counter
            row = 0; // reset the row counter
        } else { // if there is data on the line
            global.data[level, row] = line; // store line information
            row++; // increment level row counter
        }
        file_text_readln(file); // move to next line
    }
    file_text_close(file); // close file
} else {
    show_error("Cannot locate " + string(fname) + "!", true); // error loading file
}

return 0;
