%% for HW5-1
data = xlsread('HW5-1.xls');
A = data(:, 1:2);
Y = data(:, 3);
x = (((A.')*A)\(A.'))*Y;
xlswrite('linear_regression.xls', x);

%% for HW5-2
acc = xlsread('HW5-2.xls');
acc = acc/9.81;
q = zeros(4, 1);
q(:) = [0.9; 0.1; 0.1; 0.1];
q(:) = q(:)/norm(q(:));
mu = 0.001;
iter = 1000;
f_ = zeros(iter, 1);
q_arr = zeros(100, 4);

for j = 1:100
    for i = 1:iter
        f = [2*(q(2)*q(4) - q(1)*q(3)) - acc(j, 1); 2*(q(1)*q(2) - q(3)*q(4)) - acc(j, 2); 2*(0.5 - q(2)*q(2) - q(3)*q(3)) + acc(j, 3)];
        f_(i) = norm(f);
        J = [-2*q(3) 2*q(4) -2*q(1) 2*q(2); 2*q(2) 2*q(1) 2*q(4) 2*q(3); 0 -4*q(2) -4*q(3) 0];
        grad = (J.')*f;
        update = mu*grad/norm(grad);
        q = q - update;
        q_ = q/norm(q);
    end
    plot(f_);
    q = q/norm(q);
    q_arr(j, :) = q.';
end

figure(2);
subplot(4, 1, 1);
plot(q_arr(:, 1));
ylabel('$q_{1}$', 'Interpreter', 'latex');
subplot(4, 1, 2);
plot(q_arr(:, 2));
ylabel('$q_{2}$', 'Interpreter', 'latex');
subplot(4, 1, 3);
plot(q_arr(:, 3));
ylabel('$q_{3}$', 'Interpreter', 'latex');
subplot(4, 1, 4);
plot(q_arr(:, 4));
ylabel('$q_{4}$', 'Interpreter', 'latex');

xlswrite('quaternion.xls', q_arr, '', 'A2');
col_header = {'q1', 'q2', 'q3', 'q4'};
xlswrite('quaternion.xls', col_header, '', 'A1');


%% for HW5-2
acc = xlsread('HW5-3.xls');
acc = acc/9.81;
q = zeros(4, 1);
q(:) = [0.9; 0.1; 0.1; 0.1];
q(:) = q(:)/norm(q(:));
mu = 0.001;
iter = 1000;
f_ = zeros(iter, 1);
q_arr = zeros(100, 4);

for j = 1:100
    for i = 1:iter
        f = [2*(q(2)*q(4) - q(1)*q(3)) - acc(j, 1); 2*(q(1)*q(2) - q(3)*q(4)) - acc(j, 2); 2*(0.5 - q(2)*q(2) - q(3)*q(3)) - acc(j, 3)];
        f_(i) = norm(f);
        J = [-2*q(3) 2*q(4) -2*q(1) 2*q(2); 2*q(2) 2*q(1) 2*q(4) 2*q(3); 0 -4*q(2) -4*q(3) 0];
        grad = (J.')*f;
        update = mu*grad/norm(grad);
        q = q - update;
        q_ = q/norm(q);
    end
    plot(f_);
    q = q/norm(q);
    q_arr(j, :) = q.';
end

figure(2);
subplot(4, 1, 1);
plot(q_arr(:, 1));
ylabel('$q_{1}$', 'Interpreter', 'latex');
subplot(4, 1, 2);
plot(q_arr(:, 2));
ylabel('$q_{2}$', 'Interpreter', 'latex');
subplot(4, 1, 3);
plot(q_arr(:, 3));
ylabel('$q_{3}$', 'Interpreter', 'latex');
subplot(4, 1, 4);
plot(q_arr(:, 4));
ylabel('$q_{4}$', 'Interpreter', 'latex');

xlswrite('quaternion.xls', q_arr, '', 'A2');
col_header = {'q1', 'q2', 'q3', 'q4'};
xlswrite('quaternion.xls', col_header, '', 'A1');