///@description spawn_off_camera
///@function spawn_off_camera(obj,num);
///@arg obj
///@arg number

function spawn_off_camera(obj,num){

	var xx,yy;

	//Exists to ensure the asteroid sprites are not sticking into the edge of the camera when they spawn
	var pad = 64;
	
	repeat(num){
		//Picks a random point in the room
		xx = random_range(0,room_width);
		yy = random_range(0,room_height);

		//Loops until the point chosen above is outside of the camera
		//May cause unnecessary processing, but is fine for the simplicity of this game
		while(point_in_rectangle(xx, yy, global.cameraX - pad, global.cameraY - pad,
			global.cameraX+global.cameraWidth + pad, global.cameraY+global.cameraHeight + pad)){
			xx = random_range(0,room_width);
			yy = random_range(0,room_height);
		}
		instance_create_layer(xx,yy,"Instances",obj);
	}
}