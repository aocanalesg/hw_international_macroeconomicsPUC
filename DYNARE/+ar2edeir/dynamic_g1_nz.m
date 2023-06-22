function [nzij_pred, nzij_current, nzij_fwrd] = dynamic_g1_nz()
% Returns the coordinates of non-zero elements in the Jacobian, in column-major order, for each lead/lag (only for endogenous)
  nzij_pred = zeros(11, 2, 'int32');
  nzij_pred(1,1)=4; nzij_pred(1,2)=5;
  nzij_pred(2,1)=7; nzij_pred(2,2)=5;
  nzij_pred(3,1)=8; nzij_pred(3,2)=5;
  nzij_pred(4,1)=9; nzij_pred(4,2)=5;
  nzij_pred(5,1)=11; nzij_pred(5,2)=5;
  nzij_pred(6,1)=7; nzij_pred(6,2)=6;
  nzij_pred(7,1)=7; nzij_pred(7,2)=7;
  nzij_pred(8,1)=13; nzij_pred(8,2)=7;
  nzij_pred(9,1)=15; nzij_pred(9,2)=8;
  nzij_pred(10,1)=16; nzij_pred(10,2)=8;
  nzij_pred(11,1)=15; nzij_pred(11,2)=16;
  nzij_current = zeros(43, 2, 'int32');
  nzij_current(1,1)=3; nzij_current(1,2)=1;
  nzij_current(2,1)=7; nzij_current(2,2)=1;
  nzij_current(3,1)=8; nzij_current(3,2)=1;
  nzij_current(4,1)=11; nzij_current(4,2)=1;
  nzij_current(5,1)=12; nzij_current(5,2)=1;
  nzij_current(6,1)=14; nzij_current(6,2)=1;
  nzij_current(7,1)=5; nzij_current(7,2)=2;
  nzij_current(8,1)=6; nzij_current(8,2)=2;
  nzij_current(9,1)=7; nzij_current(9,2)=2;
  nzij_current(10,1)=11; nzij_current(10,2)=2;
  nzij_current(11,1)=7; nzij_current(11,2)=3;
  nzij_current(12,1)=9; nzij_current(12,2)=3;
  nzij_current(13,1)=11; nzij_current(13,2)=3;
  nzij_current(14,1)=3; nzij_current(14,2)=4;
  nzij_current(15,1)=5; nzij_current(15,2)=4;
  nzij_current(16,1)=6; nzij_current(16,2)=4;
  nzij_current(17,1)=8; nzij_current(17,2)=4;
  nzij_current(18,1)=4; nzij_current(18,2)=5;
  nzij_current(19,1)=7; nzij_current(19,2)=5;
  nzij_current(20,1)=9; nzij_current(20,2)=5;
  nzij_current(21,1)=11; nzij_current(21,2)=5;
  nzij_current(22,1)=1; nzij_current(22,2)=6;
  nzij_current(23,1)=10; nzij_current(23,2)=6;
  nzij_current(24,1)=7; nzij_current(24,2)=7;
  nzij_current(25,1)=10; nzij_current(25,2)=7;
  nzij_current(26,1)=13; nzij_current(26,2)=7;
  nzij_current(27,1)=8; nzij_current(27,2)=8;
  nzij_current(28,1)=15; nzij_current(28,2)=8;
  nzij_current(29,1)=12; nzij_current(29,2)=9;
  nzij_current(30,1)=11; nzij_current(30,2)=10;
  nzij_current(31,1)=12; nzij_current(31,2)=10;
  nzij_current(32,1)=13; nzij_current(32,2)=11;
  nzij_current(33,1)=14; nzij_current(33,2)=11;
  nzij_current(34,1)=14; nzij_current(34,2)=12;
  nzij_current(35,1)=1; nzij_current(35,2)=13;
  nzij_current(36,1)=2; nzij_current(36,2)=13;
  nzij_current(37,1)=3; nzij_current(37,2)=13;
  nzij_current(38,1)=4; nzij_current(38,2)=13;
  nzij_current(39,1)=2; nzij_current(39,2)=14;
  nzij_current(40,1)=5; nzij_current(40,2)=14;
  nzij_current(41,1)=3; nzij_current(41,2)=15;
  nzij_current(42,1)=6; nzij_current(42,2)=15;
  nzij_current(43,1)=16; nzij_current(43,2)=16;
  nzij_fwrd = zeros(4, 2, 'int32');
  nzij_fwrd(1,1)=4; nzij_fwrd(1,2)=1;
  nzij_fwrd(2,1)=4; nzij_fwrd(2,2)=5;
  nzij_fwrd(3,1)=1; nzij_fwrd(3,2)=13;
  nzij_fwrd(4,1)=4; nzij_fwrd(4,2)=13;
end
