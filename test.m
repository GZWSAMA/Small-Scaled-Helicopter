close all

figure(1)
plot3(out.simout.Data(1,:),out.simout.Data(2,:),out.simout.Data(3,:));
hold on
plot3(out.simout1.Data(1,:),out.simout1.Data(2,:),out.simout1.Data(3,:));
zlim([-10,10])