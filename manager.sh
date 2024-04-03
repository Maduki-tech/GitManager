#! /bin/bash

isGitDir () {
    if [ -d .git ]; then
        return 0
    else
        return 1
    fi
}


branchIsDevelop () {
    if [ $(git rev-parse --abbrev-ref HEAD) == "development" ]; then
        return 0
    else
        return 1
    fi
}

for dir in *; do
    if [ -d $dir ]; then
        cd $dir
        if isGitDir && branchIsDevelop; then
            echo "Pulling $dir"
            git pull
        else
            echo "Skipping $dir"
        fi
        cd ..
    fi
done
