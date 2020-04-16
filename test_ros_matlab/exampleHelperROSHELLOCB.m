% function exampleHelperROSHELLOCB(~, message)
%     %exampleHelperROSChatterCallback - ROS subscriber callback function to display data
%     %   from the message.
%     %   exampleHelperROSChatterCallback(~,MESSAGE) returns no arguments- it simply displays
%     %   message content.
%     %   
%     %   See also ROSPublishAndSubscribeExample
%   
%     
%     disp('Chat Callback message data: ');
%     i = 0;
%     while(i<10)
%         i= i+1;
%         message.Data
%         i
%     end
% end



function exampleHelperROSHELLOCB(~, ~, handles)
    %exampleHelperROSSimTimer - Timer update function called in startExamples to publish
    %   messages at well-defined intervals
    %   exampleHelperROSSimTimer(~,~,HANDLES) publishes /pose and /scan messages at
    %   regular intervals. The /scan message value remains constant while
    %   the /pose message value changes continually.
    %   
    %   See also exampleHelperROSCreateSampleNetwork
    
    
    % Update the pose message values
    if isvalid(handles.node1pub)
        
        handles.node1msg = handles.node1msg;
        
        % Publish the scan and pose messages
        send(handles.node1pub,handles.node1msg);
    end

    if isvalid(handles.node2pub)
               
        %%% handles.twistPubmsg.Linear.X = handles.twistPubmsg.Linear.X + (rand(1)-0.5)./10;
        handles.node2msg.X = handles.node2msg.X + (rand(1)-0.5)./10;
        handles.node2msg.Y = handles.node2msg.Y + (rand(1)-0.5)./10;
        handles.node2msg.Z = handles.node2msg.Z + (rand(1)-0.5)./10;
        
        % Publish the scan and pose messages
        send(handles.node2pub,handles.node2msg);

    end
end
