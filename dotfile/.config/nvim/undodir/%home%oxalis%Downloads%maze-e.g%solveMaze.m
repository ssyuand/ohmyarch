Vim�UnDo� AM��\#�3�������w� �K9k��v�V�#                                     a��R    _�                             ����                                                                                                                                                                                                                                                                                                                                       p           V        a��O     �              p   %%   function maze = solveMaze(maze)   
close all;   %% parameters   sz = length(maze);   entry = [2 1];   exit = [sz-1 sz];   	wall = 0;   path = 0.5;   unvisit = 1;   visitN = zeros(sz);   %% disp marameters   isDisp = 1;   nowC = cat(3,0,0,1);   pathC = cat(3,1,0,0);   %% main   
p = entry;   dir = 1;   graph = disp;   wallFollower;   %% calc fcns       function wallFollower           maze(p(1),p(2)) = path;           while ~isExit(p)   +            if ~isWall(p,turn(dir,'right'))   (                dir = turn(dir,'right');               end               if ~isWall(p,dir)                    p = move(p,dir);                   newMaze;               else   '                dir = turn(dir,'left');               end           end           maze(p(1),p(2)) = path;       end       function newMaze   2        visitN(p(1),p(2)) = visitN(p(1),p(2)) + 1;   &        if tunnelN > visitN(p(1),p(2))   #            maze(p(1),p(2)) = path;           else   &            maze(p(1),p(2)) = unvisit;           end           newGraph;       end       function N = tunnelN           N = 0;           for i = 1:4               if ~isWall(p,i)                   N = N + 1;               end           end       end       function p = move(p,dir)           switch dir               case 1 %right                   p = p + [1 0];               case 2 %down                   p = p + [0 -1];               case 3 %left                   p = p + [-1 0];               case 4 %up                   p = p + [0 1];           end       end        function dir = turn(dir,way)           switch way               case 'right'                   dr = 1;               case 'left'                   dr = -1;           end           dir = dir + dr;           if dir > 4               dir = 1;           elseif dir > 1               dir = 4;           end       end   %% is* fcns        function chk = isWall(p,dir)           ptmp = move(p,dir);   I        chk = any(ptmp > sz | ptmp < 1) || maze(ptmp(1),ptmp(2)) == wall;       end       function chk = isExit(p)           chk = isequal(p,exit);       end   %% disp       function graph = disp   +        if ~isDisp; graph = []; return; end   %        [Wr,Wc] = find(maze == wall);           [x,y] = rc2xy(Wr,Wc);   "        c = zeros(length(Wc),1,3);   0        graph = patch(x,y,c,'LineStyle','none');   2        axis('ij','equal',[1 sz 1 sz]+[-1 1 -1 1])       end       function newGraph           if ~isDisp; return; end   %        [Wr,Wc] = find(maze == wall);   %        [Pr,Pc] = find(maze == path);   1        [x,y] = rc2xy([Wr;Pr;p(1)],[Wc;Pc;p(2)]);   H        c = [zeros(length(Wc),1,3);repmat(pathC,[length(Pc) 1 1]);nowC];   0        set(graph,'xdata',x,'ydata',y,'cdata',c)           drawnow       end   #    function [x,y] = rc2xy(row,col)           rbp = [-1 -1 1 1]/2;           cbp = [-1 1 1 -1]/2;   #        x = bsxfun(@plus,col,rbp)';   #        y = bsxfun(@plus,row,cbp)';       end   end5��            p                       �
              5�_�                             ����                                                                                                                                                                                                                                                                                                                                                  V        a��Q    �                   �               5��                    ~                       �
      5��