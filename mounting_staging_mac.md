# Mounting staging to your Mac finder

This document will describe how to mount your labs staging area from the VSC to your Mac finder. This enables you to interact with files on your staging as if your browsing your local folders.

This should work on most Macbooks but it's only tested on the few that were available to me.

1. If you don't have brew installed on your Macbook, first install brew. You can check documentation here: https://brew.sh/
2. Install `fuse-t` and `fuse-t-ssh`. You can find both install links here: https://github.com/macos-fuse-t/fuse-t
3. Create a directory in your local finder where you will mount the staging area to. Typically this can be `/Mounts/stg`. If you open your terminal you can create this folder using: `mkdir -p /Mounts/stg`.
4. Add an alias for the mounting command to your `.zshrc` file. You can do so by following these steps:
    1. Open your `.zshrc` file by, for instance, typing `nano ~/.zshrc` in your terminal.
    2. Add the following at the bottom of the file. Make sure to change the `xxxxx` to your actual staging number.
  


      ```
      alias mount-stg="sshfs login-genius:/staging/leuven/stg_xxxxx/ ~/Mounts/stg -o defer_permissions"
      alias umount-stg="umount ~/Mounts/stg"
      ```
    You might need to change `login-genius` to whatever you have the VSC login set to in your `~/.ssh/config`
   
    3. Save and exit the file. If you used `nano` you can do so by the following keypresses: `Control + X` followed by `Y` to save it and `Enter` to keep the same file name.
6. Source your zshrc file by writing `source ~/.zshrc` in your terminal

Now you should be able to open your terminal at any time and type `mount-stg` and it will mount the staging directory to your local finder. Once doing so, you will see a folder appear called `fuse-t` with your staging directory in there.
