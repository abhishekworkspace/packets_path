function udp_plotter_demo(lport)

  if nargin<1, lport=9899; end
  % Message
  disp ' ';
  disp 'Send packages';
  disp(sprintf('   Use:   udp_send_demo sin(0:0.1:6)  '));
  disp 'or';
  disp(sprintf('   Use:   udp_send_demo sin(0:0.1:6)  HOSTNAME'));
  disp ' ';
  % figure
  fg=figure;
  clf; axis; drawnow;
  % Open  udpsocket and bind udp port adress to it.
  udp=pnet('udpsocket',lport);
  
  try,
    while 1,
      % Wait/Read udp packet to reed buffer
      len=pnet(udp,'readpacket');
      if len>0,
	% if packet larger then 1 byte then read maximum of 1000 doubles in network byte order
	data=pnet(udp,'read',1000,'double');
	figure(fg);
 
	plot(data);
      end
      drawnow;
    end
  end
 
  pnet(udp,'close');
  delete(fg);
  return;