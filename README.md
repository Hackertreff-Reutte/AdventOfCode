# Advent of Code


## How to clone
Make sure to have the ssh-agent enabled, otherwise you will need to enter
your password a lot
```
 eval $(ssh-agent)
```

If you have the agent enabled you can use the following command to clone the
repository.
```
git clone --recurse-submodules -j8 git@github.com:Hackertreff-Reutte/AdventOfCode.git
```

## Windows

If you are a windows user than the symbolic links won't work. To create working symbolic links you can use the ```create_windows_symlinks.bat```
script provided by the repo. This script will create a working windows
symlink with the naming scheme (\<original_symlink_name\> + "_win").