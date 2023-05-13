var file = argument[0];
var cellDelimiter = ",";
var textDelimiter = '"';
var cellDelimiterOrd = 44;
var textDelimiterOrd = 34;
if !file_exists(file) return -1;
var res_buffer = buffer_load(file);
buffer_seek(res_buffer, buffer_seek_start, 0 );
//Initialise width and height of the spreadsheet
var sheetWidth = 0;
var sheetHeight = 1;

var prevVal = 0;
var value = 0;
var str = "";
var inText = false;
var grid = noone;

var size = buffer_get_size( res_buffer );
for( var i = 0; i < size; i++ ) {
    prevVal = val;
    val = buffer_read( res_buffer, buffer_u8 );
   // show_debug_message(val)
    if ( val == 13 ) continue;/*/
    if ( val == textDelimiterOrd ) {
        var nextVal = buffer_peek( res_buffer, buffer_tell( res_buffer ), buffer_u8 );
        if ( inText ) {
            if ( nextVal == textDelimiterOrd ) continue;
            if ( prevVal == textDelimiterOrd ) {
                str += textDelimiter;
                continue;
            }
        }
        inText = !inText;
        continue;
        
    }   //*/ 
    if ( ( val == cellDelimiterOrd ) or
    ( ( prevVal == 13 ) and ( val == 10 ) ) ) and ( !inText ) {
        
        sheetWidth++;
        if ( grid == noone ) {
            grid = ds_grid_create( max( 1, sheetWidth ), max( 1, sheetHeight ) );
            ds_grid_clear( grid, "" );
        } else ds_grid_resize( grid, max( sheetWidth, ds_grid_width( grid ) ), sheetHeight );
        
        ds_grid_set( grid, sheetWidth - 1, sheetHeight - 1, str );
        str = "";
        inText = false;
        
        if ( val == 10 ) {
            sheetWidth = 0;
            sheetHeight++;
        }
        
        continue;
    }
    
    str += chr( val );
}

buffer_delete( res_buffer );

//Return the grid, ready for use elsewhere
return grid;
