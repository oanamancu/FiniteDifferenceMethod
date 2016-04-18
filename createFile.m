function[]=createFile(fileName,eps,x,uEx,ux)
   f=fopen(['FrontEnd/' fileName '.html'],'w');
   
   fprintf(f,'<!DOCTYPE html>\n');
   fprintf(f,'<html>\n');
   fprintf(f,'<body>\n');
   
   createImage(fileName,eps,x,uEx,ux);
   fprintf(f,['<img src="img/png/' fileName '.png" style="width:auto; max-width:100%%;  display: block; margin: 0 auto; "/>\n']);
   
   fprintf(f,'<div style="text-align:center">\n');
   makeColumn(f,x,'0','X');
   makeColumn(f,uEx,'26%%','Solutie Exacta');
   makeColumn(f,ux,'23%%','Solutie FDM');
   fprintf(f,'</div>\n');
   
   fprintf(f,'</body>\n');
   fprintf(f,'</html>\n');
   
   fclose(f);
end


function []=createImage(fileName,eps,x,uEx,ux)
   plot(x,uEx,'--go',x,ux,':r*');
   hold on;
   title([fileName ' eps=' num2str(eps)]);
   legend('Solutia Exacta', 'Solutie FDM');
   print(strcat('FrontEnd/img/eps/',fileName),'-depsc');
   print(strcat('FrontEnd/img/png/',fileName),'-dpng');
   close;

end



function[]= makeColumn(f,v,margin,titluColoana)
  fprintf(f,['<div style="display: inline-block;  margin-left:' margin '">\n']);
  fprintf(f,['<h3 style="text-decoration: underline">' titluColoana '</h3>\n']);
  fprintf(f,'</br>');
    for i=1:length(v)
       fprintf(f,[num2str(v(i)) '<br/>']);
    end
  fprintf(f,'</div>\n');
  
end



