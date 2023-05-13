///focus(return,set)
if (argument_count == 0)
return(global.foco==object_index); else {
    switch(argument[0]) {
    case -2: with(global.foco) image_index = 0;
        global.foco = object_index;
        image_index = 1; break;
    case -1: return global.foco;
    default: global.foco = argument[0]
    image_index = 0;
    with (argument[0]) image_index = 1;
    }
}
