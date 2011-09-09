function plot_WFexist


if exist('plot_NNK.mat','file')== 2
    load plot_NNK.mat ;
end

if exist('pathname','var')==1;if ischar(pathname) == 1
        
        lesstat = char(importdata([pathname stat]));
        lescompo = char(importdata([pathname compo])) ;
        lespha = ['P waves' ; 'S waves' ; 'Coda   '];

        choixsta = reshape([lesstat repmat(' |',size(lesstat,1),1)]',1,size(lesstat,1)*(size(lesstat,2)+2));
        choixsta=choixsta(1:length(choixsta)-2);
        
        choixcpn = reshape([lescompo repmat(' |',size(lescompo,1),1)]',1,size(lescompo,1)*(size(lescompo,2)+2));
        choixcpn=choixcpn(1:length(choixcpn)-2);
        
        choixpha = reshape([lespha repmat(' |',size(lespha,1),1)]',1,size(lespha,1)*(size(lespha,2)+2));
        choixpha=choixpha(1:length(choixpha)-2);



        % affiche infos %%%%%%%%%%%%%%%%
        disp('Plot cross-correlation coefficients') ;
        disp('Module plot_CCC.m  ...')

        resizeeffect(fh,bar1)
        clf(fh,'reset');[th,hp,pth]=plot_NNKtools(fh,backcolor,bar1);
        a = axes('parent',hp(2),'Layer','top');
        resizeeffect(fh,bar2)
         
        uicontrol('Parent',hp(1), ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',[0 29/30 1 1/30], ...
            'String','Plot existence matrix', ...
            'Callback','plot_WFexist_1(1)');
        
        h(1)=uicontrol('Parent',hp(1), ...
            'Enable','off',...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',[0 28/30 1 1/30], ...
            'String','Pick on existence matrix', ...
            'Callback','plot_WFexist_1(2)');
        
        fieldedit(1) = uicontrol('Parent',hp(1), ...
            'Units','normalized', ....
            'Style','popup', ...
            'Position',[0 26/30 1 1/30], ...
            'String',choixpha);
        
        fieldedit(2) = uicontrol('Parent',hp(1), ...
            'Units','normalized', ....
            'Style','popup', ...
            'Position',[0 25/30 1 1/30], ...
            'String',choixsta);
        
        fieldedit(3) = uicontrol('Parent',hp(1), ...
            'Units','normalized', ....
            'Style','popup', ...
            'Position',[0 24/30 1 1/30], ...
            'String',choixcpn);
        
        uicontrol('Parent',hp(1), ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',[0 23/30 1 1/30], ...
            'String','Choosen manualy', ...
            'Callback','plot_WFexist_1(3)');
        
        

        save plot_NNK.mat fieldedit hp h fieldedit a -append
        

    else disp('Please choose path before that') ;        
    end
else disp('Please choose path before that') ;
end