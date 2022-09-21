function C = nCk(n,k)
% Returns the Binomial coefficient for each element in k for a given scalar n.
% K may have any shape
% N must be scalar.
%
% Example:
%   k = [4 5 6];
%   n = 10;
%   C = nCk(n,k)
%
%   C =
%           210          252          210
%
%   See also nchoosek, perms.

% Copyright Eyal Ben-Hur (eyal.ben-hur@mail.huji.ac.il)
%               The Hebrew University in Jerusalem

% use smaller k if available
kvec = k(:);
kvec(kvec>n/2) = n-kvec(kvec>n/2);
% first case:
kmat = ones(numel(kvec),1)*(1:max(n-kvec));
kmat = kmat.*bsxfun(@le,kmat,(n-kvec));
pw = bsxfun(@power,kmat,-1./(n-kvec));
pw(kmat==0) = 1;
kleft = ones(numel(kvec),1)*(min(kvec):n);
kleft = kleft.*bsxfun(@gt,kleft,kvec);
t = bsxfun(@times,kleft,prod(pw,2));
t (kleft==0) = 1;
C = reshape(prod(t,2),size(k));
end