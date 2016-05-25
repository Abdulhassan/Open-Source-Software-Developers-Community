% % url=input('Please Enter URL address in JSON language: ','s');
% % web(url);
% [stat,h]=web(url)
% close(h)
% load 'C:\Users\Mustafa\Desktop\software mohammad\microsoft.jason'

 
 Ustart='!Curl -i https://api.github.com/users/'
 Uend='i?access_token=0037438a16620feecc7b3c172f2e93bda9cf92c3&'
%  [f1 ,p]=uigetfile();  ff=strcat(p,f1)
%  Extract_User_name(ff);
 %%-----------------------------Read names
 fileID = fopen('C:\Users\Mustafa\Desktop\software mohammad\Organizations_list.txt') 
 f2=fopen(fileID);
i=1;
 while ~feof(fileID)
 S=fgetl(fileID)
 if  ischar(S)
              A{i}=S;
              i=i+1;
 end
 end
fclose('all');
Users=unique(A);
% % % %%----------------------get url for each User in Users array ---------------------
%ur='https://api.github.com/users/';
 destination='C:\Users\Mustafa\Desktop\software mohammad\programs matlab\f1.txt'; % file that store information about each user according to its name
 target='C:\Users\Mustafa\Desktop\software mohammad\Software_user_information.txt';
 targt=fopen(target, 'a+');

fprintf(targt,'%s%s','Login ','  ');
fprintf(targt,'%s%s','Name   ','  ');
fprintf(targt,'%s%s','Location','  ');
fprintf(targt,'%s%s','e_mail',' ');
fprintf(targt,'%s%s','Public_repos','  ');
fprintf(targt,'%s%s','Public_gits','  ');
fprintf(targt,'%s%s','followers','  ');
fprintf(targt,'%s%s','created_at','   ');
fprintf(targt,'%s\n','    ');


 for i=1: length(Users)
    if Users{i}==' '
        continue ;
    else
        
        url1=strcat('!curl -i https://api.github.com/users/' ,Users{i});
      %  url=strcat(url1,'?access_token=0037438a16620feecc7b3c172f2e93bda9cf92c3 >C:\Users\Mustafa\Desktop\software mohammad > f1.txt&');
         % url=strcat(ur,Users{i});
        
       try
        url=strcat(url1,'?access_token=0037438a16620feecc7b3c172f2e93bda9cf92c3 >C:\Users\Mustafa\Desktop\software mohammad > f1.txt&');
          
        eval(url)
        pause(5);
       catch
          I=i;  %url=' '; url=strcat( Ustart,Users{i}); url=strcat(url,Uend);
         break;% pause(3700);
         % urlwrite( url,destination);
       end;
     fprintf(targt,'%s',Users{i});
     fprintf(targt,'%s',' ');
     User_Name(destination,targt);
   end;
 end;                   
    
%%------------------end of reading names-----------------
%  
%  fclose('all');
% % https://api.github.com/users/  value from file   %%%%%%%%%% IMPORTANT
% % stat = web('https://api.github.com/users/aayushgarg   ', '-browser')  % stat=0 the browser find file and luch it successfuly
% % str = urlread('https://api.github.com/users/aayushgarg')% convert information in link into matlab workspace variable
% % urlwrite('https://api.github.com/users/aayushgarg','C:\Users\Mustafa\Desktop\software mohammad\f1.txt')  %%%% save url content to txt file 