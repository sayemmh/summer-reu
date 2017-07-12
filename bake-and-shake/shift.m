function v = shift(v, s1)

if s1 > 0
  v = [v(end - s1 + 1:end), v(1:end-s1)];
else
  v = [v(-s1 + 1:end), v(1 : -s1)];
end

end
