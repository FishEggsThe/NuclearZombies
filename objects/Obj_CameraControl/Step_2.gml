var halfViewWidth = camera_get_view_width(view_camera[0]) / 2;
var halfViewHeight = camera_get_view_height(view_camera[0]) / 2;
var xP = Obj_Player.x;
var yP = Obj_Player.y;
var dist = point_distance(xP, yP, mouse_x, mouse_y)/4;
var ang = point_direction(xP, yP, mouse_x, mouse_y)*pi/180;

var xDist = dist * cos(ang);
var yDist = -dist * sin(ang);
x = lerp(x, xP, 0.1);
y = lerp(y, yP, 0.1);
var xDistLerp = x - halfViewWidth + xDist;
var yDistLerp = y - halfViewHeight + yDist;

camera_set_view_pos(view_camera[0], xDistLerp, yDistLerp);