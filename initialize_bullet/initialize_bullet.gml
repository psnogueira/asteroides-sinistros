/// @description initialize_bullet
/// @arg direction
/// @arg speed
/// @arg faction
/// @arg bullet_instance

function initialise_bullet(inst,_dir,_spd,_fac){
    
var _creator = id;
    
    with(inst){
    direction = _dir;
    if(object_index == obj_bullet) speed = _spd;
    faction = _fac;
    creator = _creator;
        
    if(faction == factions.ally) image_blend = c_aqua;
    else if (faction == factions.enemy) image_blend = c_red;
    }
}