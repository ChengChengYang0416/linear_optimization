%% for HW5-1
data = xlsread('HW5-1.xls');
A = data(:, 1:2);
Y = data(:, 3);
x = (((A.')*A)\(A.'))*Y;

%% for HW5-2
acc = xlsread('HW5-2.xls');
q_T = zeros(4, 100);
q_T(:, 1) = [1; 0; 0; 0];
mu = 1;

for i = 1:99
    f = [2*(q_T(2, i)*q_T(4, i)-q_T(1, i)*q_T(3, i)) - acc(i, 1); 2*(q_T(1, i)*q_T(2, i)+q_T(3, i)*q_T(4, i)) - acc(i, 2); 2*(0.5-q_T(2, i)*q_T(2, i)-q_T(3, i)*q_T(3, i)) - acc(i, 3)];
    J = [-2*q_T(3, i) 2*q_T(4, i) -2*q_T(1, i) 2*q_T(2, i); 2*q_T(2, i) 2*q_T(1, i) 2*q_T(4, i) 2*q_T(3, i); 0 -4*q_T(2, i) -4*q_T(3, i) 0];
    grad = (J.')*f;
    update = mu*(grad/norm(grad));
    q_T(:, i+1) = q_T(:, i) - update;
    q_T(:, i+1) = q_T(:, i+1)/norm(q_T(:, i+1));
end
q = q_T.';

xlswrite('quaternion.xls', q, '', 'A2');
col_header = {'q1', 'q2', 'q3', 'q4'};
xlswrite('quaternion.xls', col_header, '', 'A1');
