clear; close all; clc


y0=ones(1,3);
in_cond=y0;
global eigenvalues1 eigenvalues2 eigenvalues3
eigenvalues1 = [0.5 0.8 1.2];
eigenvalues2 = [0.5 0.8 0.8];
a=1.5; b=1; 
l1=a+b*i; l2=a-b*i; l3=0.2;
eigenvalues3 = [l1 l2 l3];

t_first=0;
t_last=1;
tot_steps=20;
tspan=linspace(t_first,t_last,tot_steps);

x0=-1:0.5:1;
y0=-1:0.5:1;
z0=-1:0.5:1;

figure(1)
scale = 0.5;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            [x y z]=sys1(tspan,in_cond,eigenvalues1);

            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(1)
            quiver3(x,y,z,xx,yy,zz,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); zlabel('z'); title('Sys-1: 3D quiver plot (3 positive real eigenvalues)');
hold off

figure(2)
scale = 1;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            [x y z]=sys1(tspan,in_cond,eigenvalues1);

            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(2)
            quiver(x,y,xx,yy,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); title('Sys-1: 2D quiver plot over different initial conditions');
hold off

figure(3)
scale = 1;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            [x y z]=sys1(tspan,in_cond,-eigenvalues1);

            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(3)
            quiver(x,y,xx,yy,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); title('Sys-1: 2D quiver plot (3 negative real eigenvalues)');
hold off

figure(4)
scale = 1;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            eigenvalues1=[0.5 -0.8 1.2];
            [x y z]=sys1(tspan,in_cond,eigenvalues1);

            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(4)
            quiver(x,y,xx,yy,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); title('Sys-1: 2D quiver plot (λ1*λ2<0)');
hold off

x0=-1:0.5:1;
y0=-1:0.5:1;
z0=-1:0.5:1;

figure(5)
scale = 0.5;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];

            for h=1:length(tspan)
                [x(h) y(h) z(h)]=sys2(tspan(h),in_cond,eigenvalues2);
            end

            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(5)
            quiver3(x,y,z,xx,yy,zz,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); zlabel('z'); title('Sys-2: 3D quiver plot (3 positive real eigenvalues)');
hold off

figure(6)
scale = 1;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            for h=1:length(tspan)
                [x(h) y(h) z(h)]=sys2(tspan(h),in_cond,eigenvalues2);
            end

            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(6)
            quiver(x,y,xx,yy,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); title('Sys-2: x-y quiver plot over different initial conditions');
hold off

figure(7)
scale = 1;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            for h=1:length(tspan)
                [x(h) y(h) z(h)]=sys2(tspan(h),in_cond,eigenvalues2);
            end

            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(7)
            quiver(y,z,yy,zz,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); title('Sys-2: y-z quiver plot over different initial conditions');
hold off

figure(8)
scale = 1;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            for h=1:length(tspan)
                [x(h) y(h) z(h)]=sys2(tspan(h),in_cond,eigenvalues2);
            end

            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(8)
            quiver(x,z,xx,zz,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); title('Sys-2: x-z quiver plot over different initial conditions');
hold off

x0=-1:0.5:1;
y0=-1:0.5:1;
z0=-1:0.5:1;

figure(9)
scale = 0.6;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            [theta r z]=sys3(tspan,in_cond,eigenvalues3);
            x=r.*cos(theta); y=r.*sin(theta);
            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(9)
            quiver(x,y,xx,yy,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); title('Sys-3: x-y quiver plot over different initial conditions');
hold off

figure(10)
scale = 0.6;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(z0)
            
            in_cond=[x0(i) y0(j) z0(k)];
            [theta r z]=sys3(tspan,in_cond,eigenvalues3);
            x=r.*cos(theta); y=r.*sin(theta);
            xx = gradient(x);
            yy = gradient(y);
            zz = gradient(z);
            figure(10)
            quiver3(x,y,z,xx,yy,zz,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y');zlabel('z'); title('Sys-3: 3D quiver plot over different initial conditions');
hold off

%% System 1
function [x y z]=sys1(t,in_cond,eigenvalues1)
    x = in_cond(1)*exp(eigenvalues1(1)*t);
    y = in_cond(2)*exp(eigenvalues1(2)*t);
    z = in_cond(3)*exp(eigenvalues1(3)*t);
end

%% System 2
function [x y z]=sys2(t,in_cond,eigenvalues2)
    x = in_cond(1)*exp(eigenvalues2(1)*t);
    y = (in_cond(3)*t+in_cond(2))*exp(eigenvalues2(2)*t);
    z = in_cond(3)*exp(eigenvalues2(2)*t);
end

%% System 3
function [theta r z]=sys3(t,in_cond,eigenvalues3)
    theta = in_cond(1)-imag(eigenvalues3(1))*t;
    r = in_cond(2)*exp(real(eigenvalues3(1))*t);
    z = in_cond(3)*exp(eigenvalues3(3)*t);
end

