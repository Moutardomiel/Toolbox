if ($args[0] -eq "--help") {
    echo "Glitter is a git automatic tools doing multiple complex git actions to facilitate branch work."
    echo "Author -- MoutardOMiel"
    echo "Usage -- glitter [merge|add] (Args)"
}
elseif ($args[0] -eq "merge") {
    if ($args[1] -eq "--help") {
        echo "Usage -- glitter merge (branch_to_merge_in)"
        echo "Warning -- This does not fix merge conflict. You need to fix them yourself"
        echo "This fetch, pull the current, and merge the target selected branch. You will need to use add to commit the merge."
    } else {
        git fetch --all
        git merge $args[1]
    }
}
elseif ($args[0] -eq "add") {
    if ($args[1] -eq "--help") {
        echo "Usage -- glitter add (message)"
        echo "This commit the current changes (stashed include), and push on the current branch"
    } else {
        git add --all
        git commit -m $args[1]
        git push
    }
} else {
    echo "Error: No arguments provided. Use --help for usage."
    exit 1
}