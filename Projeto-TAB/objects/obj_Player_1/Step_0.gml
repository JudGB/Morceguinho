if global.start exit;
hspd = 0;


#region Inputs

var _w = keyboard_check_released(ord("W"));
var _a = keyboard_check(ord("A"));
var _s = keyboard_check_pressed(ord("S"));
var _d = keyboard_check(ord("D"));
var upping = keyboard_check(vk_space)
var light = keyboard_check(ord("Q"));

#endregion

#region features

y += 1.5 //the fall




#endregion

#region Moves

if _d //move right
{
    hspd = move_speed;

	
}

if _a //move left
{
    hspd = -move_speed;
	
}

#endregion

#region DASH'S

#region Dash right

// -----------------------------
// DOUBLE TAP DETECTION TO RIGHT
// -----------------------------

if keyboard_check_pressed(ord("D"))
{
    // SECOND CLICK
    if right_timer > 0 and dash_cont < 3 //the limite dash
    {
		audio_play_sound(snd_dash, 5, false)
		audio_play_sound(snd_dashcontra, 7, false)
        dash = true;
        dash_timer = 10;
    }


    // FIRST CLICK
    right_timer = 20;
	
}

// --------------------
// TIMER
// --------------------

if right_timer > 0
{
    right_timer--;
	
}

// --------------------
// DASH
// --------------------

if dash 
{
    // 1. Se a variável não foi criada ou o sistema não existe, cria ele uma única vez
    if (!variable_instance_exists(id, "sistema_dash") || sistema_dash == noone) {
        sistema_dash = part_system_create(ps_SmokeDash);
        part_system_depth(sistema_dash, depth + 1);
    }
	
    // 2. Atualiza a posição do sistema único criado
    part_system_position(sistema_dash, x, y);
	
    hspd = dash_speed;
    dash_timer--;
	
    if dash_timer <= 0 
    {
        // 3. Destrói o sistema usando o argumento 'true' para sumir suavemente
        if (part_system_exists(sistema_dash)) {
            part_system_destroy(sistema_dash); 
        }
        
        // 4. CORREÇÃO: Apenas dizemos que ela está vazia (noone) para o próximo dash
        sistema_dash = noone;
        
        dash = false;
        dash_cont += 1;
		Isdash -= 1
    }
}



#endregion

#region Dash left

// ----------------------------
// DOUBLE TAP DETECTION TO LEFT
// ----------------------------

if keyboard_check_pressed(ord("A"))
{
    // SECOND CLICK
    if left_timer > 0 and dash_cont < 3
    {
		audio_play_sound(snd_dash, 5, false)
		audio_play_sound(snd_dashcontra, 7, false)
        l_dash = true;
        l_dash_timer = 10;
    }
	

	
    // FIRST CLICK
    left_timer = 20;
	
}

// --------------------
// TIMER
// --------------------

if left_timer > 0
{
    left_timer--;
}

// --------------------
// DASH
// --------------------

if l_dash
{
	
    hspd = -dash_speed;

    l_dash_timer--;

    if l_dash_timer <= 0
    {
        l_dash = false;
		dash_cont += 1;
		Isdash -= 1
    }
}

#endregion

#endregion

#region collisions

#region Left Right collision

//right and left collision 
repeat abs(hspd)
{
    if !place_meeting(x + sign(hspd), y, obj_Paredes)
    {
        x += sign(hspd);
    }
}

#endregion

#region Up Down collision

//up and dowm collision 
repeat abs(vspd)
{
    if place_meeting(x, y + sign(vspd), obj_Paredes) 
    {
		audio_play_sound(snd_reset,1, false)
        room_restart()
		global.start = true
    }
}

#endregion



#endregion


//Contador de mortes

if global.start == true or place_meeting(x, y, obj_spikes)
{
	global.DeathCount += 1
	
}


show_debug_message(global.DeathCount)
//show_debug_message(dash_cont)