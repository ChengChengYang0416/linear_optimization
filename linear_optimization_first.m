acc = [0.076155; -0.15432; 9.79849];
acc = acc/9.81;
q = zeros(4, 1);
q(:) = [0.9; 0.1; 0.1; 0.1];
q(:) = q(:)/norm(q(:));
mu = 0.01;
iter = 1000;
f_ = zeros(iter, 1);

for i = 1:iter
    f = [2*(q(2)*q(4) - q(1)*q(3)) - acc(1); 2*(q(1)*q(2) - q(3)*q(4)) - acc(2); 2*(0.5 - q(2)*q(2) - q(3)*q(3)) + acc(3)];
    f_(i) = norm(f);
    J = [-2*q(3) 2*q(4) -2*q(1) 2*q(2); 2*q(2) 2*q(1) 2*q(4) 2*q(3); 0 -4*q(2) -4*q(3) 0];
    grad = (J.')*f;
    update = mu*grad/norm(grad);
    q = q - update;
    q_ = q/norm(q);
end
q = q/norm(q);

figure(1)
plot(f_)
