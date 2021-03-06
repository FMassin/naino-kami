function deleteaxis

global a u  hpp hp

x = ones(length(a),1)*-1;
save x x
h=figure;
for i=1:length(a)
    u(i) = uicontrol('Parent',h,'Style','Radio','String',get(get(a(i),'YLabel'),'String'),...
    'Units','normalized','position',[0.1 i/(length(a)+1) 0.5 1/(length(a)+1)],'callback',['load x ; x(' num2str(i) ')=x(' num2str(i) ')*-1; save x x']);
end
uicontrol('Parent',h, ...
            'Style','pushbutton', ...
            'Units','normalized', ...
            'Position',[0 0 1 0.1], ...
            'String','clear', ...
            'TooltipString','clear selected axis', ...
            'Callback','close gcf;clearselected');
end

