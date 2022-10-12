function find_projects;
    find ~ -maxdepth 2 -name "*Projects" > ~/.Projects
    #echo ~/Experiments >> ~/.Projects
    for folder in (cat ~/.Projects);
        exa -1 --only-dirs $folder;
    end;
end;
function projects;
    find ~/*Projects -maxdepth 1 -name (find_projects | fzf --preview "exa --tree --level=2 ~/*Projects/{}" ) | tail -n 1
end;
function poject;
    cd (projects)
end;
