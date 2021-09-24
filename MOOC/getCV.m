function CV = getCV(x)
if ~isvector(x)
    error('x has to be a vector!')
end

CV = nanstd(x)/nanmean(x);
     