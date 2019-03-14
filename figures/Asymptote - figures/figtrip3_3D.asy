import graph3;

//ASY file for figtrip33D.asy in Chapter 13


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(4,4,2);
defaultrender.merge=true;

// setup and draw the axes
real[] myxchoice={-1,1};
real[] myychoice={-1,-0.5};
real[] myzchoice={1};
defaultpen(0.5mm);

pair xbounds=(-1.25,1.25);
pair ybounds=(-1.25,0.5);
pair zbounds=(-0.25,1.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));

//disk x^2+y^2=1 in 3rd and 4th quadrants
triple g(real t) {return (cos(t),sin(t),0);}
path3 mypath=graph(g,pi,2*pi,operator ..);draw(mypath,blue+linewidth(2));

//surface above disk x^2+y^2=1 in 3rd and 4th quadrants
triple g(real t) {return (cos(t),sin(t),-sin(t));}
path3 mypath=graph(g,pi,2*pi,operator ..);draw(mypath,blue+linewidth(2));

//line
draw((-1,0,0)--(1,0,0),blue+linewidth(2));

//vertical lines
int k=24;
for (int i=k+1; i<2*k; ++i)
{
	draw((cos(i*pi/k),sin(i*pi/k),0)--(cos(i*pi/k),sin(i*pi/k),-sin(i*pi/k)),blue+linewidth(2));
}

int k=24;//number of panels

//shade bottom
import three;
for (int i=k; i<2*k; ++i)
{
path3 p =  (0,0,0)--(cos(i*pi/k),sin(i*pi/k),0)--(cos((i+1)*pi/k),sin((i+1)*pi/k),0); //Left
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));
}

//shade top
for (int i=k; i<2*k; ++i)
{
path3 p =  (0,0,0)--(cos(i*pi/k),sin(i*pi/k),-sin(i*pi/k))--(cos((i+1)*pi/k),sin((i+1)*pi/k),-sin((i+1)*pi/k)); //Left
draw(surface(p -- cycle), emissive(rgb(1,.4,.7)+opacity(0.7)));
}

//shade side
for (int i=k; i<2*k; ++i)
{
path3 p = 
(cos(i*pi/k),sin(i*pi/k),0)--(cos(i*pi/k),sin(i*pi/k),-sin(i*pi/k))--(cos((i+1)*pi/k),sin((i+1)*pi/k),-sin((i+1)*pi/k))--(cos((i+1)*pi/k),sin((i+1)*pi/k),0); //Left
draw(surface(p -- cycle), emissive(rgb(.6,.6,1)+opacity(0.7)));
}

//label the surfaces
label("$x^2+y^2=1$",(1.4,-.7,0));
draw((1.1,-.6,0)--(.7,-.7,.35),Arrow3(size=2mm));
label("$z=-y$",(0,-.5,1.25));
draw((0,-.5,1.15)--(0,-.5,.5),Arrow3(size=2mm));


// ////////////////////////////////////
//    SAMPLE CODE

// defaultpen(fontsize(10pt));

//real f(pair z) {return -z.x^4+2*z.x^2-z.y^4+2*z.y^2;}
//surface s=surface(f,(-1.5,-1.5),(1.5,1.5),Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//triple f(pair t) {
//  return (cos(t.x)*1.5*cos(t.y),sin(t.x)*cos(t.y),sin(t.y));
//}
//surface s=surface(f,(0,0),(pi,2*pi),8,8,Spline);
//pen p=rgb(0,0,.7);
//draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);

//draw(s,paleblue);
//draw(s,lightblue,meshpen=black+thick(),nolight,render(merge=true));
//draw(mypath,2bp+blue);

//triple g(real t) {return (t,t,-2*t^4+4*t^2);}
//path3 mypath=graph(g,-1,1,operator ..);
//draw(mypath,blue+dashed+linewidth(2));

//pen p=rgb(0,0,1);
//draw(s,paleblue+opacity(.5),meshpen=p,render(merge=true));
