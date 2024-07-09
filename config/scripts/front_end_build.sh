skipBuild=false

## Parse the arguments
for arg in "$@"
do
    case $arg in
        -skipBuild)
            skipBuild=true
            ;;
    esac
done

#########################
####     MAIN   #########
#########################

cd "$(git rev-parse --show-toplevel)"
cd ui

fnm use 18.16.0 
if ! $skipBuild; then
    corepack enable 
    corepack prepare yarn@3.5.1 --activate 
    yarn cache clean 
    yarn install 
    yarn api 
    yarn build 
fi
yarn startAt4444 --no-open
