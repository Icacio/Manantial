///@add(codigo)
if (object_index != tabla) {with (tabla) return add(argument0); exit;}
if !is_real(argument0) return 0;
if (spinner.amount == 0) spinner.amount = 1;

var grid_inventario;
if (room==caja)
    grid_inventario = grid_inven; else
    grid_inventario = grid_tabla;

var _len = ds_grid_height(grid_inventario);
for(var i = 1; i < _len;i++)
    if (argument0==grid_inventario[#0,i])
        break;//if it exists in the full inventory

if _len != i {
var _leng = ds_grid_height(grid_tabla);
    if (room==caja) {//if it is the checkout
        var j = i;
        for(i = 1; i < _leng; i++)
        if (argument0==grid_tabla[#0,i])
            break; //if exists in the checkout

        if i == _leng {//if it doesn't
            if (grid_tabla[#3,j-1]==0) {
                bTexto(grid_tabla[#1,j-1])
                spinner.amount = 0;
            }
            else {
                ds_grid_resize(grid_tabla,5,_leng+2)
                grid_tabla[#0,i] = grid_inven[#0,j];//codigo
                grid_tabla[#1,i] = grid_inven[#1,j];//nombre
                grid_tabla[#2,i] = grid_inven[#2,j];//precio
                grid_tabla[#3,i] = min(spinner.amount,grid_inven[#3,j]);//cantidad
                grid_tabla[#4,i] = grid_inven[#4,j];//tags
                bTexto("");
                match(match()+grid_tabla[#2,i]*grid_tabla[#3,i]);
                image_yscale = max((55.6)/max(ds_grid_height(grid_tabla)-17,1),1)
                spinner.amount = 0;
                if ds_grid_height(grid_tabla) > 17
                    yedelaTabla = ds_grid_height(grid_tabla)-18;
            } exit;
        }
    }//if the item already exists
    if _leng != i {
        if (room != administrador) {//sumar en la fila
            if (room==caja)
                grid_tabla[#3,i] = min(spinner.amount,grid_tabla[#3,i],grid_inven[#3,i])
            else grid_tabla[#3,i] += spinner.amount;
            spinner.amount = 0;
            if (room==caja) match(match()+grid_tabla[#3,i])
            bTexto("");
            }
        else {//sobreescribir en la fila
            match(argument0,spinner.amount)
            spinner.amount = grid_inventario[#2,i];
            bTexto(grid_inventario[#1,i]);
        }
        if (ds_grid_height(grid_tabla) > 17) {
            yedelaTabla = max(0,i-17);
            
        }//*/
    }
} else {//if it doesn't exist in the inventory
    if (room!=caja) {
        ds_grid_resize(grid_tabla,5,_len+1)
        match(argument0,spinner.amount);
        spinner.amount = 0;
        bTexto("");
        image_yscale = max((55.6)/max(ds_grid_height(grid_tabla)-17,1),1)
    }
}


