function [fit_popu]=fit(popu,elitist_indi,c)
fit_popu=[];
fit_popu(:,:,1)=elitist_indi;
for i=2:size(popu,3)
    choice=fortune_wheel(c);
    fit_popu(:,:,i)=popu(:,:,choice);
end
fit_popu;
end