#Specify a base Image
# we can check tags from here -> https://hub.docker.com/_/node
FROM node:14-alpine AS builder

#Setting Default current directory for docker & all files will store in /usr/app/
WORKDIR /usr/app

#Install some dependency
#copy from current project to docker current path,so that it will able to find package file & installed it
#change in any code file will not run npm install, instead npm install will cached & will install only if changes in package file
COPY ./package.json ./
RUN npm install
COPY ./ ./

#Default Command
CMD ["npm","run","start"]
#CMD ["npm","start"] #Exercise 1

#FROM nginx
#COPY --from=builder /usr/app/build /usr/share/ngnix/html

###################################################
###################################################
#Notes
###################################################
###################################################
#Syntax = docker build -t Docker_Id/Project_Name:latest .
#build command for generating image in docker = docker build -t vparmar999/learningdocker:latest .
#Run Project = docker run -p 5000:8080 vparmar999/learningdocker:latest
#http://localhost:5000

##Container port Mapping or port forwarding "-p 5000:8000" => Incoming_Port:Container_Docker_Port

##Working with shell
#docker ps
#docker exec -it Container_ID sh

#docker-compose.yml file = to start all these services at one time or multi-container in same file or to maintain network
#Multiple Docker Container start & stop = docker-compose up -d : docker-compose down 


##Automatic Refresh Page without Rebuilding Image default functionality of React ->  Volume
#It will map Files from local folder to Docker Container
#docker run -p 5000:8080 -v /app/node_modules -v $(pwd):/app <image Id> #use in git bash or provide full path
#Both -v arguments are necessary
#First -v argument - Ignore Docker file mapping to local mapping (eg node_module present in Container but not in local)
#Second -v argument - It will map docker file to local file
#Instead of using above docker run command just add in docker Compose File

###############################
#Run File using Docker Compose
#docker-compose up
