// Feather disable all

//This script contains the default profiles, and hence the default bindings and verbs, for your game
//
//  Please edit this macro to meet the needs of your game!
//
//The struct return by this script contains the names of each default profile.
//Default profiles then contain the names of verbs. Each verb should be given a binding that is
//appropriate for the profile. You can create bindings by calling one of the input_binding_*()
//functions, such as input_binding_key() for keyboard keys and input_binding_mouse() for
//mouse buttons

function __input_config_verbs()
{
    return {
        keyboard_and_mouse:
        {
            up:    [input_binding_key("W")],
            down:  [input_binding_key("S")],
            left:  [input_binding_key("A")],
            right: [input_binding_key("D")],
            
            fire:  input_binding_mouse_button(mb_left),
            swap:  input_binding_key(vk_space),
            interact:  input_binding_key("E"),
			
            pause:  input_binding_key(vk_escape),
            
            //No aiming verbs since we use the mouse for that (see below for aiming verb examples)
        },
        
        gamepad:
        {
            up:    [input_binding_gamepad_axis(gp_axislv, true),  input_binding_gamepad_button(gp_padu)],
            down:  [input_binding_gamepad_axis(gp_axislv, false), input_binding_gamepad_button(gp_padd)],
            left:  [input_binding_gamepad_axis(gp_axislh, true),  input_binding_gamepad_button(gp_padl)],
            right: [input_binding_gamepad_axis(gp_axislh, false), input_binding_gamepad_button(gp_padr)],
            
            fire:  input_binding_gamepad_button(gp_shoulderrb),
            swap:  input_binding_gamepad_button(gp_shoulderlb),
            interact:  input_binding_gamepad_button(gp_face1),
            
            aim_up:    input_binding_gamepad_axis(gp_axisrv, true),
            aim_down:  input_binding_gamepad_axis(gp_axisrv, false),
            aim_left:  input_binding_gamepad_axis(gp_axisrh, true),
            aim_right: input_binding_gamepad_axis(gp_axisrh, false),
            
            pause: input_binding_gamepad_button(gp_start),
        },
        
        touch:
        {
            up:    input_binding_virtual_button(),
            down:  input_binding_virtual_button(),
            left:  input_binding_virtual_button(),
            right: input_binding_virtual_button(),
            
            accept:  input_binding_virtual_button(),
            cancel:  input_binding_virtual_button(),
            action:  input_binding_virtual_button(),
            special: input_binding_virtual_button(),
            
            pause: input_binding_virtual_button(),
        }
    };
}