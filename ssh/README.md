## SSH

Right after writing this, I read an article sent by [pointer.io][pointer]. That article is more detailed and can be found [here][teleport]. But in short:

Generate a new key using the `ssh-keygen` command:

    $ ssh-keygen -t ed25519 -C "your_email@example.com"

Typically, use the defaults as they work well with a majority of use cases.

Copy the output of `cat ~/.ssh/id_ed25519.pub` and put in into your GitHub SSH settings.

## Using an SSH config file / Creating Identity Files

For more advanced options, you can configure keys for servers you regularly visit:

Create a config file, if not already created:

    $ touch ~/.ssh/config

Add your required parameters and optionally an `IdentityFile`, is simply another generated private key, just like our `~/.ssh/id_rsa`.

    Host example_server
         User sparkler
         HostName 23.222.222.2
         IdentityFile ~/.ssh/example/id_rsa

To generate an `IdentityFile`, run the follow, replacing the `-f` flag with your desired file location.

    $ ssh-keygen -f ~/example/id_rsa -t rsa -b 4096


After saving, you can open a new SSH session to this server by running this command:

    $ ssh example_server

You can append as many hosts as you need to your config file.

## Debugging SSH

Sometimes we run into issues trying to SSH into a server. Do we have the wrong username? Did we incorrectly store our HostName? Running SSH commands in verbose mode can help us debug our ssh connection.

Verbose mode causes ssh to print debugging messages about its progress. It is run by adding the `-v` flag. Multiple v’s increase the verbosity of the messages (with a maximum of three) e.g. `-v` vs `-vvv`.  Additionally, you can create a log file (instead of a standard error) with the `-E` flag followed by the name of the file you want to save. So an example of a verbose ssh connection with errors logged would be this:

    $ ssh example_server -vvv -E log_file

Run `man ssh` for additional parameters you can run with ssh.

*Note, much of the above is originated from the [Sparkbox Standard][sparkbox_original_post]*

[keygen]:https://www.ssh.com/ssh/keygen/
[pki]: http://www.techrepublic.com/article/a-beginners-guide-to-public-key-infrastructure/
[sparkbox_original_post]:https://github.com/sparkbox/standard/tree/main/software/ssh#using-an-ssh-config-file--creating-identity-files
[teleport]:https://goteleport.com/blog/how-to-set-up-ssh-keys
[pointer]:http://www.pointer.io/