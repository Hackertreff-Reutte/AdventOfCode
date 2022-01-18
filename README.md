# Advent of code

## Contributors

- [8-Lambda-8](https://github.com/8-Lambda-8/adventOfCode)

- [alexl4123](https://github.com/alexl4123/advent_of_code)

- [noahreinalter](https://github.com/noahreinalter/advent_of_code)

- [UnHolds](https://github.com/UnHolds/AdventOfCode)


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