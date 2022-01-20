% To plot the Response and Phase plane for the Mathieu's Equation
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
%--------------------------------------------------------------------------
% Mathieu Equation is y''(z)+eta.y'(z)+(a+qcos(2z))sin(y) = 0
clc ; clear all ;
% Characteristic Exponents of the Mathieu Equation
a = 1. ;
q = 0.05 ;
eta = 0.0 ;                 % Damping in the system
time = 0:0.01:80.;          % Time span
theta0 = [0 0.25] ;         % Initial values
ivp = [theta0 q a eta] ;
% Time History Analysis using ODE45
sol = ode45(@MathieuEquation,time,ivp) ;
y = deval(sol,time);
theta = y(1,:)' ;
Dtheta = y(2,:)' ;
%
% Time History plot
figure ;               
plot(time,theta) ;  
xlabel('time') ;
ylabel('angle') ;
 % Phase plane plot
figure ;               
plot(theta,Dtheta,'b') ;    
hold on ;
plot(theta0(1),theta0(2),'or') ;
xlabel('angle') ;
ylabel('angular velocity') ;
axis equal ;
