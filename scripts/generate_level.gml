///generate_level(level);

/*
    @author Zack Banack
    https://github.com/zbanack
    
    This script generates a particular level, arg0, from the text doc.
    Script load_levels() must be called first.
*/

var level, cell_width, cell_height, i, j, obj, char; // init vars

level = argument0; // which level, int, to generate

/*
     Horizontal and vertical size of each cell, each char in text doc.
        Objects will spawn in relation to this grid.
*/
cell_width = 64;
cell_height = 64;

for (i = 0; i < array_length_2d(global.data, level); i++) { // cycle through level's rows
    for (j = 0; j < string_length(global.data[level, i]); j++) { // cycle through row's characters
        obj = noone; // object to spawn
        char = string_char_at(global.data[level, i], j + 1); // grab character

        switch (char) { // set object to spawn based on current character
            case ("@"): // @ represents object oWall
                obj = oWall;
                break;
            case ("C"): // C represents object oCoin
                obj = oCoin;
                break;
            case ("P"): // P represents object oPlayer
                obj = oPlayer;
                break;
        }

        if (obj != noone) { // create necessary object if there was a character match
            instance_create(j * cell_width, i * cell_height, obj);
        }
    }
}

return 0;
