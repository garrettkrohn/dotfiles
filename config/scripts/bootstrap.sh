rebuild=false
start_up_script=true

print_help() {
    echo -e "\nScript to bootstrap db with user info and possibly start up script\n"
    echo "Flags:"
    echo "  -rebuild    -- rebuilds the bootstrap container"
    echo "  -clean      -- bootstraps without seed data"
    exit 0
    
}

print_pink() {
    local text="$1"
    echo -e "\033[1;35m\n$text\n\033[0m"
}

## Parse the arguments
for arg in "$@"
do
    case $arg in
        -h)
            print_help
            ;;
        -rebuild)
            rebuild=true
            ;;
        -clean)
            start_up_script=false
            ;;
    esac
done

if $rebuild; then

    print_pink "destroying bootstrap container"
    docker ps -a --filter "name=bootstrap" --format "{{.ID}}" | xargs docker stop 
    docker ps -a --filter "name=bootstrap" --format "{{.ID}}" | xargs docker rmi --force

    docker images --format '{{.Repository}}:{{.Tag}} {{.ID}}' | grep "bootstrap" | awk '{print$2}' | xargs docker rmi --force

    docker rm $(docker ps -a --filter "name=^/bootstrap$" --format "{{.ID}}")

    docker-compose up bootstrap -d --build
else
    docker-compose up bootstrap -d 
fi

if $start_up_script; then
    print_pink "Running seed script"
    PGPASSWORD='postgres' psql -h localhost -p 4432 -U postgres -d novaapi -f ~/dotfiles/config/scripts/platform_startup_script.sql
fi
