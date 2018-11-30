function udp_send_demo(fun,host,port)

if nargin<1, fun='sin(0:0.1:6)'; end
if nargin<2, host='localhost'; end
if nargin<3, port='3333'; end
data=evalin('caller',fun);
udp=pnet('udpsocket',1111);
if udp~=-1,
  try, % Failsafe
    pnet(udp,'write',data);              % Write to write buffer
    pnet(udp,'writepacket',host,port);   % Send buffer as UDP packet
  end
  pnet(udp,'close');
end;