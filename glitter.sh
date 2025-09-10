#!/bin/bash

if [ "$1" == "--help" ]; then
    echo "Glitter is a git automation tool for simplifying complex git workflows."
    echo "Author -- MoutardOMiel"
    echo "Usage -- glitter [merge|add] (Args)"

elif [ "$1" == "merge" ]; then
    if [ "$2" == "--help" ] || [ -z "$2" ]; then
        echo "Usage -- glitter merge (branch_to_merge_in)"
        echo "Warning -- This does not fix merge conflicts. You need to fix them yourself."
        echo "This fetches, pulls the current, and merges the target selected branch. You will need to use 'add' to commit the merge."
    else
        git fetch --all
        git merge "$2"
    fi

elif [ "$1" == "add" ]; then
    if [ "$2" == "--help" ] || [ -z "$2" ]; then
        echo "Usage -- glitter add (message)"
        echo "This commits the current changes (including stashed ones), and pushes to the current branch."
    else
        git add --all
        git commit -m "$2"
        git push
    fi

else
    echo "Error: Unknown command '$1'. Use --help for usage."
fi