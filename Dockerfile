FROM dockerfile/nodejs

MAINTAINER HC Softech Inc. <hcsoftech@gmail.com>

# Install yo and other generators
RUN npm install -g yo bower grunt-cli gulp

# Install basic scaffolding
RUN npm install -g generator-webapp

# Install AngularJS generator
RUN npm install -g generator-angular

# Create /src  directory
RUN mkdir /src 

# Define working directory
WORKDIR /src 

# add a dev user for yo, which run as root UID (501)
# ref: https://github.com/yeoman/yeoman.io/issues/282
RUN useradd webdev

# create home dir for webdev
RUN mkdir /home/webdev

# chown /home/webdev
RUN chown webdev:webdev /home/webdev

# set $HOME point to /home/webdev, instead of /root
ENV HOME /home/webdev
