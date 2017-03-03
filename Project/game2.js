function play_game()
{
var level = 100; // Game level, by decreasing will speed up
var rect_w = 45; // Width
var rect_h = 30; // Height
var inc_score = 50; // Score
var snake_color = "#006699"; // Snake Color
var ctx; // Canvas attributes
var tn = []; // temp directions storage
var x_dir = [-1, 0, 1, 0]; // position adjusments
var y_dir = [0, -1, 0, 1]; // position adjusments
var queue = [];
var frog = 1; // defalut food
var map = [];
var MR = Math.random;
var X = 5 + (MR() * (rect_w - 10))|0; // Calculate positions
var Y = 5 + (MR() * (rect_h - 10))|0; // Calculate positions
var direction = MR() * 3 | 0;
var interval = 0;
var score = 0;
var sum = 0, easy = 0;
var i, dir;
// getting play area
var c = document.getElementById('playArea');
ctx = c.getContext('2d');
// Map positions
for (i = 0; i < rect_w; i++)
{
map[i] = [];
}
// random placement of snake food
function rand_frog()
{
var x, y;
do
{
x = MR() * rect_w|0;
y = MR() * rect_h|0;
}
while (map[x][y]);
map[x][y] = 1;
ctx.fillStyle = snake_color;
ctx.strokeRect(x * 10+1, y * 10+1, 8, 8);
}
// Default somewhere placement
rand_frog();
function set_game_speed()
{
if (easy)
{
X = (X+rect_w)%rect_w;
Y = (Y+rect_h)%rect_h;
}
--inc_score;
if (tn.length)
{
dir = tn.pop();
if ((dir % 2) !== (direction % 2))
{
direction = dir;
}
}
if ((easy || (0 <= X && 0 <= Y && X < rect_w && Y < rect_h)) && 2 !== map[X][Y])
{
if (1 === map[X][Y])
{
score+= Math.max(5, inc_score);
inc_score = 50;
rand_frog();
frog++;
}
//ctx.fillStyle("#ffffff");
ctx.fillRect(X * 10, Y * 10, 9, 9);
map[X][Y] = 2;
queue.unshift([X, Y]);
X+= x_dir[direction];
Y+= y_dir[direction];
if (frog < queue.length)
{
dir = queue.pop()
map[dir[0]][dir[1]] = 0;
ctx.clearRect(dir[0] * 10, dir[1] * 10, 10, 10);
}
}
else if (!tn.length)
{
var msg_score = document.getElementById("msg");
msg_score.innerHTML = "Thank you for playing game.<br /> Your Score : <b>"+score+"</b><br /><br /><input type='button' value='Play Again' onclick='window.location.reload();' />";
document.getElementById("playArea").style.display = 'none';
window.clearInterval(interval);
}
}
interval = window.setInterval(set_game_speed, level);
document.onkeydown = function(e) {
var code = e.keyCode - 37;
if (0 <= code && code < 4 && code !== tn[0])
{
tn.unshift(code);
}
else if (-5 == code)
{
if (interval)
{
window.clearInterval(interval);
interval = 0;
}
else
{
interval = window.setInterval(set_game_speed, 60);
}
}
else
{
dir = sum + code;
if (dir == 44||dir==94||dir==126||dir==171) {
sum+= code
} else if (dir === 218) easy = 1;
}
}
}
