#!/bin/bash

destroy_db=false
skip_tests=false
clean=false

print_help() {
    echo -e "\nScript for running Platform's backend\n"
    echo "Flags:"
    echo "  -db         -- will destroy the database and authenticator"
    echo "  -skipTests  -- will skip the tests in the maven build process"
    echo "  -clean      -- perform mvn clean install"
    exit 0
}

## Parse the arguments
for arg in "$@"
do
    case $arg in
        -h)
            print_help
            ;;
        -db|-d)
            destroy_db=true
            ;;
        -skipTests|-s)
            skip_tests=true
            ;;
        -clean|-c)
            clean=true
            ;;
    esac
done

print_pink() {
    local text="$1"
    echo -e "\033[1;35m\n$text\n\033[0m"
}

destroy_db_and_auth() {
    print_pink "\n===removing db and authenticator==="

    # getting the image and volume names
    folderName=$(pwd | awk -F'/' '{print $NF}')
    imageName="${folderName}-db"
    volumeName="${foldername}_db_data"
    docker stop db 
    docker rm db 
    docker rmi ${imageName}
    docker volume rm ${volumeName}

    docker-compose down --volumes --rmi all

    docker ps -a --filter "name=authenticator" --format "{{.ID}}" | xargs docker stop

    docker images --format '{{.Repository}}:{{.Tag}} {{.ID}}' | grep "authenticator" | awk '{print$2}' | xargs docker rmi --force

    docker rm $(docker ps -a --filter "name=^/authenticator$" --format "{{.ID}}")


    docker-compose up db authenticator -d --build
}

# handle a graceful exit
handle_sigint() {
    echo "Caught SIGINT signal! Stopping Java application..."
    kill $java_pid
    wait $java_pid 2>/dev/null
    exit 0
}

# Trap SIGINT (Ctrl+C) and call the handle_sigint function
trap 'handle_sigint' SIGINT

#########################
####     MAIN   #########
#########################

cd "$(git rev-parse --show-toplevel)"

if $destroy_db; then
    destroy_db_and_auth
fi

# PARENT BUILD
print_pink "\nBUILDING PARENT LOCALLY\n"

cd parent

if $skip_tests; then
    print_pink "Maven Install, skip tests"
    mvn install -DskipTests
elif $clean; then
    print_pink "Maven Install Clean"
    mvn clean install 
else 
    print_pink "Maven Install"
    mvn install
fi

# exit on error
if [ $? -ne 0 ]; then
  echo "Maven install failed."
  exit 1
fi

print_pink "run java container"

java -jar -Dspring.profiles.active=local ./application/target/application-1.0-SNAPSHOT.jar &
java_pid=$! 

# Wait for the Java process to finish
wait $java_pid
