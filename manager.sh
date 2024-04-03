#! /bin/bash
isGitDir() {
    if [ -d .git ]; then
        return 0
    else
        return 1
    fi
}

branchIsDevelop() {
    if [ "$(git rev-parse --abbrev-ref HEAD)" == "development" ]; then
        return 0
    else
        return 1
    fi
}

handleGitPull() {
    if isGitDir && branchIsDevelop; then
        git pull
    else
        echo "$dir is not a git directory or branch is not development"
    fi
}

main() {
    for dir in *; do
        if [ -d "$dir" ]; then
            cd "$dir" || exit
            handleGitPull
            cd ..
        fi
    done
}
main
