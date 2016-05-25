
%% -------------- Read any file using the open text box  
% [f1 ,p]=uigetfile(); % f=strcat(p,f1)
f1=fopen('C:\Users\Mustafa\Documents\GitHub\Facebook.txt','r');
f2=fopen('C:\Users\Mustafa\Desktop\software mohammad\facebook_name.txt', 'w');

% ur='https://api.github.com/users/';
% destination='C:\Users\Mustafa\Desktop\software mohammad\f1.txt'; % file that store information about each user according to its name
% target='C:\Users\Mustafa\Desktop\software mohammad\microsoft_user_names.txt';
 % urlwrite( url,destination); % save the github user information in destination file

% %% ------------------------------- End of reading file-------------------------------
User=' ';
while ~feof(f1)
 C=fgets(f1);
 if ischar(C)                      % if the line is string (not new line or parthense or any special symbol
       U = strfind(C, '"login": ');    % locate where user name is (if at all)
       if isfinite(U) == 1             % if the world ("login: ") is there the isfinite function value will be 1
                      k=strfind(C,'"login": ');         % Determine location of the word ("login: ") with in the line
                      Name=textscan(C(k+10:end),'%s')   % Save the string following the "login:" word in  Name variable 
                      k=strfind(Name{1},'",')           % to optain only the user name we should find and cut the end of the line which  known from the present of ( ",)
                      BB=Name{1}{1};                    % conver cell to char 
                      User_Name=textscan(BB(1:k{1}-1),'%s');   % extract the user name in cell User_Name
                      User=User_Name{1}{1} ;            % convert cell to char to place it in file 
                      fprintf(f2,'%s',User);
                       fprintf(f2,'%s\n',' ');
  
       else
          continue;
       end
 end;
end
% fclose(f1);
% fclose(f2);
fclose('all');


%%-----------------------Save to ext file 
% [f1 ,p]=uigetfile();
%  f=strcat(p,f1)
% f2=fopen(f,'w')
% for i=1 :2: length(d)
% fprintf(f2,'%s',d{i+1});
% fprintf(f2,'%s', '  ');
% fprintf(f2,'%s', d{i});
% fprintf(f2,'%\n');


