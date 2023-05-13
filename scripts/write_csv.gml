///write_csv(id,filename)
if !ds_exists(argument0,ds_type_grid) exit;

var _buffer = buffer_create(1,buffer_grow,1);
for (var j = 0; j < ds_grid_height(argument0);j++) {
    if (j > 0) buffer_write(_buffer,buffer_u8,13)
    for(var i = 0; i < ds_grid_width(argument0);i++) {
        if (i > 0) buffer_write(_buffer,buffer_text,",")
        if (argument0[#1,i]==""||argument0[#1,i]==0) break;
        if is_real(argument0[#i,j]) var _str = string(argument0[#i,j]);
        else if is_string(argument0[#i,j]) var _str = argument0[#i,j];
        else _str = -1;
        var k = 1; var _len = string_length(_str);
        while (k<=_len)
        if (_str != -1) {
        buffer_write(_buffer,buffer_u8,ord(string_copy(_str,k++,1)))
        }
    }
}
buffer_resize(_buffer,buffer_tell(_buffer));
buffer_save(_buffer,argument1);
buffer_delete(_buffer)

