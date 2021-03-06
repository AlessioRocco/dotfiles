Dotfiles
========

Dotfiles and shell scripts to set up my macOS laptop for development.

Install
-------

Install the Command Line Tools:

```sh
xcode-select --install
```

Download the script:

```sh
curl --remote-name https://raw.githubusercontent.com/AlessioRocco/dotfiles/master/bin/setup
```

Review the script (avoid running scripts you haven't read!):

```sh
less setup
```

Execute the downloaded script:

```sh
sh setup 2>&1 | tee ~/setup.log
```

Optionally, review the log:

```sh
less ~/setup.log
```

License
-------

Dotfiles is (c) 2019-2021 Alessio Rocco
It is free software,
and may be redistributed under the terms specified in the [LICENSE] file.

[LICENSE]: LICENSE
