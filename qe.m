function [Qe,q_e]= qe(Q, Qc)
Q1 = [Qc(1);-Qc(2);-Qc(3);-Qc(4)];
Q2 = Q;
sigma1 = Q1(1);
q1 = Q1(2:4);
sigma2 = Q(1);
q2 = Q2(2:4);
v = q1;
vx = v(1);
vy = v(2);
vz = v(3);
S_q1 = [ ...
    0, -vz, vy; ...
    vz, 0, -vx; ...
    -vy, vx, 0 ...
    ];
Qe = [sigma1*sigma2-q1'*q2;
    sigma1.*q2+sigma2.*q2+S_q1*q2];
q_e = Qe(2:4);
end