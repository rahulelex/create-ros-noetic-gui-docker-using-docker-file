# create-ros-noetic-gui-docker-using-docker-file
This docker file create a docker image which is GUI image with the base image osrf/ros:noetic-desktop and installs linux and ros packages.

To automate your docker place your script path or commands in the ros_entrypoint.sh file.


### Command to run this Dockerfile and create a docker image
```sh
sudo docker build -t image_name:image_tag .
```

### To run docker container with GUI interface
```sh
sudo docker run -itd -p 8060:80 --name my_container image_name:image_tag
```

## License
**Free Software, Hell Yeah!**

## Authors
- [Rahul Gupta](https://github.com/rahulelex)