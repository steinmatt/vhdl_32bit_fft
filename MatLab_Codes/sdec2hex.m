function h = sdec2hex(d,n)
%SDEC2HEX Convert signed decimal integer to hexadecimal string.
%   SDEC2HEX(D) returns a 2-D string array where each row is the
%   hexadecimal representation of each decimal integer in D.
%   D must contain signed integers smaller than 2^52.
%
%   SDEC2HEX(D,N) produces a 2-D string array where each
%   row contains an N digit hexadecimal number.
%
%   Example
%       sdec2hex(-2748) returns 'F544'.
%
%   See also DEC2HEX, HEX2DEC, HEX2NUM, DEC2BIN, DEC2BASE.
%   Modified from the DEC2HEX by MathWorks, Inc.
bits32 = 4294967296;       % 2^32
if nargin<1
    error(nargchk(1,2,nargin,'struct'));
end
d = d(:); % Make sure d is a column vector.
% Check input argument(s)
%   any     True if any element of a vector is a nonzero number or is
%           logical 1 (TRUE).  any ignores entries that are NaN (Not a Number).
%   fix     Round towards zero.
if ~isreal(d) || any(d ~= fix(d))
    error(message('MATLAB:dec2hex:FirstArgIsInvalid'))
end
if any(d > 1/eps)
    warning(message('MATLAB:dec2hex:TooLargeArg'));
end
% Get dimension of the input
numD = numel(d);
if nargin==1,
    n = 1; % Need at least one digit even for 0.
end
%   log2    Base 2 logarithm and dissect floating point number.
[~,e] = log2(double(max(abs(d))));
n = max(n,ceil(e/4));
% MOD: Handle negative numbers by adding enough sign bit part
if nargin==1 && any(d<0)
    n = n + 1;
end
n0 = n;
if numD>1
    n = n*ones(numD,1);
end
% MOD: Handle negative numbers by adding negative to most positive number
d(d<0) = 16.^(n(d<0)) + d(d<0);
%For small enough numbers, we can do this the fast way.
if all(d<bits32),
    % sprintf   Write formatted data to string.
    %   To specify field width or precision using values from a sequential 
    %   argument list, use an asterisk (*) in place of the field width or 
    %   precision field of the formatting operator. E.g. n - width for d:
    h = sprintf('%0*X',[n,d]');
else
    %Division acts differently for integers
    d = double(d);
    d1 = floor(d/bits32);
    d2 = rem(d,bits32);
    h = sprintf('%0*X%08X',[n-8,d1,d2]');
end
h = reshape(h,n0,numD)';
