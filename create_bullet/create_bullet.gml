/// @description create_bullet
/// @function create_bullet(direction/image_angle, speed, faction, id);
/// @arg direction
/// @arg speed
/// @arg faction
/// @arg gun_type

function create_bullet(_dir, _spd, _fac, _creator){
	//variables are not declared separately but in the function call itself

	_gun_type = -1;
	if(argument_count > 3) _gun_type = argument[3];
	
	//CHOOSE GUN TYPE
	switch(_gun_type) {
		
		case powerups.three_bullets:
        
			var inst = instance_create_layer(x,y, "Instances", obj_bullet);
			initialise_bullet(inst, _dir, _spd, _fac);
        
    
		case powerups.two_bullets:
    
	        audio_play_sound(snd_zap, 1, false);
			
	        var _sep = 12;
        
	        var inst = instance_create_layer(x+lengthdir_x(_sep, _dir+90),y+lengthdir_y(_sep, _dir+90), "Instances", obj_bullet);
	        initialise_bullet(inst,_dir,_spd,_fac);
        
	        var inst = instance_create_layer(x+lengthdir_x(_sep, _dir-90),y+lengthdir_y(_sep, _dir-90), "Instances", obj_bullet);
	        initialise_bullet(inst,_dir,_spd,_fac);
        
	        break;
			
		case powerups.four_bullets:
		
			audio_play_sound(snd_zap, 1, false);
			
	        var _sep = 7, bullet_angle;
        
			var i = 0; repeat(4){
				bullet_angle = _dir + (i * 90);
				var inst = instance_create_layer(
				x+lengthdir_x(_sep, bullet_angle),
				y+lengthdir_y(_sep, bullet_angle), 
				"Instances", obj_bullet
				);
				initialise_bullet(inst,bullet_angle,_spd,_fac);
				i++;
			}
	        break;
			
		case powerups.star_bullets:
		
			audio_play_sound(snd_zap, 1, false);
			
	        var _sep = 7, bullet_angle;
        
			var i = 0; repeat(8){
				bullet_angle = _dir + (i * 45);
				var inst = instance_create_layer(
				x+lengthdir_x(_sep, bullet_angle),
				y+lengthdir_y(_sep, bullet_angle), 
				"Instances", obj_bullet
				);
				initialise_bullet(inst,bullet_angle,_spd,_fac);
				i++;
			}
		
	        break;
			
		case powerups.laser_bullets:
			audio_play_sound(snd_laser, 1, false);
			var inst = instance_create_layer(x, y,"Instances",obj_laser);
			initialise_bullet(inst,_dir,_spd,_fac);
	        break;
        
	    default:
			var _len = 14;
			var _x = lengthdir_x(_len, image_angle);
			var _y = lengthdir_y(_len, image_angle);
		
	        audio_play_sound(snd_zap, 1, false);
			var inst = instance_create_layer(x+_x, y+_y,"Instances",obj_bullet);
			initialise_bullet(inst,_dir,_spd,_fac);
	        break;
	}

}