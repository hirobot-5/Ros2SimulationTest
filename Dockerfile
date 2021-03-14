FROM ubuntu:18.04
SHELL ["/bin/bash", "-c"]
RUN apt update && apt install -y \
    vim \
    tzdata \
    locales \
    curl \
    gnupg2 \
    lsb-release \
&& curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add - \
&& sh -c 'echo "deb [arch=$(dpkg --print-architecture)] http://packages.ros.org/ros2/ubuntu $(lsb_release -cs) main" > /etc/apt/sources.list.d/ros2-latest.list' \
&& apt update && apt install -y \
    ros-eloquent-desktop \
    ros-eloquent-ros-base \
    ros-eloquent-gazebo-ros-pkgs \
    ros-eloquent-ros-core\
    ros-eloquent-geometry2\
    ros-eloquent-rqt* \
    ros-eloquent-ros2bag\
    ros-eloquent-rosbag2-converter-default-plugins\
    ros-eloquent-rosbag2-storage-default-plugins\
    python3-pip \
    git\
    python-rosdep\
    python3-colcon-common-extensions\
    && pip3 install -U argcomplete
RUN rosdep init
RUN rosdep update 
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
RUN export LANG=en_US.UTF-8
RUN echo "source /opt/ros/eloquent/setup.bash" >> ~/.bashrc
#RUN echo "source /usr/share/colcon_cd/function/colcon_cd.sh" >> ~/.bashrc




