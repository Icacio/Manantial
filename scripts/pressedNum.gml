if keyboard_check_pressed(ord("0")) return 0;
if keyboard_check_pressed(ord("1")) return 1;
if keyboard_check_pressed(ord("2")) return 2;
if keyboard_check_pressed(ord("3")) return 3;
if keyboard_check_pressed(ord("4")) return 4;
if keyboard_check_pressed(ord("5")) return 5
if keyboard_check_pressed(ord("6")) return 6
if keyboard_check_pressed(ord("7")) return 7
if keyboard_check_pressed(ord("8")) return 8
if keyboard_check_pressed(ord("9")) return 9

if keyboard_check_pressed(vk_numpad0) return 0
if keyboard_check_pressed(vk_numpad1) return 1
if keyboard_check_pressed(vk_numpad2) return 2
if keyboard_check_pressed(vk_numpad3) return 3
if keyboard_check_pressed(vk_numpad4) return 4
if keyboard_check_pressed(vk_numpad5) return 5
if keyboard_check_pressed(vk_numpad6) return 6
if keyboard_check_pressed(vk_numpad7) return 7
if keyboard_check_pressed(vk_numpad8) return 8
if keyboard_check_pressed(vk_numpad9) return 9;

/*if (keyboard_lastkey==13) {
    var a = real(string_digits(keyboard_string))
    keyboard_string = "";
    return a;
}//*/
return -1;

