# Use the official ROS Noetic base image with GUI (contains X11)
FROM osrf/ros:noetic-desktop

# Set environment variables for non-interactive installation to prevent prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install additional ROS packages (replace 'ros-noetic-package' with your desired packages)
RUN apt-get update && apt-get install -y \
    nano \
    vim \
    net-tools \
    iputils-ping \
    zip \
    ros-noetic-ros-core \
    && rm -rf /var/lib/apt/lists/*

# Create a non-root user (change 'ubuntu' to your preferred username)
# RUN useradd -m -s /bin/bash ubuntu
# USER ubuntu

# Initialize ROS workspace (optional)
RUN mkdir -p /home/ubuntu/catkin_ws/src 

# Source the ROS setup.bash
RUN echo "source /opt/ros/noetic/setup.bash" >> /home/ubuntu/.bashrc

# Install X11 server (if not already installed)
RUN apt-get install -y x11-apps

# Set the default ROS workspace
ENV CATKIN_WS=/home/myuser/catkin_ws
WORKDIR $CATKIN_WS

# Copy the entrypoint.sh script into the image (assuming it's in the same directory as your Dockerfile)
COPY ros_entrypoint.sh /ros_entrypoint.sh

# Build the workspace by first placing your ROS packages here then build
# RUN cd /home/ubuntu/catkin_ws && catkin_make -j3

# Expose the X11 socket to enable GUI applications
ENV DISPLAY=:0

# Run bash as the default command
CMD ["/bin/bash"]
