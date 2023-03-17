function [x]=ask2(A,x0)
%% solves system xdot=A*x for x(t),y(t),z(t)

%% Global variables
S=[]; D=[]; J=[]; tfirst=[]; tlast=[]; tot_steps=[]; y=[]; x=[]; x1=[]; x2=[]; x3=[]; t=[]; s=[]; lambda=[]; B=[];

[S,D,J]=eigen(A);

y0=inv(A)*x0; % convert x0 to y0 initial conditions

t_first=0;
t_last=1;
tot_steps=20;
tspan=linspace(t_first,t_last,tot_steps);

%% solves for normal solution y
[t,y] = ode45(@ODEsystem,tspan,y0);

%% converts normal solution y to x
x=(S*y(1,:)')';

for i=2:size(y,1)
    
    temp=S*y(i,:)';
    temp=temp';
    x=[x;temp];
    
end

%% ODE system ydot=J*y 
    function [dydt] = ODEsystem(t,y)
        
        for i=1:3
            dydt(i)=J(i,i)*y(i);
        end
        dydt=dydt';
        
    end

%% Calculates eigenvalues (D), eigenvectors (V) and jordan matrix (J)
    function [V,D,J]=eigen(A)
    
        s = size(A);
        if s(1)~=s(2)
          error('Error: Input must be square.')
        end
        
        % Calculates eigenvalues with qr decomposition
        syms lambda 
        I=eye(size(A));
        
        B=A-lambda*I;
        
        f1=det(B);
        
        eigenvalues=solve(f1==0,lambda);
        eigenvalues=double(eigenvalues);
        D=diag(sort(eigenvalues));
        
        V = zeros(s);
        
        % Calculates eigenvectors with qr decomposition
        for i=1:s(1);
        
            B=A-eigenvalues(i)*I;
            [~, R] = qr(B); 
            V(:,i) = null(R);
        
        end
        
        % Jordan matrix

        n=size(A,1);
        ker_dim = n - rank(A);
        
        J = zeros(n);
        
        for i = 1:n-ker_dim
            eigenvalue = D(i,i);
            eigenvec_i = V(:,i);
            
            j=1;
            while i+j<=n-ker_dim && abs(D(i+j,i+j)-eigenvalue) < eps
                j=j+1;
            end
            
            J(i:i+j-1,i:i+j-1) = eigenvalue*eye(j);
            if j > 1
                J(i:i+j-2,i+1:i+j-1) = eye(j-1);
            end
            
            
            for i = 1:n-ker_dim
                eigenvec_i = V(:,i);
                for j = n-ker_dim+1:n
                    if  abs(eigenvec_i(j-n+ker_dim)) < eps
                        J(j,i) = 1;
                    end
                end
            end
                
        end


        
    end


end