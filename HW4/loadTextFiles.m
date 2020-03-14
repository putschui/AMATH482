function [urlList] = loadTextFiles(filename)
% Takes a list of urls in text form and creates a vector with the urls
fileID = fopen(filename, 'r');
urls = textscan(fileID,'%s','Delimiter','\n');
urls = urls{1,1};
urlList = strings(length(urls),1);

for j = 1:length(urls)
    urlList(j) = urls{j,1};
end

fclose(fileID);
end

