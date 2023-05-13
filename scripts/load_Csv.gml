var _file = argument[0];
var _wid = 0;
var _heig = 0;
var val = 0
var prevVal;
if !file_exists(_file) return -1
var _buffer = buffer_load(_file)
buffer_seek(_buffer,buffer_seek_start,0);
var grid = ds_grid_create(5,1);

var size = buffer_get_size(_buffer);

for (var i = 0; i < size; i++) {
    prevVal = val;
    val = buffer_read(_buffer,buffer_u8);
    if (val== 13) continue;
    if (_wid > 4) continue;
    if (val==44) {
        var curVal = grid[#_wid++,_heig];
        if curVal == string_digits(curVal)&&(_wid-1!=0||_heig!=0)
            grid[#_wid-1,_heig] = floor(real(curVal));
    } else {
        if (prevVal==13) {
            var curVal = grid[#_wid,_heig];
            if curVal == string_digits(curVal)
                grid[#_wid,_heig] = real(curVal);
            _wid = 0;
            if (_heig<1)||(grid[#1,_heig]!=0&&grid[#1,_heig]!="")
                ds_grid_resize(grid,5,++_heig+1)
            else {var k = 0
                while(k < 5) grid[#k++,_heig] = 0;
            }
            }
        if ((64<val)&&(val<91)||(96<val)&&(val<123)||accents(val)||((46<val)&&(val<58))||(val==32)||(val==35)||(val==38)||val==92) {
            if is_string(grid[#_wid,_heig])
                grid[#_wid,_heig] += chr(val);
            else grid[#_wid,_heig] = chr(val);
        }
    }
}
var curVal = grid[#_wid,_heig];
/*if !is_undefined(curVal) {
    if curVal == string_digits(curVal)
        grid[#_wid,_heig] = real(curVal);
} else buscribe("("+string(_wid)+","+string(_heig)+")")//*/
buffer_delete(_buffer)
return grid;

