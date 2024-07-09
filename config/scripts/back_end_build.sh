#!/bin/bash

destroy_db=false
skip_tests=false

## Parse the arguments
for arg in "$@"
do
    case $arg in
        -db)
            destroy_db=true
            ;;
        -skipTests)
            skip_tests=true
            ;;
    esac
done

print_pink() {
    local text="$1"
    echo -e "\033[1;35m\n$text\n\033[0m"
}

destroy_db_and_auth() {
    print_pink "\n===removing db and authenticator==="

    print_pink "stopping and destroying the db"
    # getting the image and volume names
    folderName=$(pwd | awk -F'/' '{print $NF}')
    imageName="${folderName}-db"
    volumeName="${foldername}_db_data"
    docker stop db 
    docker rm db 
    docker rmi ${imageName}
    docker volume rm ${volumeName}

    print_pink 'taking down the rest'
    docker-compose down --volumes --rmi all

    print_pink "stopping authenticator container"
    docker ps -a --filter "name=authenticator" --format "{{.ID}}" | xargs docker stop

    print_pink 'removing authenticator image'
    docker images --format '{{.Repository}}:{{.Tag}} {{.ID}}' | grep "authenticator" | awk '{print$2}' | xargs docker rmi --force

    print_pink "stopping bootstrap container"
    docker ps -a --filter "name=bootstrap" --format "{{.ID}}" | xargs docker stop 
    docker ps -a --filter "name=bootstrap" --format "{{.ID}}" | xargs docker rmi --force

    print_pink 'removing bootstrap image'
    docker images --format '{{.Repository}}:{{.Tag}} {{.ID}}' | grep "bootstrap" | awk '{print$2}' | xargs docker rmi --force

    print_pink "starting the containers"
    docker-compose up db authenticator -d --build
}

#########################
####     MAIN   #########
#########################

cd "$(git rev-parse --show-toplevel)"

if destroy_db; then
    destroy_db_and_auth
fi

# PARENT BUILD
print_pink "\nBUILDING PARENT LOCALLY\n"

cd parent

if skip_tests; then
    print_pink "Maven Install, skip tests"
    mvn install -DskipTests
else
    print_pink "Maven Install"
    mvn install
fi

print_pink "run java container"
java -jar -Dspring.profiles.active=local ./application/target/application-1.0-SNAPSHOT.jar &
