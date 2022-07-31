%{
Bohm, Radouch, Hampacher:
Teorie chyb a vyrovnávací počet
GKP Praha 1990

Příklad str. 216, nivelační pořady s podmínkou.
%}

A = [ 1  0  0
      0  1  0
      0  0  1
     -1  1  0
      0 -1  1 ];

l = [ 0  0  0  -5  7 ]';

B = [-1  0  1];
b = [ 4.2];

N = A'*A;
n = A'*l;

M = [N B'; B 0];
rhs = [n; b];


% iterační řešení s převáhováním

for i = 1:16
  P = eye(6);
  P(6,6) = 10^i;

  T = [A; B];
  t = [l; b];
  N = T'*P*T;
  n = T'*P*t;
  z = inv(N)*n;
  printf('Iterace 10^%d ', i);
  printf('%g ', z);
  printf('\n');
end

printf('\n---------------------------\nReseni = ');
printf('%g ', inv(M)*rhs);
printf('\n');
