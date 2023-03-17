clear; close all; clc

A1 = [-3 2 1; 1 -2 -2; 1 -1 -1];
A2 = [-3 2 1; 1 -2 -2; 1 -1 -2];
A3 = [-3 2 1; 1 -2 -2; 4 -1 -1];


x0=-1:0.5:1;
y0=-1:0.5:1;
z0=-1:0.5:1;

figure(1)
scale = 0.5;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(y0)
            
            in_cond=[x0(i); y0(j); z0(k)];
            [x]=ask2(A1,in_cond);

            xx = gradient(x(:,1));
            yy = gradient(x(:,2));
            zz = gradient(x(:,3));
            figure(1)
            quiver3(x(:,1),x(:,2),x(:,3),xx,yy,zz,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); zlabel('z'); title('Sys-1: quiver plot ');
hold off

figure(2)
scale = 0.5;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(y0)
            
            in_cond=[x0(i); y0(j); z0(k)];
            [x]=ask2(A2,in_cond);

            xx = gradient(x(:,1));
            yy = gradient(x(:,2));
            zz = gradient(x(:,3));
            figure(2)
            quiver3(x(:,1),x(:,2),x(:,3),xx,yy,zz,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); zlabel('z'); title('Sys-2: quiver plot ');
hold off

figure(3)
scale = 0.5;
for i=1:length(x0)
    for j=1:length(y0)
        for k=1:length(y0)
            
            in_cond=[x0(i); y0(j); z0(k)];
            [x]=ask2(A3,in_cond);

            xx = gradient(x(:,1));
            yy = gradient(x(:,2));
            zz = gradient(x(:,3));
            figure(3)
            quiver3(x(:,1),x(:,2),x(:,3),xx,yy,zz,scale,'r');
            hold on

        end
    end
end
xlabel('x'); ylabel('y'); zlabel('z'); title('Sys-3: quiver plot ');
hold off