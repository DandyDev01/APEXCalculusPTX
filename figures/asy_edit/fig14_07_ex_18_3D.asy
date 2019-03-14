import graph3;

//ASY file for fig14_07_ex_18_3D.asy in Chapter 14


size(200,200,IgnoreAspect);
//currentprojection=perspective(7,2,1);
currentprojection=orthographic(14,14,10);
defaultrender.merge=true;

usepackage("mathspec");
texpreamble("\setallmainfonts[Mapping=tex-text]{Calibri}");
texpreamble("\setmainfont[Mapping=tex-text]{Calibri}");
texpreamble("\setsansfont[Mapping=tex-text]{Calibri}");
texpreamble("\setmathsfont(Greek){[cmmi10]}");

// setup and draw the axes
real[] myxchoice={-2,2};
real[] myychoice={-2,2};
real[] myzchoice={6};
defaultpen(0.5mm);

pair xbounds=(-2.5,2.5);
pair ybounds=(-2.5,2.5);
pair zbounds=(-.25,6.5);

xaxis3("",xbounds.x,xbounds.y,black,OutTicks(myxchoice),Arrow3(size=3mm));
yaxis3("",ybounds.x,ybounds.y,black,OutTicks(myychoice),Arrow3(size=3mm));
zaxis3("",zbounds.x,zbounds.y,black,OutTicks(myzchoice),Arrow3(size=3mm));

label("$x$",(xbounds.y+0.05*(xbounds.y-xbounds.x),0,0));
label("$y$",(0,ybounds.y+0.05*(ybounds.y-ybounds.x),0));
label("$z$",(0,0,zbounds.y+0.05*(zbounds.y-zbounds.x)));



//Draw paraboloid over unit disk
triple f(pair t) {
	return (t.y*cos(t.x),t.y*sin(t.x),(t.y*cos(t.x))^2+(t.y*sin(t.x))^3-3t.y*sin(t.x)+1);//
}
surface s=surface(f,(0,0),(2pi,2),16,8,Spline);
pen p=rgb(0,0,.7);
draw(s,rgb(.6,.6,1)+opacity(.7),meshpen=p);



//triple g(real t) {return (t,-2,1-t^2);}
//path3 mypath=graph(g,-1,1,operator ..);draw(mypath,blue+linewidth(2));

triple g(real t) {return (2cos(t),2sin(t),4cos(t)^2+8sin(t)^3-6sin(t)+1);}
path3 mypath=graph(g,0,2pi,operator ..);draw(mypath,blue+linewidth(2));


//triple g(real t) {return (t,1-t,t*(1-t));}
//path3 mypath=graph(g,0,1,operator ..);draw(mypath,blue+linewidth(2));

//triple g(real t) {return (t,t+1,t*(t+1));}
//path3 mypath=graph(g,-1,0,operator ..);draw(mypath,blue+linewidth(2));


//draw((-1,0,0)--(1,0,0)--(0,1,0)--cycle,blue+linewidth(2));



//label and arrow
//label("$z=1-x^2$",(0,1,1.55));
//draw((0,.9,1.45)--(0,.5,1.05),Arrow3(size=2mm));

//triple g(real t) {return (0,t,6-t^2);}
//path3 mypath=graph(g,-2,2,operator ..);draw(mypath,blue+linewidth(2));


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

